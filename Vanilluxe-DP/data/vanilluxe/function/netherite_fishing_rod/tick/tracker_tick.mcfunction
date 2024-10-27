#executed from marker tracker with fishermand id to track bobber with matching scoreboard value

scoreboard players set $result netherite_fishing_rod_data 0
scoreboard players operation $temp netherite_fishing_rod_data = @s netherite_fishing_rod_fisherman_id

#one bobber should have a score of 0 now, teleport to it and store if we succeeded
execute as @e[type=minecraft:fishing_bobber] if score @s netherite_fishing_rod_fisherman_id = $temp netherite_fishing_rod_data run tag @s add matched_bobber
execute store result score $result netherite_fishing_rod_data run tp @s @n[type=minecraft:fishing_bobber,tag=matched_bobber]
tag @e[type=minecraft:fishing_bobber,tag=matched_bobber] remove matched_bobber
#debug line to get result
#tellraw @a ["", {"selector":"@s"}, ": ", {"score":{"objective":"netherite_fishing_rod_data", "name":"$result"}}]

#if failed to teleport, finalize marker step
execute if score $result netherite_fishing_rod_data matches 0 run function vanilluxe:netherite_fishing_rod/fish_loot_system/tracker_final_step

#old code for funsies below

#kill if farther than 30 blocks away
#execute store success score $result netherite_fishing_rod_data on vehicle if entity @s[type=fishing_bobber] at @s on origin if entity @s[distance=31..]
#if so, kill ourselves, the bobber, and lavafish tracker too
#execute if score $result netherite_fishing_rod_data matches 1 run kill @s
#execute if score $result netherite_fishing_rod_data matches 1 as @e[type=minecraft:fishing_bobber] if score @s netherite_fishing_rod_fisherman_id = $temp netherite_fishing_rod_data run kill @s
#execute if score $result netherite_fishing_rod_data matches 1 as @e[type=minecraft:armor_stand,tag=lava_fish_item] if score @s netherite_fishing_rod_fisherman_id = $temp netherite_fishing_rod_data run kill @s
#execute if score $result netherite_fishing_rod_data matches 1 run return 0

#if this tracker has a bobber attached to it, set a temp flag, 0 = bobber disappeared
#execute as @s on vehicle run scoreboard players set $result netherite_fishing_rod_data 1

#we still are tracking the bobber
#execute if score $result netherite_fishing_rod_data matches 1 run return 0
