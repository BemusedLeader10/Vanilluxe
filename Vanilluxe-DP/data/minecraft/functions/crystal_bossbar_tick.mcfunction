#make the bar visible only to players on the end island
execute in minecraft:the_end positioned 0 192 0 run bossbar set minecraft:endcrystals players @a[distance=..192]

#mark all natural crystals with the BossCrystal tag
execute in minecraft:the_end as @e[type=minecraft:end_crystal,nbt={ShowBottom:1b}] run tag @s add BossCrystal

#set the bars status according to the amount of natural end crystals present
execute store result bossbar minecraft:endcrystals value run execute in minecraft:the_end if entity @e[tag=BossCrystal]

#make the bar invisible if there are no crystals
execute in minecraft:the_end unless entity @e[tag=BossCrystal] run bossbar set minecraft:endcrystals visible false

#make the bar visible again if there are crystals
execute in minecraft:the_end if entity @e[tag=BossCrystal] run bossbar set minecraft:endcrystals visible true