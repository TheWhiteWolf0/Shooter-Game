





extends CharacterBody2D

#@onready var animated_sprite_2d: AnimatedSprite2D =$"."
@onready var shooting_point: Marker2D = $Polygon2D/ShootingPoint
@export var speed = 500
var bullet_speed = 6000
var bullet = preload("res://Scenes/Bullet.tscn")
var reserve_ammo:int = 40
var mag_ammo:int = 5

var Can_Fire:bool = true
var Can_reload:bool = false
var ammo_diff:int 

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
		$"../CanvasLayer/mag_ammo".text = "MagAmmo: " + str(mag_ammo)
		#print(ammo_diff)
		
	if Input.is_action_just_pressed("Reload") and Can_reload and reserve_ammo > 0 and mag_ammo == 0:
		mag_ammo = mag_ammo + 5
		reserve_ammo = reserve_ammo - 5
		$"../CanvasLayer/reserve_ammo".text = "ReserveAmmo: " + str(reserve_ammo)
	
	return


func _physics_process(delta):
	get_input()
	move_and_slide()
	player_weapon()
	
	
func fire():
	var bullet_instance = bullet.instantiate()
	bullet_instance.global_position = shooting_point.global_position
	bullet_instance.rotation_degrees = rotation_degrees
	#bullet_instance.apply_impulse(Vector2(), Vector2(bullet_speed, 0).rotated(rotation))
	get_tree().get_root().call_deferred("add_child", bullet_instance)
	
#func reload():
	
	
