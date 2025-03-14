extends Node

@onready var ui: CanvasLayer = %UI
@onready var points_label: Label = %UI/Panel/Label
@onready var character: CharacterBody2D = %Character

var points = 0
var lives = 3

func decrease_health():
	lives -= 1
	ui.update_lives(lives)
	if (lives <= 0):
		get_tree().reload_current_scene()

func stop_input():
	if (character):
		character.set_physics_process(false)
	
func add_point():
	points += 1
	points_label.text = "Points: " + str(points)
	
