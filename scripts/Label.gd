extends Label

var GALLINA = preload("res://escenas/personaje.tscn")


func _on_victoria_body_entered(body):
	print(body.get_class())
	visible = true
	await get_tree().create_timer(3.0).timeout
	visible = false
