extends Area2D

@export var target_level : PackedScene
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var game_manager: Node = %GameManager

const waiting_time = 2

func _on_body_entered(body: Node2D) -> void:
	if (body.name == "Character"):
		game_manager.stop_input()
		animated_sprite_2d.animation = "pressed"
		call_deferred("switch_level")
		
func switch_level():
		await get_tree().create_timer(waiting_time).timeout
		get_tree().change_scene_to_packed(target_level)
	
