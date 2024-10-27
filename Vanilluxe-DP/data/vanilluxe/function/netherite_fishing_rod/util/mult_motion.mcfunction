#multiply motion by 3.5 (originally)
#                                                                                   0.00
#execute store result entity @s Motion[0] double .011 run data get entity @s Motion[0] 100
execute store result score #maxCheck netherite_fishing_rod_data run data get entity @s Motion[0] 110
scoreboard players operation #maxCheck netherite_fishing_rod_data < #900 netherite_fishing_rod_data
execute store result entity @s Motion[0] double .01 run scoreboard players get #maxCheck netherite_fishing_rod_data

#execute store result entity @s Motion[1] double .022 run data get entity @s Motion[1] 100
execute store result score #maxCheck netherite_fishing_rod_data run data get entity @s Motion[1] 220
scoreboard players operation #maxCheck netherite_fishing_rod_data < #900 netherite_fishing_rod_data
execute store result entity @s Motion[1] double .01 run scoreboard players get #maxCheck netherite_fishing_rod_data

#execute store result entity @s Motion[2] double .011 run data get entity @s Motion[2] 100
execute store result score #maxCheck netherite_fishing_rod_data run data get entity @s Motion[2] 110
scoreboard players operation #maxCheck netherite_fishing_rod_data < #900 netherite_fishing_rod_data
execute store result entity @s Motion[2] double .01 run scoreboard players get #maxCheck netherite_fishing_rod_data

#old code zone
#multiply y by 2, x and z by 3
#execute store result storage vanilluxe:netherite_fishing_rod/data tempint double 4.6 run data get entity @s Motion[2]
#data modify entity @s Motion[2] set from storage vanilluxe:netherite_fishing_rod/data tempint
