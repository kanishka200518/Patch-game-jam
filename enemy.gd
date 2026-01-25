extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var timer: Timer = $Timer


func _physics_process(delta: float) -> void:
	# Add the gravity.
	move_and_slide()


func _on_area_2d_body_entered(body):
	if body.is_in_group("Player2"):
		print("enemy killed you")
		timer.start()
	

func _on_timer_timeout():
	get_tree().reload_current_scene()
