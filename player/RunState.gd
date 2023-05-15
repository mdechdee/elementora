class_name RunState
extends BaseState


func _init():
	state_string_name = "Run"


func enter():
	player.animations.play("run")


func physics_process(_delta: float) -> State:
	var axis = InputHelper.get_axis()
	if axis < 0:
		player.animations.flip_h = true
	else:
		player.animations.flip_h = false
	if axis == 0:
		return State.IDLE
	
	if Input.is_action_just_pressed("jump"):
		return State.JUMP
	
	player.move()
	return State.NULL
