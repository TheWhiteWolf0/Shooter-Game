







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
