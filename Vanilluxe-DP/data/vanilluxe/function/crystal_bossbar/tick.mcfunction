execute in minecraft:the_end positioned 0 192 0 run bossbar set vanilluxe:end_crystals players @a[distance=..192]
execute in minecraft:the_end as @e[type=minecraft:end_crystal, nbt={ShowBottom:1b}] run tag @s add BossCrystal
execute store result bossbar vanilluxe:end_crystals value run execute in minecraft:the_end if entity @e[tag=BossCrystal]
execute in minecraft:the_end unless entity @e[tag=BossCrystal] run bossbar set vanilluxe:end_crystals visible false
execute in minecraft:the_end if entity @e[tag=BossCrystal] run bossbar set vanilluxe:end_crystals visible true