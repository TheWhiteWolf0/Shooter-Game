








extends Area2D




func _on_body_entered(body: Node2D) -> void:
	print("Entered")
	GlobalVariables.damage_Overtime = true
	#if GlobalVariables.damage_Overtime == true:
		#_on_timer_timeout()
		#print("KaChow")
		#GlobalVariables.damage_OT_Fire = GlobalVariables.damage_OT_Fire + 1
		#GlobalVariables.player_Health = GlobalVariables.player_Health - (5 * GlobalVariables.damage_OT_Fire)
	pass # Replace with function body.




func _on_timer_timeout() -> void:
	#print("Hello world")
	if GlobalVariables.damage_Overtime == true:
		GlobalVariables.damage_OT_Fire = GlobalVariables.damage_OT_Fire + 1
		GlobalVariables.player_Health = GlobalVariables.player_Health - (5 * GlobalVariables.damage_OT_Fire)
		
	pass # Replace with function body.


func _on_body_exited(body: Node2D) -> void:
	print("Exited")
	GlobalVariables.damage_Overtime = false
	pass # Replace with function body.
