tag @s add this
$execute as @e[distance=..20, nbt={Leash:{X:$(x), Y: $(y), Z: $(z)}}] run give @a[tag=this] minecraft:lead
$execute as @e[distance=..20, nbt={Leash:{X:$(x), Y: $(y), Z: $(z)}}] at @s run summon minecraft:marker ~ ~ ~ {Tags:["lead_spawn_marker"]}
tag @s remove this
schedule function vanilluxe:better_leads/delete_leads 2t