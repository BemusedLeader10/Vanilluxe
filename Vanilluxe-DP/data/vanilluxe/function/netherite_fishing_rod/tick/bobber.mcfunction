#executed from a bobber
execute as @s[tag=!lava_fishing] at @s if block ~ ~ ~ lava run function vanilluxe:netherite_fishing_rod/lava_setup

#search a 3x3x3 area centered on this, if no lava, run stop
execute if predicate vanilluxe:netherite_fishing_rod/second_timer as @s[tag=lava_fishing] at @s \
unless block ~1 ~1 ~1 lava unless block ~ ~1 ~1 lava unless block ~-1 ~1 ~1 lava \
unless block ~1 ~ ~1 lava unless block ~ ~ ~1 lava unless block ~-1 ~ ~1 lava \
unless block ~1 ~-1 ~1 lava unless block ~ ~-1 ~1 lava unless block ~-1 ~-1 ~1 lava \
unless block ~1 ~1 ~ lava unless block ~ ~1 ~ lava unless block ~-1 ~1 ~ lava \
unless block ~1 ~ ~ lava unless block ~ ~ ~ lava unless block ~-1 ~ ~ lava \
unless block ~1 ~-1 ~ lava unless block ~ ~-1 ~ lava unless block ~-1 ~-1 ~ lava \
unless block ~1 ~1 ~-1 lava unless block ~ ~1 ~-1 lava unless block ~-1 ~1 ~-1 lava \
unless block ~1 ~ ~-1 lava unless block ~ ~ ~-1 lava unless block ~-1 ~ ~-1 lava \
unless block ~1 ~-1 ~-1 lava unless block ~ ~-1 ~-1 lava unless block ~-1 ~-1 ~-1 lava run function vanilluxe:netherite_fishing_rod/lava_fish_stop

#execute as @s[tag=lava_fishing] at @s store result score $temp netherite_fishing_rod_data run clone ~1 ~1 ~1 ~-1 ~-1 ~-1 ~-1 ~-1 ~-1 filtered lava force
#execute as @s[tag=lava_fishing] if score $temp netherite_fishing_rod_data matches 0 run function vanilluxe:netherite_fishing_rod/lava_fish_stop
