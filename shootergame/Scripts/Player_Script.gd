








extends CharacterBody2D

@onready var shooting_point: Marker2D = $Polygon2D/ShootingPoint
#@onready var player: CharacterBody2D
var reload_delay = false

var bullet = preload("res://Scenes/Bullet.tscn")

func get_input():
	var input_direction = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = input_direction * GlobalVariables.player_speed
	look_at(get_global_mouse_position())

func player_weapon():
	if GlobalVariables.mag_ammo == 0:
		GlobalVariables.Can_reload = true
	
	if Input.is_action_just_pressed("Shoot") and GlobalVariables.Can_Fire and GlobalVariables.mag_ammo > 0:
		fire()
		GlobalVariables.mag_ammo = GlobalVariables.mag_ammo - 1

		
	if Input.is_action_just_pressed("Reload") and GlobalVariables.Can_reload and GlobalVariables.reserve_ammo > 0 and GlobalVariables.mag_ammo == 0:
		$ReloadDelay.start()
		reload_delay == true
		if reload_delay == true:
			_on_timer_timeout()
	return

func _physics_process(delta):
	get_input()
	move_and_slide()
	player_weapon()
	#upgrade()
	death()

func fire():
	var bullet_instance = bullet.instantiate()
	bullet_instance.global_position = shooting_point.global_position
	bullet_instance.rotation_degrees = rotation_degrees
	#bullet_instance.apply_impulse(Vector2(), Vector2(bullet_speed, 0).rotated(rotation))
	get_tree().get_root().call_deferred("add_child", bullet_instance)

func upgrade():
	if Input.is_action_just_pressed("Inventory"):
		get_tree().change_scene_to_file("res://Scenes/control.tscn")

func death():
	if GlobalVariables.player_Health <= 0:
		print("YOU DIED") 
		# for now it will send the player to the upgrade scene#
		get_tree().change_scene_to_file("res://Scenes/DeathScence.tscn")
		# Need to create a main menu/level select # 

func _on_hit_box_area_entered(area: Area2D) -> void:
	print("Player Hit")
	GlobalVariables.player_Health = GlobalVariables.player_Health - 20
	if GlobalVariables.player_Health <= 0:
		death()
		
	pass # Replace with function body.
	

func _on_timer_timeout() -> void:
	GlobalVariables.mag_ammo = GlobalVariables.mag_ammo + GlobalVariables.mag_Capacity
	GlobalVariables.reserve_ammo = GlobalVariables.reserve_ammo - GlobalVariables.mag_Capacity
	pass # Replace with function body.
