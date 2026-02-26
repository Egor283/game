extends CharacterBody2D

var hp = 100
var alive = true
@onready var anim = $AnimatedSprite2D
func _on_area_2d_area_entered(area):
	if area.name == "Attack":
		if alive == true and hp > 0:
			hp -= 25
			if hp <= 0:
				death()
func death():
	alive = false
	anim.play("death")
	await anim.animation_finished
	queue_free()
	
	
	
	
