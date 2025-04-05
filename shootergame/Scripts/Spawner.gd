extends Node2D







@onready var enemy_chase = preload("res://Scenes/enemy(chase).tscn")

@onready var spawn_point: Marker2D = $SpawnPoint

func _on_timer_timeout() -> void:
	var ene_chase = enemy_chase.instantiate()
	ene_chase.position = spawn_point.position
	get_parent().get_node("AllMobs").add_child(enemy_chase)
