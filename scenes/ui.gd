extends CanvasLayer

@export var hearts : Array[Node]

func update_lives(lives):
	for h in 3:
		if (h < lives):
			hearts[h].show()
		else:
			hearts[h].hide()
