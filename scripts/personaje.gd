extends Node2D

@export var velocidad = 3
var encarando_x = 1
var encarando_y = 0
var pos_inicial = Vector2(580, 575)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("arriba"):
		$Personaje/Animacion.play("corriendo_arriba")
		encarando_y = 1
		position.y -= velocidad
	if Input.is_action_pressed("abajo"):
		$Personaje/Animacion.play("corriendo_abajo")
		encarando_y = 0
		position.y += velocidad
	if Input.is_action_pressed("derecha"):
		$Personaje/Animacion.play("corriendo_derecha")
		encarando_x = 1
		position.x += velocidad
	if Input.is_action_pressed("izquierda"):
		$Personaje/Animacion.play("corriendo_izquierda")
		encarando_x = 0
		position.x -= velocidad
		
	if not Input.is_anything_pressed():
		if encarando_y:
			$Personaje/Animacion.play("idle_espalda")
		else:
			$Personaje/Animacion.play("idle_frente")

func _on_victoria_body_entered(body):
	await get_tree().create_timer(3.0).timeout
	position = pos_inicial
	
