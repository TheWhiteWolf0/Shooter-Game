








extends Node2D

var mob_chase = preload("res://Scenes/enemy(chase).tscn")


func _on_timer_timeout() -> void:
	print("enemy spawn")
	var ene = mob_chase.instantiate()
	ene.position = position
	get_parent().get_node("AllMobs").add_child(ene)
