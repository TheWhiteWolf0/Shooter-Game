








extends Node

var player_speed:int = 450
var player_Score:int = 0
var player_Health:int = 100
var player_Damage:int = 1
var player_lvl:int = 0

var Can_Fire:bool = true
var Can_reload:bool = false

#These need to equal Each other#
var mag_ammo:int = 5
var mag_Capacity:int = 5
#~~#

var reserve_ammo:int = 40


var damage_Overtime:bool = false
var damage_OT_Fire:float = 0.0

var Currency:int = 0

# Enemy Multi-Hit health/speed # 

var enemy_health_increase:int = 2
var enemy_Speed_increase:int = 10

# Upgrades #

var cost:int = 5
