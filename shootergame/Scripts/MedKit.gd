







extends Area2D





func _on_body_entered(body: Node2D) -> void:
	print("Entered")
	GlobalVariables.player_Health = GlobalVariables.player_Health + 40
	queue_free()
	pass # Replace with function body.
