advancement revoke @s only vanilluxe:technical/better_leads_ride
execute on vehicle store success score #result better_leads_raycast run data get entity @s leash
execute if score #result better_leads_raycast matches 0 run return 0
execute on vehicle on leasher store result storage vanilluxe:better_leads/macro x int 1 run data get entity @s Pos[0] 1
execute on vehicle on leasher store result storage vanilluxe:better_leads/macro y int 1 run data get entity @s Pos[1] 1
execute on vehicle on leasher store result storage vanilluxe:better_leads/macro z int 1 run data get entity @s Pos[2] 1
function vanilluxe:better_leads/count_horses with storage vanilluxe:better_leads/macro
execute if data storage vanilluxe:better_leads/counter {Count:1} on vehicle on leasher run kill @s
execute unless data storage vanilluxe:better_leads/counter {Count:1} on vehicle run data modify entity @s leash set value [I; 0, 1000, 0]
give @s minecraft:lead
execute on vehicle at @s run summon minecraft:marker ~ ~ ~ {Tags:["lead_spawn_marker"]}
schedule function vanilluxe:better_leads/delete_leads 2t