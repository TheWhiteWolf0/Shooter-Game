extends Node2D













var mob_muti = preload("res://Scenes/enemy(multi_hit).tscn")



func _on_timer_timeout() -> void:
	print("enemy spawn")
	var ene_muti = mob_muti.instantiate()
	ene_muti.position = position
	get_parent().get_node("AllMobs").add_child(ene_muti)
