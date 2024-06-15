extends Node2D

class_name Vehiculo

var velocidad = 1
var direccion = 1
var stopped = false

signal sale(vehiculo)

# Lo ubica fuera de la pantalla, izq o der con 50% chance
func init_offscreen():
	var desde_izquierda = randf() < 0.5		# Chance 50%
	var viewport = get_viewport_rect()
	if desde_izquierda:
		position.x = -100;
		direccion = 1
	else:
		position.x = viewport.size.x + 100
		direccion = -1
	scale.x = direccion

func _ready():
	init_offscreen()

func _process(delta):
	
	# Movimiento
	if not stopped:
		position.x += velocidad * direccion
	
	# Si sale de la pantalla, lo eliminamos
	var viewport = get_viewport_rect()
	if position.x < -100 or position.x > viewport.size.x + 100:
		sale.emit(self)		# Avisamos pa'fuera que se va
		queue_free()
