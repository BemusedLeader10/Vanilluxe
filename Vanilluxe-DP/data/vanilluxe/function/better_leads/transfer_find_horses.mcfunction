data modify storage vanilluxe:better_leads/macro leash_uuid set value {}
data modify storage vanilluxe:better_leads/macro leash_uuid.UUID set from entity @s UUID
$execute as @e[distance=..20, nbt={leash:[I; $(x), $(y), $(z)]}] run data modify entity @s leash set from storage vanilluxe:better_leads/macro leash_uuid