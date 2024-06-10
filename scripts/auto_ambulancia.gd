extends "res://scripts/vehiculo.gd"

func _ready():
	velocidad = 4;
	$AnimatedSprite2D.play("movimiento")
