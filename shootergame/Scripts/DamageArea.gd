








extends Area2D




func _on_body_entered(body: Node2D) -> void:
	print("Entered")
	GlobalVariables.damage_Overtime = true
	if GlobalVariables.damage_Overtime == true:
		GlobalVariables.damage_OT_Fire = GlobalVariables.damage_OT_Fire + 1
		GlobalVariables.player_Health = GlobalVariables.player_Health - (5 * GlobalVariables.damage_OT_Fire)
	pass # Replace with function body.
