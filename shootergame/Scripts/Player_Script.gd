





extends CharacterBody2D

#@onready var animated_sprite_2d: AnimatedSprite2D =$"."

@export var speed = 500
#var MousePos:float = get_global_mouse_position().x

func get_input():
	var input_direction = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()
	
	
	
	#if Input.is_action_just_pressed("Shoot"):
	#	get_global_mouse_position()
	#	print()
	
	look_at(get_global_mouse_position())
