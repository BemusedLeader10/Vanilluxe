execute as @a unless entity @s[nbt={SelectedItem:{components:{"minecraft:lodestone_tracker":{target:{dimension:"minecraft:overworld"}}}}}] unless entity @s[nbt={SelectedItem:{components:{"minecraft:lodestone_tracker":{target:{dimension:"minecraft:the_nether"}}}}}] unless entity @s[nbt={SelectedItem:{components:{"minecraft:lodestone_tracker":{target:{dimension:"minecraft:the_end"}}}}}] run scoreboard players set @s is_sneaking 0
execute as @a[scores={is_sneaking=0}] run scoreboard players set @s warp_tick 0
execute as @a[scores={is_sneaking=1}] run scoreboard players add @s warp_tick 1
execute as @a[scores={is_sneaking=1..}] run scoreboard players set @s is_sneaking 0
execute at @a[scores={warp_tick=1..}] run particle minecraft:portal ~ ~1 ~ 0.5 0.5 0.5 0.25 2 normal
execute at @a[scores={warp_tick=15..}] run playsound minecraft:block.beacon.ambient player @a ~ ~ ~ 0.1 2
execute as @a[scores={warp_tick=30}] at @s run effect give @s minecraft:darkness 3 150 true
execute as @a[scores={warp_tick=50..}] run function minecraft:teleporter_enchantment/target