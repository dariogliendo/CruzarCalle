extends Node

const tracks = [200, 270, 370, 450]
@export var frecuencia_autos : float = 1.0

func _ready():
	$SpawnTimer.wait_time = frecuencia_autos

func detener(): 
	$SpawnTimer.stop()
	$Vehiculos.parar_todos()

func fail():
	detener()
	$Gallina.muere()
	await $Interfaz.youDied()
	get_tree().reload_current_scene()

func victoria():
	detener()
	$Gallina.gana()
	await $Interfaz.youWon()
	# En lugar de esto podría reiniciar con más dificultad
	get_tree().reload_current_scene()	

func _on_gallina_body_entered(body):
	if body is Vehiculo:
		fail()

func _on_area_2d_area_entered(area):
	if area is Personaje:
		victoria()
	
func _on_spawn_timer_timeout():
	add_child($Vehiculos.spawnear_auto(Utils.choice(tracks)))

# Comentario :)
