extends Node2D
@export var mob_scene: PackedScene
@onready var timer = $Timer
func _ready():
	spawn()
func _on_die():
	timer.start()
func _on_timer_timeout():
	spawn()
func spawn():
	var orc = mob_scene.instantiate()
	orc.die.connect(_on_die)
	orc.set_deferred("global_position", Vector2(250, 180))
	get_parent().add_child.call_deferred(orc)



	
