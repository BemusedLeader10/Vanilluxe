data modify storage vanilluxe:netherite_fishing_rod/data tempPos set from entity @s Pos
execute store result score $dx netherite_fishing_rod_data run data get storage vanilluxe:netherite_fishing_rod/data tempPos[0]
execute store result score $dy netherite_fishing_rod_data run data get storage vanilluxe:netherite_fishing_rod/data tempPos[1]
execute store result score $dz netherite_fishing_rod_data run data get storage vanilluxe:netherite_fishing_rod/data tempPos[2]