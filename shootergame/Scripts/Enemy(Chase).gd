









extends CharacterBody2D



@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D
@export var target_to_chase: CharacterBody2D

const SPEED = 75

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
	print("Hmmm")
	GlobalVariables.Currency = GlobalVariables.Currency + 1
	GlobalVariables.player_Score = GlobalVariables.player_Score + 1
	queue_free()
	pass # Replace with function body.
