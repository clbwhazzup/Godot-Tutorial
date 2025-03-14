extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var game_manager: Node = %GameManager
var left = false
var speed = 100

func _on_area_2d_body_entered(body: Node2D) -> void:
	if (body.name == "Character"):
		var y_delta = position.y - body.position.y
		var x_delta = body.position.x - position.x
		if (y_delta > 30):
			game_manager.add_kill()
			queue_free()
			body.bounce()
		else:
			game_manager.decrease_health()
			if (x_delta > 0):
				body.jump_side(500)
			else:
				body.jump_side(-500)

	if (left):
		left = false
	else:
		left = true

func _physics_process(delta: float) -> void:

	if (velocity.x > 1 || velocity.x < -1):
		animated_sprite_2d.animation = "running"
	else:
		animated_sprite_2d.animation = "default"

	if not is_on_floor():
		velocity += get_gravity() * delta

	if (!left):
		velocity.x = speed
	else:
		velocity.x = -speed

	if (velocity.x > 0):
		animated_sprite_2d.flip_h = true
	else:
		animated_sprite_2d.flip_h = false

	move_and_slide()
