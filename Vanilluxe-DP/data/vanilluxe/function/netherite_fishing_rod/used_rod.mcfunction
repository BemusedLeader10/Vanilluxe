#executed from a player who just used (cast) a rod at some point last tick

#tellraw @s "Used rod!"
scoreboard players set @s netherite_fishing_rod_data 0

#store active caster's ID for setting score to others
execute store result score $active_caster netherite_fishing_rod_data run scoreboard players get @s netherite_fishing_rod_fisherman_id
#find any matching trackers with id and process their items then die
execute as @e[type=minecraft:marker,tag=fishing_bobber_tracker] at @s if score @s netherite_fishing_rod_fisherman_id = $active_caster netherite_fishing_rod_data run function vanilluxe:netherite_fishing_rod/fish_loot_system/tracker_final_step
#find all bobbers that aren't linked via frw_linked_bobber and link them to current score
execute as @e[type=minecraft:fishing_bobber,tag=!frw_linked_bobber] run function vanilluxe:netherite_fishing_rod/util/link_bobber

#execute if score $result netherite_fishing_rod_data matches 1.. run say bobber found!

#tag @s add has_bobber_out
