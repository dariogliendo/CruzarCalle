extends "res://scripts/vehiculo.gd"

func _ready():
	velocidad = 4;
	$Animacion.play("movimiento")
