scoreboard players set @s better_leads_raycast -1
execute on vehicle run function vanilluxe:better_leads/spawn_leash
stopsound @s neutral minecraft:entity.horse.armor
clear @s minecraft:lead 1
ride @s dismount
playsound minecraft:entity.leash_knot.place neutral @a ~ ~ ~