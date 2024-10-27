execute store result score $temp netherite_fishing_rod_data run data get entity @s Motion[1] 1000
scoreboard players operation $temp netherite_fishing_rod_data += #float_amount netherite_fishing_rod_data
execute store result entity @s Motion[1] double .001 run scoreboard players get $temp netherite_fishing_rod_data
