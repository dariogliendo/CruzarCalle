extends Node2D

@export var velocidad = 3
var encarando_x = 1
var encarando_y = 0
var pos_inicial = Vector2(580, 575)
var vivo = true


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if vivo:
		if Input.is_action_pressed("arriba"):
			$Animacion.play("corriendo_arriba")
			encarando_y = 1
			position.y -= velocidad
		if Input.is_action_pressed("abajo"):
			$Animacion.play("corriendo_abajo")
			encarando_y = 0
			position.y += velocidad
		if Input.is_action_pressed("derecha"):
			if not Input.is_action_pressed("arriba") and not Input.is_action_pressed("abajo"):
				$Animacion.play("corriendo_derecha")
			encarando_x = 1
			position.x += velocidad
		if Input.is_action_pressed("izquierda"):
			if not Input.is_action_pressed("arriba") and not Input.is_action_pressed("abajo"):
				$Animacion.play("corriendo_izquierda")
			encarando_x = 0
			position.x -= velocidad
			
		if not Input.is_anything_pressed():
			if encarando_y:
				$Animacion.play("idle_espalda")
			else:
				$Animacion.play("idle_frente")
