#executed from the lavafish item, when they need to play the bobber going down sound
scoreboard players set $result netherite_fishing_rod_data -1
scoreboard players operation $result netherite_fishing_rod_data = @s netherite_fishing_rod_fisherman_id
execute as @a[distance=0..32] if score @s netherite_fishing_rod_fisherman_id = $result netherite_fishing_rod_data run playsound minecraft:item.bucket.fill_lava player @s ~ ~ ~ 2 .75 0