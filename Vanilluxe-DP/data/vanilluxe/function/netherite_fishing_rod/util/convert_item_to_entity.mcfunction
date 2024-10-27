execute unless data entity @s Item.components.minecraft:custom_data.fishedcommand run return fail
#we verified we have the data
tag @s add summoning
execute unless block ~ ~ ~ minecraft:lava run function vanilluxe:netherite_fishing_rod/util/mult_motion
execute if block ~ ~ ~ lava run function vanilluxe:netherite_fishing_rod/util/mult_motion_lava
$execute at @s run $(fishedcommand)
data modify storage vanilluxe:netherite_fishing_rod/data Motion set from entity @s Motion
execute at @s as @e[distance=0,tag=!summoning] run data modify entity @s Motion set from storage vanilluxe:netherite_fishing_rod/data Motion
kill @s
