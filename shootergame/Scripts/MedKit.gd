







extends Area2D





func _on_body_entered(body: Node2D) -> void:
	print("Entered")
	$"../AudioStreamPlayer2D".play()
	GlobalVariables.player_Health = GlobalVariables.player_Health + 20
	queue_free()
	pass # Replace with function body.
