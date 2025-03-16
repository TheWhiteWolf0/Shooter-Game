





extends CharacterBody2D

#@onready var animated_sprite_2d: AnimatedSprite2D =$"."
@onready var shooting_point: Marker2D = $Polygon2D/ShootingPoint
@export var speed = 250
var bullet_speed = 7000
var bullet = preload("res://Scenes/Bullet.tscn")
var reserve_ammo:int = 40
var mag_ammo:int = 5

#var player_Health:int = 100
#var player_Shield:int = 0
#var Max_Player_Health = 0


var Can_Fire:bool = true
var Can_reload:bool = false
var ammo_diff:int 

var ammo_pack:bool = true

var fire_damage:float = 0.0

var fireDamage: bool = false

func get_input():
	var input_direction = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = input_direction * speed
	look_at(get_global_mouse_position())
	
	
func player_weapon():
	if mag_ammo == 0:
		Can_reload = true
	
	if Input.is_action_just_pressed("Shoot") and Can_Fire and mag_ammo > 0:
		ammo_diff = reserve_ammo - mag_ammo
		fire()
		mag_ammo = mag_ammo - 1

		
	if Input.is_action_just_pressed("Reload") and Can_reload and reserve_ammo > 0 and mag_ammo == 0:
		mag_ammo = mag_ammo + 5
		reserve_ammo = reserve_ammo - 5
		
	return


func _physics_process(delta):
	get_input()
	move_and_slide()
	player_weapon()
	#Max_Player_Health = player_Health + player_Shield
	
	$"../CanvasLayer/reserve_ammo".text = "ReserveAmmo: " + str(reserve_ammo)
	$"../CanvasLayer/mag_ammo".text = "MagAmmo: " + str(mag_ammo)
	$"../CanvasLayer/player_Health".text = "Health: " + str(GlobalVariables.player_Health)
	

	
	
func fire():
	var bullet_instance = bullet.instantiate()
	bullet_instance.global_position = shooting_point.global_position
	bullet_instance.rotation_degrees = rotation_degrees
	#bullet_instance.apply_impulse(Vector2(), Vector2(bullet_speed, 0).rotated(rotation))
	get_tree().get_root().call_deferred("add_child", bullet_instance)
	


#Ammo pack#
func _on_area_2d_body_entered(body: Node2D) -> void:
	print("Entered")
	reserve_ammo = reserve_ammo + 10
	$"../AmmoPack".queue_free()
	pass # Replace with function body.
	
	
func _on_health_pack_body_entered(body: Node2D) -> void:
	print("Entered")
	GlobalVariables.player_Health = GlobalVariables.player_Health + 25
	$"../HealthPack".queue_free()
	pass # Replace with function body.

#func _on_shield_pack_body_entered(body: Node2D) -> void:
	#Max_Player_Health = player_Health + (player_Shield + 25)
	#$"../ShieldPack".queue_free()
	#pass # Replace with function body.


func _on_damage_aera_body_entered(body: Node2D) -> void:
	print("Entered")
	fireDamage = true
	if fireDamage == true:
		$"../FireDamage".start()
		fire_damage = fire_damage + 1
		GlobalVariables.player_Health = GlobalVariables.player_Health - (5 * fire_damage)
		
	
	pass # Replace with function body.
func _on_fire_damage_timeout() -> void:
	fire_damage += 0.2
	pass # Replace with function body.

@onready var terget = $"."
var enemy_speed = 200

#func _physics_process(delta: float) -> void:
	#var direction = (terget.position - position).normalized()
	#velocity = direction * enemy_speed
	#look_at(terget.position)
	#move_and_slide()
