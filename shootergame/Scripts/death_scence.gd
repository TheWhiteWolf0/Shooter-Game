







extends Control



func _physics_process(delta: float) -> void:
	$CanvasLayer/score.text = "Score Achivied " + str(GlobalVariables.player_Score)
