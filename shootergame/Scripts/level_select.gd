extends Control






func _on_level_1_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/test_scence.tscn")
	pass # Replace with function body.
	
func _on_level_2_pressed() -> void:
	# add and make level 2 #
	##get_tree().change_scene_to_file()
	pass # Replace with function body.

func _on_level_3_pressed() -> void:
	# add and make level 3 #
	#get_tree().change_scene_to_file()
	pass # Replace with function body.
	
func _on_upgrades_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/control.tscn")
	pass # Replace with function body.

func _on_options_pressed() -> void:
	# add and make an options#
	#get_tree().change_scene_to_file()
	pass # Replace with function body.
