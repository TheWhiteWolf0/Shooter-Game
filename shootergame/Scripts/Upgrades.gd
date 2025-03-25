







extends Control

var cost:int = 5



func _on_button_pressed() -> void:
	if GlobalVariables.Currency >= cost:
		GlobalVariables.Currency = GlobalVariables.Currency - cost
		GlobalVariables.mag_ammo = GlobalVariables.mag_ammo + 1
		GlobalVariables.mag_Capacity = GlobalVariables.mag_Capacity + 1
		cost = cost + 2
		print(cost)
		print(GlobalVariables.mag_ammo)
		print(GlobalVariables.mag_Capacity)
	else:
		print("Insufficieny funds")
	pass # Replace with function body.

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/test_scence.tscn")
	pass # Replace with function body.
	
	
	
	
	
func _physics_process(delta: float) -> void:
	$CanvasLayer/BloodEchoes.text = "BloodEchoes: " + str(GlobalVariables.Currency)
	$CanvasLayer/Score.text = "Score: " + str(GlobalVariables.player_Score)
