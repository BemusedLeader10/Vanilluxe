attribute @s minecraft:attack_speed base set 2.0
attribute @s minecraft:attack_damage base set 2.0
attribute @s minecraft:entity_interaction_range base set 2.5

scoreboard objectives add difficulty dummy
execute store result score $difficulty difficulty run difficulty

gamerule announceAdvancements true
execute if score $difficulty difficulty matches 0..1 run gamerule blockExplosionDropDecay false
execute if score $difficulty difficulty matches 2..3 run gamerule blockExplosionDropDecay true
gamerule commandBlockOutput true
gamerule commandModificationBlockLimit 32768
gamerule disableElytraMovementCheck false
gamerule disablePlayerMovementCheck false
execute if score $difficulty difficulty matches 0..1 run gamerule blockExplosionDropDecay false
execute if score $difficulty difficulty matches 2..3 run gamerule blockExplosionDropDecay true
gamerule doDaylightCycle true
gamerule doEntityDrops false
execute if score $difficulty difficulty matches 0 run gamerule doFireTick false
execute if score $difficulty difficulty matches 1..3 run gamerule doFireTick true
gamerule doImmediateRespawn false
gamerule doInsomnia true
gamerule doLimitedCrafting false
gamerule doMobLoot true
gamerule doMobSpawning true
gamerule doPatrolSpawning true
gamerule doTileDrops true
gamerule doTraderSpawning true
gamerule doVinesSpread true
gamerule doWardenSpawning true
gamerule doWeatherCycle true
execute if score $difficulty difficulty matches 0 run gamerule drowningDamage false
execute if score $difficulty difficulty matches 1..3 run gamerule drowningDamage true
gamerule enderPearlsVanishOnDeath false
execute if score $difficulty difficulty matches 0 run gamerule fallDamage false
execute if score $difficulty difficulty matches 1..3 run gamerule fallDamage true
execute if score $difficulty difficulty matches 0 run gamerule fireDamage false
execute if score $difficulty difficulty matches 1..3 run gamerule fireDamage true
gamerule forgiveDeadPlayers true
execute if score $difficulty difficulty matches 0 run gamerule freezeDamage false
execute if score $difficulty difficulty matches 1..3 run gamerule freezeDamage true
gamerule globalSoundEvents false
execute if score $difficulty difficulty matches 0..1 run gamerule keepInventory true
execute if score $difficulty difficulty matches 2..3 run gamerule keepInventory false
gamerule lavaSourceConversion false
gamerule maxCommandChainLength 65536
gamerule maxCommandForkCount 65536
gamerule maxEntityCramming 24
gamerule minecartMaxSpeed 16
gamerule mobExplosionDropDecay false
execute if score $difficulty difficulty matches 0..1 run gamerule mobGriefing false
execute if score $difficulty difficulty matches 2..3 run gamerule mobGriefing true
gamerule naturalRegeneration true
gamerule playersNetherPortalCreativeDelay 0
gamerule playersNetherPortalDefaultDelay 80
gamerule playersSleepingPercentage 33
execute if score $difficulty difficulty matches 0 run gamerule projectilesCanBreakBlocks false
execute if score $difficulty difficulty matches 1..3 run gamerule projectilesCanBreakBlocks true
gamerule randomTickSpeed 3
gamerule reducedDebugInfo false
gamerule sendCommandFeedback true
gamerule showDeathMessages true
gamerule snowAccumulationHeight 1
gamerule spawnChunkRadius 0
gamerule spawnRadius 10
gamerule spectatorsGenerateChunks false
execute if score $difficulty difficulty matches 0 run gamerule tntExplosionDropDecay false
execute if score $difficulty difficulty matches 1..3 run gamerule tntExplosionDropDecay true
gamerule universalAnger false
gamerule waterSourceConversion true

gamerule maxChunkStatus ALL
gamerule applyGravityProcessor true
gamerule applyProcessorLists true
gamerule keepJigsaws false
gamerule reloadRegistries true
gamerule syncAfterRegistryReload true

villagerconfig config features conversionChance 100
villagerconfig config features infiniteTrades false
villagerconfig config features maxDiscount 100
villagerconfig config features maxRaise 100
villagerconfig config features tradeCycling false