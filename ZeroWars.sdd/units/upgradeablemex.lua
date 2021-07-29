unitDef = {
  unitname               = [[upgradeablemex]],
  name                   = [[Metal Extractor]],
  description            = [[Produces Metal]],
  acceleration           = 0,
  activateWhenBuilt      = true,
  brakeRate              = 0,
  buildCostMetal         = 90,
  builder                = false,
  buildingMask           = 0,
  buildPic               = [[staticmex.png]],
  category               = [[UNARMED FLOAT]],
  collisionVolumeOffsets = [[0 -8 0]],
  collisionVolumeScales  = [[40 58 40]],
  collisionVolumeType    = [[ellipsoid]],
  corpse                 = [[DEAD]],

  customParams           = {
    aimposoffset       = [[0 11 0]],
    midposoffset       = [[0 0 0]],
    modelradius        = [[15]],
    removewait         = 1,
    removestop         = 1,
  },

  energyUse              = 0,
  explodeAs              = [[SMALL_BUILDINGEX]],
  floater                = true,
  footprintX             = 5,
  footprintZ             = 5,
  iconType               = [[mex]],
  idleAutoHeal           = 5,
  idleTime               = 1800,
  levelGround            = false,
  maxDamage              = 640,
  maxSlope               = 28,
  maxVelocity            = 0,
  maxWaterDepth          = 5000,
  noAutoFire             = false,
  objectName             = [[AMETALEXTRACTORLVL1.S3O]],
  onoffable              = false,
  script                 = "staticmex.lua",
  selfDestructAs         = [[SMALL_BUILDINGEX]],
  sightDistance          = 273,
  turnRate               = 0,
  waterline              = 1,
  workerTime             = 0,
  yardMap                = [[ooooooooo]],

  featureDefs            = {

    DEAD  = {
      blocking         = true,
      featureDead      = [[HEAP]],
      footprintX       = 3,
      footprintZ       = 3,
      object           = [[AMETALEXTRACTORLVL1_DEAD.s3o]],
    },


    HEAP  = {
      blocking         = false,
      footprintX       = 3,
      footprintZ       = 3,
      object           = [[debris3x3c.s3o]],
    },

  },

}

return lowerkeys({upgradeablemex = unitDef})
