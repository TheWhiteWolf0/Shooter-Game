








extends Area2D



func _on_body_entered(body: Node2D) -> void:
	print("Entered")
	GlobalVariables.reserve_ammo = GlobalVariables.reserve_ammo + 10
	GlobalVariables.player_Health = GlobalVariables.player_Health + 20
	queue_free()
	pass # Replace with function body.
