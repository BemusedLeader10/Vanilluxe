scoreboard players set @s better_leads_raycast -1
execute align xyz positioned ~0.5 ~0.375 ~0.5 if entity @e[distance=..0.1, type=minecraft:leash_knot] run return 0
execute align xyz run summon minecraft:marker ~ ~ ~ {Tags:["fence_marker"]}
execute store result storage vanilluxe:better_leads/macro x int 1 run data get entity @e[tag=fence_marker, limit=1] Pos[0] 1
execute store result storage vanilluxe:better_leads/macro y int 1 run data get entity @e[tag=fence_marker, limit=1] Pos[1] 1
execute store result storage vanilluxe:better_leads/macro z int 1 run data get entity @e[tag=fence_marker, limit=1] Pos[2] 1
kill @e[tag=fence_marker]
function vanilluxe:better_leads/untied_knot_find_horses with storage vanilluxe:better_leads/macro