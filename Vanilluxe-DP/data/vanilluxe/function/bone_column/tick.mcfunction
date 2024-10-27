execute as @e[tag=bone_column] at @s if block ~ ~-1 ~ #minecraft:bamboo_plantable_on run setblock ~ ~ ~ minecraft:bamboo[age=0,stage=1,leaves=none]
execute as @e[tag=bone_column] run kill @s