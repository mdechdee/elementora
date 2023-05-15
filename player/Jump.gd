class_name JumpState
extends BaseState


func _init():
	state_string_name = "Jump"

func enter():
	player.animations.play("jump")
	player.velocity.y -= player.jump_speed

func physics_process(_delta):
	player.move()
	if player.velocity.y > 0.3:
		return State.FALL
	return State.NULL
	
