return {
    heropuppy = {
        unitname = [[heropuppy]],
        name = [[Hero Puppy]],
        description = [[Hero Walking Missile]],
        acceleration = 0.72,
        activateWhenBuilt = true,
        brakeRate = 4.32,
        buildCostMetal = 45,
        builder = false,
        buildPic = [[jumpscout.png]],
        canGuard = true,
        canMove = true,
        canPatrol = true,
        category = [[LAND TOOFAST]],
        collisionVolumeOffsets = [[0 0 0]],
        collisionVolumeScales = [[20 20 20]],
        collisionVolumeType = [[ellipsoid]],
        selectionVolumeOffsets = [[0 0 0]],
        selectionVolumeScales = [[28 28 28]],
        selectionVolumeType = [[ellipsoid]],
        customParams = {
            hero = true,
            modelradius = [[10]],
            canjump = 1,
            jump_range = 400,
            jump_height = 50,
            jump_speed = 12,
            jump_reload = 6,
            jump_from_midair = 1
        },
        explodeAs = [[TINY_BUILDINGEX]],
        footprintX = 2,
        footprintZ = 2,
        iconType = [[commander1]],
        idleAutoHeal = 250,
        idleTime = 200,
        leaveTracks = true,
        maxDamage = 1400,
        maxSlope = 36,
        maxVelocity = 3.5,
        maxWaterDepth = 15,
        minCloakDistance = 75,
        movementClass = [[SKBOT2]],
        noAutoFire = false,
        noChaseCategory = [[FIXEDWING]],
        objectName = [[puppy.s3o]],
        script = [[heropuppy.lua]],
        selfDestructAs = [[TINY_BUILDINGEX]],
        selfDestructCountdown = 5,
        sfxtypes = {
            explosiongenerators = {
                [[custom:RAIDMUZZLE]],
                [[custom:VINDIBACK]],
                [[custom:digdig]]
            }
        },
        sightDistance = 640,
        trackOffset = 0,
        trackStrength = 8,
        trackStretch = 0.6,
        trackType = [[ComTrack]],
        trackWidth = 12,
        turnRate = 1800,
        canManualFire = true,
        reclaimable = false,
        canSelfD = false,
        capturable = false,
        weapons = {
            {
                def = [[MISSILE]],
                badTargetCategory = [[UNARMED]],
                onlyTargetCategory = [[FIXEDWING LAND SINK TURRET SHIP SWIM FLOAT GUNSHIP HOVER]]
            },
            {
                def = [[SPAWNERMISSILE]],
                onlyTargetCategory = [[SWIM LAND SINK TURRET FLOAT SHIP HOVER]]
            }
        },
        weaponDefs = {
            MISSILE = {
                name = [[Legless Puppy]],
                areaOfEffect = 50,
                burst = 1,
                burstrate = 0.5,
                cegTag = [[VINDIBACK]],
                craterBoost = 1,
                craterMult = 2,
                customParams = {
                    burst = Shared.BURST_RELIABLE
                },
                damage = {
                    default = 400
                },
                fireStarter = 70,
                flightTime = 0.8,
                impulseBoost = 0.75,
                impulseFactor = 0.3,
                interceptedByShieldType = 2,
                model = [[puppymissile.s3o]],
                noSelfDamage = true,
                range = 250,
                reloadtime = 1.5,
                smokeTrail = false,
                soundHit = [[explosion/ex_med5]],
                soundHitVolume = 8,
                soundStart = [[weapon/missile/sabot_fire]],
                soundStartVolume = 7,
                startVelocity = 300,
                tracks = true,
                turnRate = 56000,
                turret = true,
                weaponAcceleration = 300,
                weaponType = [[MissileLauncher]],
                weaponVelocity = 400
            },
            SPAWNERMISSILE = {
                name = [[Legless Puppy]],
                commandFire = true,
                areaOfEffect = 128,
                accuracy = 512,
                burst = 4,
                burstrate = 0.3,
                cegTag = [[slam_trail]],
                craterBoost = 0,
                craterMult = 0,
                customParams = {
                    spawns_name = "jumpscout",
                    spawns_expire = 30,
                    spawn_blocked_by_shield = 1
                },
                flightTime = 12,
                fireStarter = 100,
                impulseFactor = 0,
                damage = {default = 200},
                edgeEffectiveness = 0.5,
                explosionGenerator = [[custom:MEDMISSILE_EXPLOSION]],
                interceptedByShieldType = 1,
                model = [[puppymissile.s3o]],
                soundHit = [[explosion/ex_med5]],
                soundHitVolume = 8,
                soundStart = [[weapon/missile/sabot_fire]],
                soundStartVolume = 7,
                range = 550,
                reloadtime = 16,
                smokeTrail = false,
                trajectoryHeight = 1,
                turnRate = 1000,
                turret = true,
                weaponType = [[MissileLauncher]],
                weaponAcceleration = 250,
                weaponVelocity = 250,
                startVelocity = 250,
                wobble = 5000,
                dance = 5
            }
        },
        featureDefs = {
            DEAD = {
                blocking = false,
                featureDead = [[HEAP]],
                footprintX = 3,
                footprintZ = 3,
                object = [[debris2x2a.s3o]]
            },
            HEAP = {
                blocking = false,
                footprintX = 2,
                footprintZ = 2,
                object = [[debris2x2c.s3o]]
            }
        }
    }
}