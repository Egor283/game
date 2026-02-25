extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0

@onready var anim = get_node("AnimatedSprite2D")
func _physics_process(delta: float) -> void:
	# Add the gravity.
	

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var directionx := Input.get_axis("left", "right")
	var directiony := Input.get_axis("up", "down")
	if directionx:
		velocity.x = directionx * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		anim.play("idle")
	if directiony:
		velocity.y = directiony * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		anim.play("idle")

	move_and_slide()
