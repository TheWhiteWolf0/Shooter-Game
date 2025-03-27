







extends Control

var cost:int = 5



func _on_button_pressed() -> void:
	if GlobalVariables.Currency >= cost:
		GlobalVariables.Currency = GlobalVariables.Currency - cost
		GlobalVariables.mag_ammo = GlobalVariables.mag_ammo + 1
		GlobalVariables.mag_Capacity = GlobalVariables.mag_Capacity + 1
		cost = cost + 2
		GlobalVariables.player_lvl = GlobalVariables.player_lvl + 1
		print(cost)
	else:
		print("Insufficient funds")
	pass # Replace with function body.

func _on_player_health_pressed() -> void:
	if GlobalVariables.Currency >= cost:
		GlobalVariables.Currency = GlobalVariables.Currency - cost
		GlobalVariables.player_Health = GlobalVariables.player_Health + 10
		cost = cost + 2
		GlobalVariables.player_lvl = GlobalVariables.player_lvl + 1
		print(cost)
	else:
		print("Insufficient funds")
	pass # Replace with function body.

func _on_player_damage_pressed() -> void:
	if GlobalVariables.Currency >= cost:
		GlobalVariables.Currency = GlobalVariables.Currency - cost
		GlobalVariables.player_Damage = GlobalVariables.player_Damage * 1.5
		cost = cost + 2
		GlobalVariables.player_lvl = GlobalVariables.player_lvl + 1
		print(cost)
		print(GlobalVariables.player_Damage)
	else:
		print("Insufficient funds")
	pass # Replace with function body.


func _on_reserve_ammo_pressed() -> void:
	if GlobalVariables.Currency >= cost:
		GlobalVariables.Currency = GlobalVariables.Currency - cost
		GlobalVariables.reserve_ammo = GlobalVariables.reserve_ammo + 10
		cost = cost + 2 
		print("Reerve ammo +10")
	else:
		print("Insufficient funds")
	
	pass # Replace with function body.


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/test_scence.tscn")
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	$CanvasLayer/BloodEchoes.text = "BloodEchoes: " + str(GlobalVariables.Currency)
	$CanvasLayer/Score.text = "Score: " + str(GlobalVariables.player_Score)
	$CanvasLayer/Cost.text = "Cost: " + str(cost)
	$CanvasLayer/PlayerLevel.text = "Level: " + str(GlobalVariables.player_lvl)
