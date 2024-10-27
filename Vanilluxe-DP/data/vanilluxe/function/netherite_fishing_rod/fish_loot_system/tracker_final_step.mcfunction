#executed as a marker tracking a bobber that has been marked as finished and needs to process new items if they are nearby
execute at @s as @e[type=item,distance=0..1,nbt={Age:0s,PickupDelay:0s}] run function vanilluxe:netherite_fishing_rod/util/convert_item_to_entity with entity @s Item.components.minecraft:custom_data
kill @s