#executed from the lavafish item

#link fisherman id
scoreboard players operation @s netherite_fishing_rod_fisherman_id = $temp netherite_fishing_rod_data
#set owner UUID from tempUUID
#data modify entity @s Owner set from storage vanilluxe:netherite_fishing_rod/data tempUUID
#set owner motion from saved motion
data modify entity @s Motion set from storage vanilluxe:netherite_fishing_rod/data Motion
#try setting fishing timer
function vanilluxe:netherite_fishing_rod/lava_fish/reset_fishing_timer
execute as @s at @s run function vanilluxe:netherite_fishing_rod/lava_fish/random_rotate
