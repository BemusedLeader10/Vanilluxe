#execute at the surface of the lava by the lava fish item
#execute if predicate {condition:"entity_properties",entity:"this",predicate:{periodic_tick:2}} run function vanilluxe:netherite_fishing_rod/lava_fish/lava_fish_particles
function vanilluxe:netherite_fishing_rod/lava_fish/lava_fish_particles

#@s frw_tl has animation time + #catch_time netherite_fishing_rod_data for the time it takes to catch something
scoreboard players operation $temp netherite_fishing_rod_data = @s frw_tl
scoreboard players operation $temp netherite_fishing_rod_data += #catch_time netherite_fishing_rod_data

#tellraw @p ["","timer: ",{"score":{"name":"@s","objective":"frw_tl"}}," ",{"score":{"name":"@s","objective":"netherite_fishing_rod_data"}}," ",{"score":{"name":"$temp","objective":"netherite_fishing_rod_data"}}]
#only play animation if within animation timer
execute if score @s netherite_fishing_rod_data <= $temp netherite_fishing_rod_data if score @s netherite_fishing_rod_data >= #catch_time netherite_fishing_rod_data run function vanilluxe:netherite_fishing_rod/lava_fish/catch_indicator_start