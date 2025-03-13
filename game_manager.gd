extends Node

@onready var points_label: Label = %UI/Panel/Label
@onready var character: CharacterBody2D = %Character

var points = 0

func stop_input():
	if (character):
		character.set_physics_process(false)
	
func add_point():
	points += 1
	points_label.text = "Points: " + str(points)
