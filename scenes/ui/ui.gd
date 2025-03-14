extends CanvasLayer

@export var hearts : Array[Node]
@onready var cherries_label: Label = %Label
@onready var enemiess_label: Label = %Label2

func update_lives(lives):
	for h in 3:
		if (h < lives):
			hearts[h].show()
		else:
			hearts[h].hide()

func update_points(points, kills):
	cherries_label.text = str(points)
	enemiess_label.text = str(kills)
