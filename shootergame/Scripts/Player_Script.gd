





extends CharacterBody2D

@onready var shooting_point: Marker2D = $Polygon2D/ShootingPoint
@export var speed = 250
var bullet_speed = 7000
var bullet = preload("res://Scenes/Bullet.tscn")

func get_input():
	var input_direction = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = input_direction * speed
	look_at(get_global_mouse_position())
	
	
func player_weapon():
	if GlobalVariables.mag_ammo == 0:
		GlobalVariables.Can_reload = true
	
	if Input.is_action_just_pressed("Shoot") and GlobalVariables.Can_Fire and GlobalVariables.mag_ammo > 0:
		fire()
		GlobalVariables.mag_ammo = GlobalVariables.mag_ammo - 1

		
	if Input.is_action_just_pressed("Reload") and GlobalVariables.Can_reload and GlobalVariables.reserve_ammo > 0 and GlobalVariables.mag_ammo == 0:
		GlobalVariables.mag_ammo = GlobalVariables.mag_ammo + 5
		GlobalVariables.reserve_ammo = GlobalVariables.reserve_ammo - 5
		
	return


func _physics_process(delta):
	get_input()
	move_and_slide()
	player_weapon()
	
	$"../CanvasLayer/reserve_ammo".text = "ReserveAmmo: " + str(GlobalVariables.reserve_ammo)
	$"../CanvasLayer/mag_ammo".text = "MagAmmo: " + str(GlobalVariables.mag_ammo)
	$"../CanvasLayer/player_Health".text = "Health: " + str(GlobalVariables.player_Health)

func fire():
	var bullet_instance = bullet.instantiate()
	bullet_instance.global_position = shooting_point.global_position
	bullet_instance.rotation_degrees = rotation_degrees
	#bullet_instance.apply_impulse(Vector2(), Vector2(bullet_speed, 0).rotated(rotation))
	get_tree().get_root().call_deferred("add_child", bullet_instance)
