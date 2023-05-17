extends Area2D
class_name ExitDoor

signal door_entered

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		door_entered.emit()
