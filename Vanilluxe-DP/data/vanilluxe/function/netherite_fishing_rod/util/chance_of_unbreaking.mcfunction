#execute from player
scoreboard players set $temp netherite_fishing_rod_data 0
#get level of unbreaking on the player's fishing rod item
#data get entity hokage3211 SelectedItem.components.minecraft:enchantments.levels.minecraft:unbreaking
#                           Inventory[{Slot:-106b}].components.minecraft:enchantments.levels.minecraft:unbreaking
execute unless predicate vanilluxe:netherite_fishing_rod/mainhand_fishing_rod if predicate vanilluxe:netherite_fishing_rod/offhand_fishing_rod store result score $temp netherite_fishing_rod_data run data get entity @s Inventory[{Slot:-106b}].components.minecraft:enchantments.levels.minecraft:unbreaking
execute if predicate vanilluxe:netherite_fishing_rod/mainhand_fishing_rod store result score $temp netherite_fishing_rod_data run data get entity @s SelectedItem.components.minecraft:enchantments.levels.minecraft:unbreaking
#$temp netherite_fishing_rod_data has level of unbreaking
scoreboard players operation #temp2 netherite_fishing_rod_data = $temp netherite_fishing_rod_data
scoreboard players operation $temp netherite_fishing_rod_data *= #100 netherite_fishing_rod_data
scoreboard players operation #temp2 netherite_fishing_rod_data += #1 netherite_fishing_rod_data
scoreboard players operation $temp netherite_fishing_rod_data /= #temp2 netherite_fishing_rod_data
execute store result score #temp3 netherite_fishing_rod_data run random value 0..100
execute if score #temp3 netherite_fishing_rod_data > $temp netherite_fishing_rod_data run return 1
return fail