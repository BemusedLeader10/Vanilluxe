#executed from the item that is running the lava fishing

#particle displays
execute as @s at @s run function vanilluxe:netherite_fishing_rod/lava_fish/get_to_lava_surface

scoreboard players set $result netherite_fishing_rod_data 0
execute on passengers as @s run scoreboard players set $result netherite_fishing_rod_data 1
#if result is 1, we have passengers, and continue living
#otherwise we were reeled in
execute if score $result netherite_fishing_rod_data matches 0 if score @s netherite_fishing_rod_data matches 0..20 as @s at @s run function vanilluxe:netherite_fishing_rod/fish_loot_system/lava_loot_to_player
execute if score $result netherite_fishing_rod_data matches 0 run kill @s
execute if score $result netherite_fishing_rod_data matches 0 run return 0

execute if block ~ ~ ~ lava run function vanilluxe:netherite_fishing_rod/lava_fish/float_in_lava_motion

execute store result storage vanilluxe:netherite_fishing_rod/data tempfloat.value float 0.001 run random value -7000..8000
function vanilluxe:netherite_fishing_rod/util/rotate_macro with storage vanilluxe:netherite_fishing_rod/data tempfloat

execute if score @s netherite_fishing_rod_data matches 21 run data modify entity @s Motion[1] set value -0.4d
execute at @s if score @s netherite_fishing_rod_data matches 21 run function vanilluxe:netherite_fishing_rod/lava_fish/play_sound_to_player

execute if score @s netherite_fishing_rod_data matches ..0 run function vanilluxe:netherite_fishing_rod/lava_fish/reset_fishing_timer
scoreboard players remove @s netherite_fishing_rod_data 1

#get pulled down (item version)
#/execute as @n[type=item,tag=lava_fish_item] run data modify entity @s Motion[1] set value -0.13d
#for armor stand
#/execute as @n[type=armor_stand,tag=lava_fish_item] run data modify entity @s Motion[1] set value -0.5d
