execute as @a run function vanilluxe:netherite_fishing_rod/tick/player_tick

execute as @e[type=minecraft:marker,tag=fishing_bobber_tracker] run function vanilluxe:netherite_fishing_rod/tick/tracker_tick

execute as @e[type=fishing_bobber] run function vanilluxe:netherite_fishing_rod/tick/bobber

execute as @e[type=armor_stand,tag=lava_fish_item] at @s run function vanilluxe:netherite_fishing_rod/tick/lavafish_item_tick