extends Node

const JEEP = preload("res://escenas/auto_jeep.tscn")
const CAMION = preload("res://escenas/auto_camion.tscn")
const AMBULANCIA = preload("res://escenas/auto_ambulancia.tscn")
const CIVIC = preload("res://escenas/auto_civic.tscn")
const CHETO = preload("res://escenas/auto_cheto.tscn")
const COUPE = preload("res://escenas/auto_coupe.tscn")
const PICKUP = preload("res://escenas/auto_pickup.tscn")

const VEHICULOS = [AMBULANCIA, JEEP, CAMION, CIVIC, CHETO, COUPE, PICKUP]
var speed = 0


var instanciados = []

func remover_al_salir(auto):
	instanciados.erase(auto)

func spawnear_auto(y: int):
	var vel = 0
	if y == 200:
		vel = 2
	if y == 270:
		vel = 4
	if y == 370:
		vel = 3
	if y == 450:
		vel = 5

	var auto = Utils.choice(VEHICULOS).instantiate(vel)
	auto.velocidad = vel
	auto.position.y = y
	auto.sale.connect(remover_al_salir)		# Conectamos la señal
	instanciados.append(auto)
	return auto

func parar_todos():
	for vehiculo in instanciados:
		vehiculo.stopped = true
