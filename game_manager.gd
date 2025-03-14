extends Node

@onready var ui: CanvasLayer = %UI
@onready var character: CharacterBody2D = %Character

var points = 0
var kills = 0
var lives = 3

func decrease_health():
	lives -= 1
	ui.update_lives(lives)
	if (lives <= 0):
		get_tree().reload_current_scene()

func increase_health():
	if (lives < 3):
		lives += 1
		ui.update_lives(lives)

func stop_input():
	if (character):
		character.set_physics_process(false)

func add_point():
	points += 1
	ui.update_points(points, kills)

func add_kill():
	kills += 1
	ui.update_points(points, kills)
