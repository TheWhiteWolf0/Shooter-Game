







extends Area2D



var speed = 500 # was 850 #

func _physics_process(delta):
	
	position += transform.x * speed * delta


	

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		print("Hit")
		$".".queue_free()
		
	pass # Replace with function body.
