# LOAD: {
#     scoreboard objectives add netherite_fishing_rod_data dummy
#     scoreboard players set #2 netherite_fishing_rod_data 2
#     scoreboard players set #559 netherite_fishing_rod_data 559
#     scoreboard players set #32768 netherite_fishing_rod_data 32768
# }

# INPUT: scoreboard players set #sqrt_in netherite_fishing_rod_data <x>

execute store result score #t1 netherite_fishing_rod_data store result score #t2 netherite_fishing_rod_data store result score #t3 netherite_fishing_rod_data run scoreboard players operation #sqrt_out netherite_fishing_rod_data = #sqrt_in netherite_fishing_rod_data
execute if score #sqrt_in netherite_fishing_rod_data matches 0..1515359 run scoreboard players operation #sqrt_out netherite_fishing_rod_data /= #559 netherite_fishing_rod_data
execute if score #sqrt_in netherite_fishing_rod_data matches 0..1515359 run scoreboard players add #sqrt_out netherite_fishing_rod_data 15
execute if score #sqrt_in netherite_fishing_rod_data matches 1515360.. run scoreboard players operation #sqrt_out netherite_fishing_rod_data /= #32768 netherite_fishing_rod_data
execute if score #sqrt_in netherite_fishing_rod_data matches 1515360.. run scoreboard players add #sqrt_out netherite_fishing_rod_data 2456
scoreboard players operation #t1 netherite_fishing_rod_data /= #sqrt_out netherite_fishing_rod_data
scoreboard players operation #sqrt_out netherite_fishing_rod_data += #t1 netherite_fishing_rod_data
scoreboard players operation #sqrt_out netherite_fishing_rod_data /= #2 netherite_fishing_rod_data
scoreboard players operation #t2 netherite_fishing_rod_data /= #sqrt_out netherite_fishing_rod_data
scoreboard players operation #sqrt_out netherite_fishing_rod_data += #t2 netherite_fishing_rod_data
scoreboard players operation #sqrt_out netherite_fishing_rod_data /= #2 netherite_fishing_rod_data
scoreboard players operation #t3 netherite_fishing_rod_data /= #sqrt_out netherite_fishing_rod_data
scoreboard players operation #sqrt_out netherite_fishing_rod_data += #t3 netherite_fishing_rod_data
scoreboard players operation #sqrt_out netherite_fishing_rod_data /= #2 netherite_fishing_rod_data
scoreboard players operation #sqrt_in netherite_fishing_rod_data /= #sqrt_out netherite_fishing_rod_data
execute if score #sqrt_out netherite_fishing_rod_data > #sqrt_in netherite_fishing_rod_data run scoreboard players remove #sqrt_out netherite_fishing_rod_data 1

# OUTPUT: scoreboard players get #sqrt_out netherite_fishing_rod_data


#temp x variable = x + 6.6, then divide temp variable by 66
#scoreboard players set $temp netherite_fishing_rod_data 0
#scoreboard players set #temp2 netherite_fishing_rod_data 0
#scoreboard players operation $temp netherite_fishing_rod_data = $x netherite_fishing_rod_data
#scoreboard players operation #temp2 netherite_fishing_rod_data = $z netherite_fishing_rod_data

#execute if score $temp netherite_fishing_rod_data matches ..-1 run scoreboard players operation $temp netherite_fishing_rod_data *= #-1 netherite_fishing_rod_data
#execute if score #temp2 netherite_fishing_rod_data matches ..-1 run scoreboard players operation #temp2 netherite_fishing_rod_data *= #-1 netherite_fishing_rod_data

#scoreboard players operation $temp netherite_fishing_rod_data > #temp2 netherite_fishing_rod_data
#temp is now set to the greatest value of the two flat axis
#scoreboard players operation $temp netherite_fishing_rod_data += #6600 netherite_fishing_rod_data
#scoreboard players operation $temp netherite_fishing_rod_data /= #66 netherite_fishing_rod_data