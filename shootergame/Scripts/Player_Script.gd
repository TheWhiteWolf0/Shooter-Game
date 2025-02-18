





extends CharacterBody2D

#@onready var animated_sprite_2d: AnimatedSprite2D =$"."

@export var speed = 500
var bullet_speed = 2000
var bullet = preload("res://Scenes/bullet.tscn")


func get_input():
	var input_direction = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = input_direction * speed
	look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("Shoot"):
		fire()
	


func _physics_process(delta):
	get_input()
	move_and_slide()
	
	
func fire():
	var bullet_instance = bullet.instantiate()
	bullet_instance.position = get_global_position()
	bullet_instance.rotation_degrees = rotation_degrees
	bullet_instance.apply_impulse(Vector2(), Vector2(bullet_speed, 0).rotated(rotation))
	get_tree().get_root().call_deferred("add_child", bullet_instance)
