function gadget:GetInfo()
    return {
        name = "Zero-Wars Mod",
        desc = "zero-k autobattler",
        author = "petturtle",
        date = "2020",
        layer = 0,
        enabled = true
    }
end

if not gadgetHandler:IsSyncedCode() then
    return false
end

local Map = VFS.Include("luarules/gadgets/util/map.lua")
local Side = VFS.Include("luarules/gadgets/zerowars/side.lua")
local Deployer = VFS.Include("luarules/gadgets/zerowars/deployer.lua")
local IdleClones = VFS.Include("luarules/gadgets/zerowars/idle_clones.lua")
local CloneTimeout = VFS.Include("luarules/gadgets/zerowars/clone_timeout.lua")
local platforms, deployRects, buildings, sideData = VFS.Include("luarules/configs/map_zerowars.lua")
local config = VFS.Include("luarules/configs/zerowars.config.lua")

local SPAWNFRAME = 1000
local UPDATEFRAME = 30

local sides = {}
local deployData = {}

local map = Map.new()
local deployer = Deployer.new()
local idleClones
local cloneTimeout = CloneTimeout.new()

local moveCtrlBuffer = {}

local function GenerateSides()
    local allyStarts = map:getAllyStarts()
    allyStarts.Left = tonumber(allyStarts.Left or 0)
    allyStarts.Right = tonumber(allyStarts.Right or 0)
    sides[allyStarts.Left] = Side.new(allyStarts.Left, allyStarts.Right, config.Left)
    sides[allyStarts.Right] = Side.new(allyStarts.Right, allyStarts.Left, config.Right)
    deployData[allyStarts.Left] = sideData.Left
    deployData[allyStarts.Right] = sideData.Right

    idleClones = IdleClones.new({
        [allyStarts.Left] = sideData.Left.attackX,
        [allyStarts.Right] = sideData.Right.attackX
    })
end

local function NextWave()
    for allyTeam, side in pairs(sides) do
        if side:hasPlatforms() then
            local platform = side:nextPlatform()
            for _, builderID in pairs(platform.builders) do
                local data = deployData[allyTeam]
                local teamID = Spring.GetUnitTeam(builderID)
                deployer:add(platform.deployZone, data.deployRect, teamID, data.faceDir, data.attackX)
            end
        end
    end
end

function gadget:GamePreload()
    GenerateSides()
end

function gadget:GameStart()
    local builders = map:replaceStartUnit("builder")
    map:setMetalStorage(600)

    for _, builderID in pairs(builders) do
        Spring.SetUnitRulesParam(builderID, "facplop", 1, {inlos = true})
        local allyTeamID = Spring.GetUnitAllyTeam(builderID)
        sides[allyTeamID]:addBuilder(builderID)
    end

    for _, side in pairs(sides) do
        side:removedUnusedPlatforms()
    end
end

function gadget:GameFrame(frame)
    if frame > 0 and frame % SPAWNFRAME == 0 then
        NextWave()
    end
    if frame > 0 and frame % UPDATEFRAME == 0 then
        cloneTimeout:clear(frame)
        idleClones:command()
    end

    local clones = deployer:deploy()
    if clones then
        cloneTimeout:add(clones, frame)
    end

    if #moveCtrlBuffer > 0 then
      for i = 1, #moveCtrlBuffer do
        Spring.MoveCtrl.Enable(moveCtrlBuffer[i], false)
      end
      moveCtrlBuffer = {}
    end
end

-- disable unit movement built by builders ( not spawned )
-- so platform units build to be cloned can't be controlled
function gadget:UnitCreated(unitID, unitDefID, unitTeam, builderID)
    if builderID then
        local ud = UnitDefs[unitDefID]
        if not (ud.isBuilding or ud.isBuilder) then
            Spring.SetUnitNeutral(unitID, true)
            moveCtrlBuffer[#moveCtrlBuffer + 1] = unitID

            if ud.customParams and ud.customParams.deploy_income then
				      local deploy_income = ud.customParams.deploy_income
				      GG.Overdrive.AddUnitResourceGeneration(unitID, 0, deploy_income, false)
            end
        end
    end
end

-- transfer clone experience to original
function gadget:UnitDestroyed(unitID, unitDefID, unitTeam)
    if Spring.GetUnitRulesParam(unitID, "clone") then
        local original = Spring.GetUnitRulesParam(unitID, "original")
        if original and not Spring.GetUnitIsDead(original) then
            Spring.SetUnitExperience(original, Spring.GetUnitExperience(unitID))
            return
        end
	end
end

function gadget:UnitIdle(unitID, unitDefID, unitTeam)
    if Spring.GetUnitRulesParam(unitID, "clone") then idleClones:add(unitID) end
end

-- disallow wreck creation
function gadget:AllowFeatureCreation(featureDefID, teamID, x, y, z)
    return false
end

function gadget:Initialize()
end

function gadget:GameOver()
    gadgetHandler:RemoveGadget(self)
end
