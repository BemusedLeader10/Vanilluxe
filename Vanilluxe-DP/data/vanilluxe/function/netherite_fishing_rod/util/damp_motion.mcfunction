#dampen motion
execute store result entity @s Motion[0] double .003 run data get entity @s Motion[0] 100
execute store result entity @s Motion[1] double .003 run data get entity @s Motion[1] 100
execute store result entity @s Motion[2] double .003 run data get entity @s Motion[2] 100

