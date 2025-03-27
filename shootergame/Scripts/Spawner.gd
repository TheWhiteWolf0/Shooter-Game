








extends Node2D

var mob_chase = preload("res://Scenes/enemy(chase).tscn")
@onready var spawn_point: Marker2D = $SpawnPoint


func _on_timer_timeout() -> void:
	print("Hello World")
	var ene = mob_chase.instantiate()
	ene.position = position
	get_tree().get_root().call_deferred("add_child", ene)
	#get_parent().get_node().add_child(ene)
	
	pass # Replace with function body.
	
#func _MobSpawner():
	#var mob_instance = mob_chase.instantiate()
	#mob_chase.global_position = spawn_point.global_position
	#get_tree().get_root().call_deferred("add_child", mob_instance)
