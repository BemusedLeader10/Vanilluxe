#executed from the armor stand used for lava fishing

scoreboard players set $temp netherite_fishing_rod_data 0
#get level of lure on the player's fishing rod item
#data get entity hokage3211 SelectedItem.components.minecraft:enchantments.levels.minecraft:lure
#                           Inventory[{Slot:-106b}].components.minecraft:enchantments.levels.minecraft:lure
scoreboard players operation #temp2 netherite_fishing_rod_data = @s netherite_fishing_rod_fisherman_id
scoreboard players operation @a netherite_fishing_rod_fisherman_id -= #temp2 netherite_fishing_rod_data
execute as @p[scores={netherite_fishing_rod_fisherman_id=0}] unless predicate vanilluxe:netherite_fishing_rod/mainhand_fishing_rod if predicate vanilluxe:netherite_fishing_rod/offhand_fishing_rod store result score $temp netherite_fishing_rod_data run data get entity @s Inventory[{Slot:-106b}].components.minecraft:enchantments.levels.minecraft:lure
execute as @p[scores={netherite_fishing_rod_fisherman_id=0}] if predicate vanilluxe:netherite_fishing_rod/mainhand_fishing_rod store result score $temp netherite_fishing_rod_data run data get entity @s SelectedItem.components.minecraft:enchantments.levels.minecraft:lure
scoreboard players operation @a netherite_fishing_rod_fisherman_id += #temp2 netherite_fishing_rod_data

scoreboard players operation $temp netherite_fishing_rod_data *= #100 netherite_fishing_rod_data
# $temp = lure amount * 100 (ticks)
# #temp2 = extra waiting time (1 - 4 seconds)
# #temp3 = wait_min_ticks (affected by lure)
# #temp4 = wait_max_ticks (affected by lure)
# @s netherite_fishing_rod_data = actual chosen catch time (using macros + random value)
scoreboard players operation #temp3 netherite_fishing_rod_data = #wait_min_ticks netherite_fishing_rod_data
scoreboard players operation #temp3 netherite_fishing_rod_data -= $temp netherite_fishing_rod_data
scoreboard players operation #temp4 netherite_fishing_rod_data = #wait_max_ticks netherite_fishing_rod_data
scoreboard players operation #temp4 netherite_fishing_rod_data -= $temp netherite_fishing_rod_data

execute store result storage vanilluxe:netherite_fishing_rod/data random_range.min int 1 run scoreboard players get #temp3 netherite_fishing_rod_data
execute store result storage vanilluxe:netherite_fishing_rod/data random_range.max int 1 run scoreboard players get #temp4 netherite_fishing_rod_data
execute store result score @s netherite_fishing_rod_data run function vanilluxe:netherite_fishing_rod/util/macro_random with storage vanilluxe:netherite_fishing_rod/data random_range

#if it's <= 0 now, abort, this will get triggered again
execute if score @s netherite_fishing_rod_data matches ..0 run scoreboard players set @s netherite_fishing_rod_data -1
execute if score @s netherite_fishing_rod_data matches ..0 run return 0

#create random animation time (1 - 4 seconds) (20 - 80)
execute store result storage vanilluxe:netherite_fishing_rod/data random_range.min int 1 run scoreboard players get #20 netherite_fishing_rod_data
execute store result storage vanilluxe:netherite_fishing_rod/data random_range.max int 1 run scoreboard players get #80 netherite_fishing_rod_data
execute store result score @s frw_tl run function vanilluxe:netherite_fishing_rod/util/macro_random with storage vanilluxe:netherite_fishing_rod/data random_range
#scoreboard players operation @s frw_tl = #40 netherite_fishing_rod_data
#add the animation to the catch time
scoreboard players operation @s netherite_fishing_rod_data += @s frw_tl

#@s frw_tl contains the animation time now

#add catch timer offset at end
scoreboard players operation @s netherite_fishing_rod_data += #catch_time netherite_fishing_rod_data