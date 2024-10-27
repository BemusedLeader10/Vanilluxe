data modify storage vanilluxe:netherite_fishing_rod/data Motion set from entity @s Motion
$execute as @s at @s run tp @s ~ ~ ~ ~$(value) ~
#$say "rotation: $(value)"
data modify entity @s Motion set from storage vanilluxe:netherite_fishing_rod/data Motion