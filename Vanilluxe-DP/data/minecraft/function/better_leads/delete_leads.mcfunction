execute as @e[type=minecraft:marker, tag=lead_spawn_marker] at @s run kill @e[distance=..0.2, nbt={Item:{id:"minecraft:lead"}, Age:0s}]
kill @e[type=minecraft:marker, tag=lead_spawn_marker]