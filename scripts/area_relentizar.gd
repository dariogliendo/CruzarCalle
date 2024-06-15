extends Area2D

func _on_body_entered(body):
	if body is Vehiculo:
		body.velocidad = get_parent().velocidad
