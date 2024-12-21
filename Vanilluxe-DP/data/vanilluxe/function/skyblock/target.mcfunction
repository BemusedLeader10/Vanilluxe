execute store result storage vanilluxe:skyblock/macro Pos.x int 1 run data get entity @n[tag=skyblock] Pos[0]
execute store result storage vanilluxe:skyblock/macro Pos.y int 1 run data get entity @n[tag=skyblock] Pos[1]
execute store result storage vanilluxe:skyblock/macro Pos.z int 1 run data get entity @n[tag=skyblock] Pos[2]
effect give @s minecraft:resistance 1 255 true
function vanilluxe:skyblock/teleport with storage vanilluxe:skyblock/macro Pos