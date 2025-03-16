









extends CharacterBody2D



@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D
@export var target_to_chase: CharacterBody2D

const SPEED = 75

func _physics_process(delta: float) -> void:
	navigation_agent_2d.target_position = target_to_chase.global_position
	velocity = global_position.direction_to(navigation_agent_2d.get_next_path_position()) * SPEED
	move_and_slide()
