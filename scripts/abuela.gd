extends Area2D

@export var velocidad_max = 15;

signal chocada(abuela)
var acu_delta = 0;

func _ready():
	$Animacion.play("default")

func _process(delta):
	var velocidad;
	acu_delta += delta
	velocidad = velocidad_max * (1 - acu_delta)
	if acu_delta >= 1:
		acu_delta = 0;
	var direccion = Vector2(0, -1);
	position += direccion * (velocidad * delta)
	var viewport = get_viewport_rect()
	if position.y > viewport.size.y:
		queue_free()


func _on_body_entered(body):
	if body is Vehiculo:
		chocada.emit(self)
