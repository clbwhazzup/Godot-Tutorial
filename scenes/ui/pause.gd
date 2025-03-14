extends Node

@export var target_level : PackedScene
@onready var pause_panel: Panel = %PausePanel

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var esc_pressed = Input.is_action_just_pressed("Pause")
	if (esc_pressed):
		get_tree().paused = true
		pause_panel.show()

func _on_resume_pressed():
	pause_panel.hide()
	get_tree().paused = false

func _on_main_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_packed(target_level)
