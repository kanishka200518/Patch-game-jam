extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var health=50
var health_max=50
var health_min=0
@onready var timer: Timer = $Timer
@onready var player=get_node("/root/game/player")
func _physics_process(_delta: float) -> void:
	var direction_x=sign(player.global_position.x-global_position.x)
	velocity.x=direction_x*100.0
	# Add the gravity.
	move_and_slide()

	

func _on_area_2d_body_entered(body):
	if body.is_in_group("Player2"):
		print("enemy killed you")
		timer.start()
	

func _on_timer_timeout():
	get_tree().reload_current_scene()
