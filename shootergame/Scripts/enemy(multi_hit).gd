







extends CharacterBody2D

@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D
@onready var target_to_chase: CharacterBody2D = get_parent().get_node("Player")

var tree_death = preload("res://Scenes/animated_sprite_2d.tscn")
var Health_death = preload("res://Scenes/MedKits.tscn")

var score_check = false
var score_health

var enemy_speed = 50
var enemy_health:int = 3
#var enemy_increase_bool:bool = false

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
	velocity = global_position.direction_to(navigation_agent_2d.get_next_path_position()) * enemy_speed
	move_and_slide()
	enemydeath()
	#_score_check()
	#_on_health__speed_increase_timeout()

func _on_area_2d_area_entered(area: Area2D) -> void:
	print("enemy hit")
	#$AudioStreamPlayer2D.play()
	enemy_health = enemy_health - GlobalVariables.player_Damage
	pass # Replace with function body.
	
func enemydeath():
	if enemy_health <= 0:
		#$AudioStreamPlayer2D.play()
		GlobalVariables.Currency = GlobalVariables.Currency + 5
		GlobalVariables.player_Score = GlobalVariables.player_Score + 3
		GlobalVariables.reserve_ammo = GlobalVariables.reserve_ammo + 5
		var tree_instance = tree_death.instantiate()
		tree_instance.global_position = $Area2D.global_position
		get_tree().get_root().call_deferred("add_child", tree_instance)
		queue_free()
		
#func HealthIncrease():
	#if GlobalVariables.player_Score > 5:
		#enemy_increase_bool = true
	
	#if enemy_increase_bool:
		#enemy_health = GlobalVariables.enemy_health_increase + enemy_health
		#enemy_increase_bool = false
		#print(enemy_health)


func _on_health__speed_increase_timeout() -> void:
	enemy_health = GlobalVariables.enemy_health_increase + enemy_health
	enemy_speed = GlobalVariables.enemy_Speed_increase + enemy_speed
	print(enemy_health)

func _score_check():
	score_check = GlobalVariables.player_Score / 100
	if score_check == 0:
		var health_instance = Health_death.instantiate()
		health_instance.global_position = $Area2D.global_position
		get_tree().get_root().call_deferred("add_child", health_instance)
		queue_free()
