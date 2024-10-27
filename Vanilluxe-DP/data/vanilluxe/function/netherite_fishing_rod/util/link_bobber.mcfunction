#excuted as a bobber entity that needs to be linked

#set fisherman ID to player matching origin position
execute on origin run tag @s add owner_player
scoreboard players operation @s netherite_fishing_rod_fisherman_id = @a[tag=owner_player,limit=1] netherite_fishing_rod_fisherman_id
tag @s add frw_linked_bobber

#set the fisherman tier of this item based on player data
execute store result score @s frw_tl as @a[tag=owner_player,limit=1] if score @s netherite_fishing_rod_fisherman_id = $active_caster netherite_fishing_rod_data run attribute @s minecraft:luck get
execute on origin run tag @s remove owner_player
#summon tracker marker
execute summon marker run function vanilluxe:netherite_fishing_rod/util/marker_track_bobber
