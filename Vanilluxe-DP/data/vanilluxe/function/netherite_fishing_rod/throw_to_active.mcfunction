#since the only way to do scale is to use ints
#once subtracted, scale store into singles in storage
#then pass all via macro(?) to motion of entity

#extract current location into dx,dy,dz (netherite_fishing_rod_data)
execute as @s at @s run function vanilluxe:netherite_fishing_rod/util/load_d_pos
#put location of active_fisher tag int x,y,z
execute as @a[tag=active_fisher,limit=1] at @s run function vanilluxe:netherite_fishing_rod/util/load_pos
#add one block for player head target (or at least clear the floor)
scoreboard players operation $y netherite_fishing_rod_data += #2 netherite_fishing_rod_data
#subtract dx,dy,dz from x,y,z (target - location = delta pointing at target)
scoreboard players operation $x netherite_fishing_rod_data -= $dx netherite_fishing_rod_data
scoreboard players operation $y netherite_fishing_rod_data -= $dy netherite_fishing_rod_data
scoreboard players operation $z netherite_fishing_rod_data -= $dz netherite_fishing_rod_data

#adjust variable scope to avoid imprecision on further steps
#a = a*100
scoreboard players operation $x netherite_fishing_rod_data *= #1000 netherite_fishing_rod_data
scoreboard players operation $y netherite_fishing_rod_data *= #1000 netherite_fishing_rod_data
scoreboard players operation $z netherite_fishing_rod_data *= #1000 netherite_fishing_rod_data

# velocity = x * 0.1, y * 0.1 + sqrt(sqrt{x*x + y*y + z*z}]), z * 0.1
#copy to d values
scoreboard players operation $dx netherite_fishing_rod_data = $x netherite_fishing_rod_data
scoreboard players operation $dy netherite_fishing_rod_data = $y netherite_fishing_rod_data
scoreboard players operation $dz netherite_fishing_rod_data = $z netherite_fishing_rod_data
#multiply by themselves
scoreboard players operation $dx netherite_fishing_rod_data *= $dx netherite_fishing_rod_data
scoreboard players operation $dy netherite_fishing_rod_data *= $dy netherite_fishing_rod_data
scoreboard players operation $dz netherite_fishing_rod_data *= $dz netherite_fishing_rod_data
#add together
scoreboard players set $temp netherite_fishing_rod_data 0
scoreboard players operation $temp netherite_fishing_rod_data += $dx netherite_fishing_rod_data
scoreboard players operation $temp netherite_fishing_rod_data += $dy netherite_fishing_rod_data
scoreboard players operation $temp netherite_fishing_rod_data += $dz netherite_fishing_rod_data
#square root twice
# INPUT: scoreboard players set #sqrt_in netherite_fishing_rod_data <x>
# OUTPUT: scoreboard players get #sqrt_out netherite_fishing_rod_data
scoreboard players operation #sqrt_in netherite_fishing_rod_data = $temp netherite_fishing_rod_data
function vanilluxe:netherite_fishing_rod/util/sqrt
scoreboard players operation #sqrt_in netherite_fishing_rod_data = #sqrt_out netherite_fishing_rod_data
function vanilluxe:netherite_fishing_rod/util/sqrt
scoreboard players operation $temp netherite_fishing_rod_data = #sqrt_out netherite_fishing_rod_data
#need to divide the result of this by 10 to get it back to scale (since all inputs were multiplied by 1000)
scoreboard players operation $temp netherite_fishing_rod_data /= #10 netherite_fishing_rod_data

#divide x, y, and z by 10 (y is special to get slightly higher on my own tweak)
scoreboard players operation $x netherite_fishing_rod_data /= #10 netherite_fishing_rod_data
scoreboard players operation $y netherite_fishing_rod_data /= #9 netherite_fishing_rod_data
scoreboard players operation $z netherite_fishing_rod_data /= #10 netherite_fishing_rod_data

#add the extra temp to y
scoreboard players operation $y netherite_fishing_rod_data += $temp netherite_fishing_rod_data

#(if this is a mob, this needs to be multiplied by 4.6), TODO

#divide x, y, and z by 1000 by storing into temp storage, and then moving that storage into array storage "Motion"
#a = a / 1000
data modify storage vanilluxe:netherite_fishing_rod/data Motion set value []

# 2.85 max maybe to protect against entity motion cap when multiplied by 3.5 later? see if applicable

execute store result storage vanilluxe:netherite_fishing_rod/data tempint double .001 run scoreboard players get $x netherite_fishing_rod_data
data modify storage vanilluxe:netherite_fishing_rod/data Motion append from storage vanilluxe:netherite_fishing_rod/data tempint

execute store result storage vanilluxe:netherite_fishing_rod/data tempint double .001 run scoreboard players get $y netherite_fishing_rod_data
data modify storage vanilluxe:netherite_fishing_rod/data Motion append from storage vanilluxe:netherite_fishing_rod/data tempint

execute store result storage vanilluxe:netherite_fishing_rod/data tempint double .001 run scoreboard players get $z netherite_fishing_rod_data
data modify storage vanilluxe:netherite_fishing_rod/data Motion append from storage vanilluxe:netherite_fishing_rod/data tempint

data modify entity @s Motion set from storage vanilluxe:netherite_fishing_rod/data Motion

#execute as @s at @s run function vanilluxe:netherite_fishing_rod/util/mult_motion