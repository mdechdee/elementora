class_name LandState
extends BaseState


func _init():
	state_string_name = "Land"


func enter():
	player.animations.play("land")


func physics_process(_delta: float) -> State:
	player.move()
	if player.animations.frame_progress == 1.0:
		return State.IDLE
	if Input.is_action_just_pressed("jump"):
		return State.JUMP
	return State.NULL
