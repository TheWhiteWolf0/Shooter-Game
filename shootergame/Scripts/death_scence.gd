







extends Control



func _physics_process(delta: float) -> void:
	$CanvasLayer/score.text = "Score Achivied " + str(GlobalVariables.player_Score)



func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level_select.tscn")
	pass # Replace with function body.


func _on_button_2_pressed() -> void:
	GlobalVariables.player_Health = GlobalVariables.player_Health + 100
	GlobalVariables.reserve_ammo = GlobalVariables.reserve_ammo + 20
	GlobalVariables.player_Score = 0
	get_tree().change_scene_to_file("res://Scenes/lvl2.tscn")
	pass # Replace with function body.

func _on_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/control.tscn")
	pass # Replace with function body.
