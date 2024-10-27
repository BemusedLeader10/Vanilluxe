#executed as a bobber
scoreboard players operation $temp netherite_fishing_rod_data = @s netherite_fishing_rod_fisherman_id
#if our player doesn't have a lava fishing rod, return here
execute as @a if score @s netherite_fishing_rod_fisherman_id = $temp netherite_fishing_rod_data unless predicate vanilluxe:netherite_fishing_rod/can_lava_fish run return fail
data modify storage vanilluxe:netherite_fishing_rod/data Motion set from entity @s Motion
tag @s add lava_fishing
#execute as @a if score @s netherite_fishing_rod_fisherman_id = $temp netherite_fishing_rod_data run data modify storage vanilluxe:netherite_fishing_rod/data tempUUID set from entity @s UUID
summon armor_stand ~ ~ ~ {Invulnerable:1b,Small:1b,Marker:0b,Invisible:1b,Tags:["new_lava_fish_item","lava_fish_item"],attributes:[{id:"minecraft:scale",base:.06}],DisabledSlots:4144959,active_effects:[{id:"minecraft:fire_resistance",amplifier:0,duration:-1,show_particles:0b}]}
execute at @s run ride @s mount @e[type=armor_stand,tag=new_lava_fish_item,limit=1]
tag @e[tag=new_lava_fish_item] remove new_lava_fish_item
execute on vehicle as @s run function vanilluxe:netherite_fishing_rod/util/setup_lavafish_item
#say lava setup!