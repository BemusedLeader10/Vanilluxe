scoreboard players remove @s better_leads_raycast 1
execute if block ~ ~ ~ #minecraft:fences run function vanilluxe:better_leads/tied_raycast_success
execute if score @s better_leads_raycast matches 0.. positioned ^ ^ ^0.1 run function vanilluxe:better_leads/tied_raycast