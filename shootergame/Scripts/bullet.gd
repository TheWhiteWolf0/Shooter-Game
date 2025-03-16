







extends Area2D

var speed = 850

func _physics_process(delta):
	
	position += transform.x * speed * delta
