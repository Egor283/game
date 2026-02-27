extends CharacterBody2D

var hp = 100
var alive = true
signal die
@onready var anim = $AnimatedSprite2D
func _physics_process(delta):
	pass

func _on_area_2d_area_entered(area):
	if area.name == "Attack":
		if alive == true and hp > 0:
			hp -= 25
			if hp <= 0:
				death()
func death():
	die.emit()
	alive = false
	anim.play("death")
	await anim.animation_finished
	queue_free()
	
	
	
	
