summon minecraft:marker ~ ~ ~ {Tags:["fence_marker"]}
execute store result storage minecraft:better_leads/macro x int 1 run data get entity @e[tag=fence_marker, limit=1] Pos[0] 1
execute store result storage minecraft:better_leads/macro y int 1 run data get entity @e[tag=fence_marker, limit=1] Pos[1] 1
execute store result storage minecraft:better_leads/macro z int 1 run data get entity @e[tag=fence_marker, limit=1] Pos[2] 1
data modify storage minecraft:better_leads/macro leash set value [I;]
data modify storage minecraft:better_leads/macro leash append from storage minecraft:better_leads/macro x
data modify storage minecraft:better_leads/macro leash append from storage minecraft:better_leads/macro y
data modify storage minecraft:better_leads/macro leash append from storage minecraft:better_leads/macro z
data modify entity @s leash set from storage minecraft:better_leads/macro leash
kill @e[tag=fence_marker]