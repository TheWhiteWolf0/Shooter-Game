







extends Control

# var cost:int = 5



func _on_button_pressed() -> void:
	if GlobalVariables.Currency >= GlobalVariables.cost:
		GlobalVariables.Currency = GlobalVariables.Currency - GlobalVariables.cost
		GlobalVariables.mag_ammo = GlobalVariables.mag_ammo + 1
		GlobalVariables.mag_Capacity = GlobalVariables.mag_Capacity + 1
		GlobalVariables.cost = GlobalVariables.cost + 2
		GlobalVariables.player_lvl = GlobalVariables.player_lvl + 1
		print(GlobalVariables.cost)
	else:
		print("Insufficient funds")
	pass # Replace with function body.

#func _on_player_health_pressed() -> void:
#	if GlobalVariables.Currency >= GlobalVariables.cost:
#		GlobalVariables.Currency = GlobalVariables.Currency - GlobalVariables.cost
#		GlobalVariables.player_Health = GlobalVariables.player_Health + 10
#		GlobalVariables.cost =  + 2
#		GlobalVariables.player_lvl = GlobalVariables.player_lvl + 1
#		print(GlobalVariables.cost)
#	else:
#		print("Insufficient funds")
#	pass # Replace with function body.

func _on_player_damage_pressed() -> void:
	if GlobalVariables.Currency >= GlobalVariables.cost:
		GlobalVariables.Currency = GlobalVariables.Currency - GlobalVariables.cost
		GlobalVariables.player_Damage = GlobalVariables.player_Damage + 1
		GlobalVariables.cost = GlobalVariables.cost + 2
		GlobalVariables.player_lvl = GlobalVariables.player_lvl + 1
		print(GlobalVariables.cost)
		print(GlobalVariables.player_Damage)
	else:
		print("Insufficient funds")
	pass # Replace with function body.


func _on_reserve_ammo_pressed() -> void:
	if GlobalVariables.Currency >= GlobalVariables.cost:
		GlobalVariables.Currency = GlobalVariables.Currency - GlobalVariables.cost
		GlobalVariables.reserve_ammo = GlobalVariables.reserve_ammo + 10
		GlobalVariables.cost = GlobalVariables.cost + 10
		print("Reerve ammo +10")
	else:
		print("Insufficient funds")
	pass # Replace with function body.

func _on_speed_increase_pressed() -> void:
	if GlobalVariables.Currency >= GlobalVariables.cost:
		GlobalVariables.Currency = GlobalVariables.Currency - GlobalVariables.cost
		GlobalVariables.player_speed = GlobalVariables.player_speed + 50
		GlobalVariables.player_lvl = GlobalVariables.player_lvl + 1
	else:
		print("Insufficient funds")
	pass # Replace with function body.


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level_select.tscn")
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	$CanvasLayer/BloodEchoes.text = "BloodEchoes: " + str(GlobalVariables.Currency)
	$CanvasLayer/Score.text = "Score: " + str(GlobalVariables.player_Score)
	$CanvasLayer/Cost.text = "Cost: " + str(GlobalVariables.cost)
	$CanvasLayer/PlayerLevel.text = "Level: " + str(GlobalVariables.player_lvl)
	$CanvasLayer/Damage.text = "Damage: " + str(GlobalVariables.player_Damage)
	$"CanvasLayer/Damage/Damage + increase".text = "--> " + str(GlobalVariables.player_Damage + 1)
	
	$CanvasLayer/Health.text = "Health: " + str(GlobalVariables.player_Health)
	$"CanvasLayer/Health/PlayerHealth + Increase".text = "--> " + str(GlobalVariables.player_Health + 10)
	
	$CanvasLayer/MagSize.text = "MagCapicity: " + str(GlobalVariables.mag_Capacity)
	$"CanvasLayer/MagSize/MagSize + increase".text = "--> " + str(GlobalVariables.mag_Capacity + 1)
