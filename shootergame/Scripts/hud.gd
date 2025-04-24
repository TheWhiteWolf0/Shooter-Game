








extends Node2D

func _physics_process(delta: float) -> void:
	$CanvasLayer/reserve_ammo.text = "" + str(GlobalVariables.reserve_ammo)
	$CanvasLayer/mag_ammo.text = "" + str(GlobalVariables.mag_ammo) + "/" + str(GlobalVariables.mag_Capacity)
	$CanvasLayer/player_Health.text = "Health: " + str(GlobalVariables.player_Health)
	$CanvasLayer/BloodEchoes.text = "Power: " + str(GlobalVariables.Currency)
	$CanvasLayer/Score.text = "" + str(GlobalVariables.player_Score)
	
	
