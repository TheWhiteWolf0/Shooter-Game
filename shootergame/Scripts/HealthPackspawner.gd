





extends Node2D

var Health_spawn = preload("res://Scenes/MedKits.tscn")


func _on_health_pack_timeout() -> void:
	var health_pack_spawn = Health_spawn.instantiate()
	health_pack_spawn.position = position
	get_parent().get_node("AllMobs").add_child(health_pack_spawn)
	pass # Replace with function body.
