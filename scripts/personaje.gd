extends Node2D

class_name Personaje

@export var velocidad = 3
var cara_visible = "espalda"
var activo = true

func muere():
	activo = false
	$Animacion.play("chocado")

func gana():
	activo = false
	$Animacion.play("victoria")

func _process(delta):
	
	# Si no está activo, no se mueve
	if not(activo): return
	
	# Leemos las teclas y modificamos la posición
	var v = Input.get_vector("izquierda", "derecha", "arriba", "abajo")
	position += v * velocidad
	
	# Actualizamos la apariencia según la velocidad
	apariencia(v)


# Determina la apariencia a partir del vector velocidad
func apariencia(v: Vector2):
	
	const DEADZONE = 0.1
	
	var quieto = v.length() < DEADZONE
	var yendo_arr = not(quieto) and v.y < -DEADZONE
	var yendo_abj = not(quieto) and v.y > DEADZONE
	var yendo_izq = not(quieto) and v.x < -DEADZONE
	var yendo_der = not(quieto) and v.x > DEADZONE
	
	if quieto:
		$Animacion.play("idle_" + cara_visible)
		
	if yendo_der:
		$Animacion.play("corriendo_derecha")
		
	if yendo_izq:
		$Animacion.play("corriendo_izquierda")

	if yendo_abj:
		$Animacion.play("corriendo_abajo")
		cara_visible = "frente"
		
	if yendo_arr:
		$Animacion.play("corriendo_arriba")
		cara_visible = "espalda"
	
	
