#executed from a marker to track a bobber, $active_caster netherite_fishing_rod_data is current fisherman id

tag @s add fishing_bobber_tracker
scoreboard players operation @s netherite_fishing_rod_fisherman_id = $active_caster netherite_fishing_rod_data
#debug line to tell id set
#tellraw @a ["", {"selector":"@s"}, ": ", {"score":{"objective":"netherite_fishing_rod_fisherman_id", "name":"@s"}}]