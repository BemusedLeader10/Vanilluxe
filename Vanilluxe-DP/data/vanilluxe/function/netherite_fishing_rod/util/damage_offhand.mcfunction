#get the amount of damage done (0 = undamaged) to temp3
execute store result score #temp3 netherite_fishing_rod_data run data get entity @s Inventory[{Slot:-106b}].components.minecraft:damage 1

#get the max damage (0 on item mod = fully depleted durability = bigger number to damage)
item modify entity @s weapon.offhand [{function:"set_damage",damage:0}]
execute store result score #temp4 netherite_fishing_rod_data run data get entity @s Inventory[{Slot:-106b}].components.minecraft:damage 1

#restore durability
execute if score #temp3 netherite_fishing_rod_data matches 0 run item modify entity @s weapon.offhand [{function:"set_damage",damage:1}]
execute unless score #temp3 netherite_fishing_rod_data matches 0 store result entity @s Inventory[{Slot:-106b}].components.minecraft:damage int 1 run scoreboard players get #temp3 netherite_fishing_rod_data


#value we want = (max_damage - current_damage - 1) / max_damage
scoreboard players operation #temp2 netherite_fishing_rod_data = #temp4 netherite_fishing_rod_data
scoreboard players operation #temp2 netherite_fishing_rod_data -= #temp3 netherite_fishing_rod_data
#add 1 damage
scoreboard players operation #temp2 netherite_fishing_rod_data -= #1 netherite_fishing_rod_data
#multiply to give more resolution in integers
scoreboard players operation #temp2 netherite_fishing_rod_data *= #100000 netherite_fishing_rod_data
#debug line: scoreboard players operation $temp netherite_fishing_rod_data = #temp2 netherite_fishing_rod_data
scoreboard players operation #temp2 netherite_fishing_rod_data /= #temp4 netherite_fishing_rod_data

execute if score #temp2 netherite_fishing_rod_data matches 0 run playsound minecraft:entity.item.break player @a[distance=0..50] ~ ~ ~ 1 1 0

item modify entity @s weapon.offhand vanilluxe:netherite_fishing_rod/item_damage
