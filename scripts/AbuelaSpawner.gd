extends Node2D

const ABUELA = preload("res://escenas/abuela.tscn")

var abuelas = []
@export var chance = 0.3

func _on_timer_timeout():
	var rng = randf_range(0, 1)
	var viewport = get_viewport_rect()
	if rng > (1 - chance):
		var abuela = ABUELA.instantiate()
		abuela.position = Vector2(randi_range(30, viewport.size.x - 30), viewport.size.y)
		add_child(abuela)
		abuela.connect("chocada", al_chocar)
		
func al_chocar(_abuela):
	print("choca3")

func _on_contador_inicio_contador_inicio_completado():
	$Timer.start()
