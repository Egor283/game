extends Node2D
@export var mob_scene: PackedScene
@onready var timer = $Timer
func _on_timer_timeout():
	spawn()
func spawn():
	var orc = mob_scene.instantiate()
	orc.global_position = global_position
	orc.died.connect(_on_died)
	get_parent().add_child(orc)
func _on_died():
	print("a")
	timer.start()


	
