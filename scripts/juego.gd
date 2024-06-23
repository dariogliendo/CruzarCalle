extends Node

const tracks = [200, 270, 370, 450]
@export var frecuencia_autos : float = 1.0

var flag_450 = true
var flag_370 = true
var flag_270 = true
var flag_200 = true

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
	var lane_choice = Utils.choice(tracks)
	if flag_450 and lane_choice == 450:
		add_child($Vehiculos.spawnear_auto(450))
		flag_450 = false
	if flag_370 and lane_choice == 370:
		add_child($Vehiculos.spawnear_auto(370))
		flag_370 = false
	if flag_270 and lane_choice == 270:
		add_child($Vehiculos.spawnear_auto(270))
		flag_270 = false
	if flag_200 and lane_choice == 200:
		add_child($Vehiculos.spawnear_auto(200))
		flag_200 = false						
		
func _on_lane_450_trigger_body_entered(body):
	if body is Vehiculo:
		var wait_time = randf_range(0,0.7)		
		$Mapa/Lane_450_Trigger/RespawnTimer_450.wait_time = wait_time		
		$Mapa/Lane_450_Trigger/RespawnTimer_450.start()

func _on_lane_370_trigger_body_entered(body):
	if body is Vehiculo:
		var wait_time = randf_range(0,0.7)	
		$Mapa/Lane_370_Trigger/RespawnTimer_370.wait_time = wait_time		
		$Mapa/Lane_370_Trigger/RespawnTimer_370.start()
	
	


func _on_lane_270_trigger_body_entered(body):
	if body is Vehiculo:
		var wait_time = randf_range(0,0.7)	
		$Mapa/Lane_270_Trigger/RespawnTimer_270.wait_time = wait_time		
		$Mapa/Lane_270_Trigger/RespawnTimer_270.start()	
	


func _on_lane_200_trigger_body_entered(body):
	if body is Vehiculo:
		var wait_time = randf_range(0,0.7)	
		$Mapa/Lane_200_Trigger/RespawnTimer_200.wait_time = wait_time		
		$Mapa/Lane_200_Trigger/RespawnTimer_200.start()	
	


func _on_respawn_timer_450_timeout():
	add_child($Vehiculos.spawnear_auto(450))


func _on_respawn_timer_370_timeout():
	add_child($Vehiculos.spawnear_auto(370))


func _on_respawn_timer_270_timeout():
	add_child($Vehiculos.spawnear_auto(270))


func _on_respawn_timer_200_timeout():
	add_child($Vehiculos.spawnear_auto(200))
