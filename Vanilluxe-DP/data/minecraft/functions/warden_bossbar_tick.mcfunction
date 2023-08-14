#make the bar visible only to nearby players
execute at @a if entity @e[type=minecraft:warden,distance=..50] run bossbar set minecraft:warden players @a[distance=..50]

#set the bars status according to the warden's health
execute at @a run execute as @e[type=minecraft:warden,distance=..50] run execute store result bossbar minecraft:warden value run data get entity @s Health

#make the bar invisible if there is no warden
execute unless entity @e[type=minecraft:warden] run bossbar set minecraft:warden players @a[distance=0]

#make the bar visible again if there is warden
execute at @e[type=warden] run bossbar set minecraft:warden players @a[distance=..50]