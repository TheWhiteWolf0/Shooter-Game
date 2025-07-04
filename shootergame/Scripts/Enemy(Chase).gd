









extends CharacterBody2D



@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D
@onready var target_to_chase: CharacterBody2D = get_parent().get_node("Player")

var tree_death = preload("res://Scenes/animated_sprite_2d.tscn")

var SPEED = 75

#func _ready() -> void:
	#set_physics_process(false)
	#call_deferred("_wait_for_physics()")
#func _wait_for_physics():
	#await get_tree().physics_frame
	#set_physics_process(true)

func _physics_process(delta: float) -> void:
	#if navigation_agent_2d.is_navigation_finished() \
	#and target_to_chase.global_position == navigation_agent_2d.target_position:
	#	return
	navigation_agent_2d.target_position = target_to_chase.global_position
	velocity = global_position.direction_to(navigation_agent_2d.get_next_path_position()) * SPEED
	move_and_slide()

func _on_area_2d_area_entered(area: Area2D) -> void:
	$AudioStreamPlayer2D.play()
	print("Hmmm")
	GlobalVariables.Currency = GlobalVariables.Currency + 4
	GlobalVariables.player_Score = GlobalVariables.player_Score + 2
	var tree_instance = tree_death.instantiate()
	tree_instance.global_position = $Area2D.global_position
	get_tree().get_root().call_deferred("add_child", tree_instance)
	queue_free()
	pass # Replace with function body.

func _on_speed_increase_timeout() -> void:
	SPEED = GlobalVariables.enemy_Speed_increase + SPEED
	pass # Replace with function body.
