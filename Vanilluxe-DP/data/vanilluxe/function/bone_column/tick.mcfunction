execute as @e[tag=bone_column] at @s if block ~ ~-1 ~ #minecraft:bamboo_plantable_on if block ~ ~ ~ #minecraft:replaceable run setblock ~ ~ ~ minecraft:bamboo[age=0,stage=1,leaves=none]
execute as @e[tag=bone_column] at @s unless block ~ ~-1 ~ #minecraft:bamboo_plantable_on run loot give @n[type=player] loot vanilluxe:items/bone_column
execute as @e[tag=bone_column] run kill @s