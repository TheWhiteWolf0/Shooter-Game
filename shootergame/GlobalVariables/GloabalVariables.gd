








extends Node

@export var player_speed = 250
var player_Health:int = 100


var Can_Fire:bool = true
var Can_reload:bool = false

#These need to equal Each other#
var mag_ammo:int = 5
var mag_Capacity:int = 5
#~~#

var reserve_ammo:int = 40


var damage_Overtime:bool = false
var damage_OT_Fire:float = 0.0

var Currency:int = 100
