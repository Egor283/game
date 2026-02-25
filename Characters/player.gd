extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0

@onready var anim = get_node("AnimatedSprite2D")
func _physics_process(delta: float) -> void:
	# Add the gravity.

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction: Vector2 = Vector2(Input.get_axis("left", "right"), 
	Input.get_axis("up", "down")).normalized() * SPEED
	if direction:
		anim.play("run")
	else:
		anim.play("idle")
	velocity = direction * SPEED * delta
	move_and_slide()
