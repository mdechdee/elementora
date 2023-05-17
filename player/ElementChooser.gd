extends Node
class_name  ElementSwitcher

signal element_changed(element: Element.Type)

func _ready():
	element_changed.connect(func(_element): $SwitchCooldownTimer.start())

func _process(delta: float) -> void:
	if !$SwitchCooldownTimer.is_stopped():
		return
	if Input.is_action_just_pressed("switch_to_fire_element"):
		element_changed.emit(Element.Type.FIRE)
	if Input.is_action_just_pressed("switch_to_wind_element"):
		element_changed.emit(Element.Type.WIND)
	if Input.is_action_just_pressed("switch_to_water_element"):
		element_changed.emit(Element.Type.WATER)
	if Input.is_action_just_pressed("switch_to_ice_element"):
		element_changed.emit(Element.Type.ICE)
		
