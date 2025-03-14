extends Area2D

@onready var game_manager: Node = %GameManager

func _on_body_entered(body: Node2D) -> void:
	if (body.name == "Character"):
		game_manager.increase_health()
		queue_free()
