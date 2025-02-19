





extends CharacterBody2D

#@onready var animated_sprite_2d: AnimatedSprite2D =$"."
@onready var shooting_point: Marker2D = $Polygon2D/ShootingPoint
@export var speed = 500
var bullet_speed = 2000
var bullet = preload("res://Scenes/Bullet.tscn")
var ammo:int = 15


var Can_Fire:bool = true


func get_input():
	var input_direction = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = input_direction * speed
	look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("Shoot") and Can_Fire and ammo > 0:
		fire()
		ammo = ammo - 1
	


func _physics_process(delta):
	get_input()
	move_and_slide()
	
	
func fire():
	var bullet_instance = bullet.instantiate()
	bullet_instance.global_position = shooting_point.global_position
	bullet_instance.rotation_degrees = rotation_degrees
	#bullet_instance.apply_impulse(Vector2(), Vector2(bullet_speed, 0).rotated(rotation))
	get_tree().get_root().call_deferred("add_child", bullet_instance)
	
