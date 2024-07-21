data modify storage minecraft:teleporter_enchantment/macro target.dimension set from entity @s SelectedItem.components.minecraft:lodestone_tracker.target.dimension
execute store result storage minecraft:teleporter_enchantment/macro target.x int 1 run data get entity @s SelectedItem.components.minecraft:lodestone_tracker.target.pos[0]
execute store result score @s target.y run data get entity @s SelectedItem.components.minecraft:lodestone_tracker.target.pos[1]
scoreboard players add @s target.y 1
execute store result storage minecraft:teleporter_enchantment/macro target.y int 1 run scoreboard players get @s target.y
execute store result storage minecraft:teleporter_enchantment/macro target.z int 1 run data get entity @s SelectedItem.components.minecraft:lodestone_tracker.target.pos[2]
function minecraft:teleporter_enchantment/teleport with storage minecraft:teleporter_enchantment/macro target
scoreboard players set @s warp_tick -20
scoreboard players set @s is_sneaking 0
execute at @s run particle minecraft:portal ~ ~1 ~ 0.5 0.5 0.5 0.25 100 normal
#execute as @s run data merge 