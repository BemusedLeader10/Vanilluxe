data modify storage vanilluxe:teleporter_enchantment/macro target.dimension set from entity @s SelectedItem.components.minecraft:lodestone_tracker.target.dimension
execute store result storage vanilluxe:teleporter_enchantment/macro target.posx int 1 run data get entity @s SelectedItem.components.minecraft:lodestone_tracker.target.pos[0]
execute store result score @s teleporter_target.posy run data get entity @s SelectedItem.components.minecraft:lodestone_tracker.target.pos[1]
scoreboard players add @s teleporter_target.posy 1
execute store result storage vanilluxe:teleporter_enchantment/macro target.posy int 1 run scoreboard players get @s teleporter_target.posy
execute store result storage vanilluxe:teleporter_enchantment/macro target.posz int 1 run data get entity @s SelectedItem.components.minecraft:lodestone_tracker.target.pos[2]
function vanilluxe:teleporter_enchantment/teleport with storage vanilluxe:teleporter_enchantment/macro target
scoreboard players set @s teleporter_warp_tick -20
scoreboard players set @s teleporter_is_sneaking 0
execute at @s run particle minecraft:portal ~ ~1 ~ 0.5 0.5 0.5 0.25 100 normal