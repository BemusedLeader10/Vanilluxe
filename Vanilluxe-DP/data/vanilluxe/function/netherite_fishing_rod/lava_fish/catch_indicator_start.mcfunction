#executed from the lavafish item

#inputs: @s netherite_fishing_rod_data = catch timer

#(t for catch) / (animation time) * (blocks to travel)
#vanilluxe:netherite_fishing_rod/data tempfloat.value = catch timer - 20(ticks) / 40(ticks) * 4(blocks)

scoreboard players operation $temp netherite_fishing_rod_data = @s netherite_fishing_rod_data
scoreboard players operation $temp netherite_fishing_rod_data -= #catch_time netherite_fishing_rod_data

#expand integer domain
scoreboard players operation $temp netherite_fishing_rod_data *= #1000 netherite_fishing_rod_data
scoreboard players operation $temp netherite_fishing_rod_data /= @s frw_tl

#adjust this to adjust the amount of blocks out the animation starts
scoreboard players operation $temp netherite_fishing_rod_data *= #animation_distance netherite_fishing_rod_data
execute store result storage vanilluxe:netherite_fishing_rod/data tempfloat.value float .001 run scoreboard players get $temp netherite_fishing_rod_data

#play smoke particle
function vanilluxe:netherite_fishing_rod/lava_fish/smoke_particle_macro_distance with storage vanilluxe:netherite_fishing_rod/data tempfloat