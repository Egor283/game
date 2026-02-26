extends CharacterBody2D
var SPEED = 100.0
const JUMP_VELOCITY = -400.0
var kda = true
var hp = 100
var stm = 100
@onready var anim = get_node("AnimatedSprite2D")
func _physics_process(delta):
	# Add the gravity.

	var direction2 := Input.get_axis("left", "right")
	var direction: Vector2 = Vector2(Input.get_axis("left", "right"), 
	Input.get_axis("up", "down")).normalized() * SPEED
	if direction and kda == true:
		anim.play("run")
	elif kda == true:
		anim.play("idle")
	velocity = direction * SPEED * delta
	if direction2 == -1:
		$AnimatedSprite2D.flip_h = true
	elif direction2 == 1:
		$AnimatedSprite2D.flip_h = false
	if Input.is_action_just_pressed("attack") and kda == true:
		kda = false

		SPEED = 10
		anim.play("attack")
		await anim.animation_finished
		kda = true
	if Input.is_action_pressed("run") and stm > 0:
		stm -= 10 * delta
		if kda == false:
			SPEED = 10
		else:
			SPEED = 130
	elif kda == false:
		SPEED = 10
		if stm < 100:
			stm += 3 * delta 
	else:
		SPEED = 100
		if stm < 100:
			stm += 3 * delta 
		
		
		
		
		
	
	move_and_slide()
