#executed from the lava fish item who's been reeled in (bobber gone) and needs to throw an item at the player
scoreboard players operation #temp2 netherite_fishing_rod_data = @s netherite_fishing_rod_fisherman_id
scoreboard players operation @a netherite_fishing_rod_fisherman_id -= #temp2 netherite_fishing_rod_data

#target @p[scores={netherite_fishing_rod_fisherman_id=0}] for the linked player
execute as @p[scores={netherite_fishing_rod_fisherman_id=0}] run tag @s add active_fisher

#prep fishingrerok:data luck_tier so loot table can check it
execute as @p[scores={netherite_fishing_rod_fisherman_id=0}] run function vanilluxe:netherite_fishing_rod/fish_loot_system/store_luck_tier
scoreboard players operation @a netherite_fishing_rod_fisherman_id += #temp2 netherite_fishing_rod_data

#if player is more than 31 blocks away, need to not give loot
execute at @s if entity @p[tag=active_fisher,distance=31..] run kill @s
execute at @s if entity @p[tag=active_fisher,distance=31..] run return run tag @s remove active_fisher

#check player for holding any fishing rod
execute as @p[tag=active_fisher] unless predicate vanilluxe:netherite_fishing_rod/holding_fishing_rod run return fail

#prep vanilluxe:netherite_fishing_rod/data is_in_open_lava so the loot table can check it
data remove storage vanilluxe:netherite_fishing_rod/data is_in_open_lava
execute store result score #temp2 netherite_fishing_rod_data run clone ~2 ~2 ~2 ~-2 ~-2 ~-2 ~-2 ~-2 ~-2 filtered minecraft:lava force
execute store result score #temp3 netherite_fishing_rod_data run clone ~2 ~2 ~2 ~-2 ~-2 ~-2 ~-2 ~-2 ~-2 filtered #minecraft:air force
scoreboard players operation #temp2 netherite_fishing_rod_data += #temp3 netherite_fishing_rod_data
execute if score #temp2 netherite_fishing_rod_data matches 125 run data modify storage vanilluxe:netherite_fishing_rod/data is_in_open_lava set value 1

#spawn loot item at the location of bobber
execute at @s as @p[tag=active_fisher] if predicate vanilluxe:netherite_fishing_rod/mainhand_fishing_rod run loot spawn ~ ~ ~ fish vanilluxe:lava_fish ~ ~ ~ mainhand
execute at @s as @p[tag=active_fisher] unless predicate vanilluxe:netherite_fishing_rod/mainhand_fishing_rod if predicate vanilluxe:netherite_fishing_rod/offhand_fishing_rod run loot spawn ~ ~ ~ fish vanilluxe:lava_fish ~ ~ ~ offhand

#clear loot temp storage data so others don't match the predicates accidentally
data remove storage vanilluxe:netherite_fishing_rod/data luck_tier
data remove storage vanilluxe:netherite_fishing_rod/data is_in_open_lava

#finish item (set data, throw to player, convert item to entity if needed
execute as @e[type=item,distance=0,nbt={Age:0s}] at @s run function vanilluxe:netherite_fishing_rod/fish_loot_system/finish_lava_item

#damage item
execute as @p[tag=active_fisher,gamemode=!creative] at @s if predicate vanilluxe:netherite_fishing_rod/mainhand_fishing_rod if function vanilluxe:netherite_fishing_rod/util/chance_of_unbreaking run function vanilluxe:netherite_fishing_rod/util/damage_mainhand
execute as @p[tag=active_fisher,gamemode=!creative] at @s unless predicate vanilluxe:netherite_fishing_rod/mainhand_fishing_rod if predicate vanilluxe:netherite_fishing_rod/offhand_fishing_rod if function vanilluxe:netherite_fishing_rod/util/chance_of_unbreaking run function vanilluxe:netherite_fishing_rod/util/damage_offhand

#summon xp orb with random experience
execute store result score #temp4 netherite_fishing_rod_data run random value 3..9
execute at @p[tag=active_fisher] summon experience_orb store result entity @s Value int 1 run scoreboard players get #temp4 netherite_fishing_rod_data

#add to their tracked score and remove the tag
execute as @p[tag=active_fisher] run scoreboard players add @s fished_count 1
execute as @p[tag=active_fisher] run tag @s remove active_fisher