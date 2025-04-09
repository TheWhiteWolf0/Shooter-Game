








extends Node2D

func _physics_process(delta: float) -> void:
	$CanvasLayer/reserve_ammo.text = "ReserveAmmo: " + str(GlobalVariables.reserve_ammo)
	$CanvasLayer/mag_ammo.text = "MagAmmo: " + str(GlobalVariables.mag_ammo)
	$CanvasLayer/player_Health.text = "Health: " + str(GlobalVariables.player_Health)
	$CanvasLayer/BloodEchoes.text = "BloodEchoes: " + str(GlobalVariables.Currency)
	$CanvasLayer/Score.text = "Score: " + str(GlobalVariables.player_Score)
	
	
