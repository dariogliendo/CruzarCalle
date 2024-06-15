extends Node

const JEEP = preload("res://escenas/auto_jeep.tscn")
const CAMION = preload("res://escenas/auto_camion.tscn")
const AMBULANCIA = preload("res://escenas/auto_ambulancia.tscn")
const CIVIC = preload("res://escenas/auto_civic.tscn")
const CHETO = preload("res://escenas/auto_cheto.tscn")
const COUPE = preload("res://escenas/auto_coupe.tscn")
const PICKUP = preload("res://escenas/auto_pickup.tscn")

const VEHICULOS = [AMBULANCIA, JEEP, CAMION, CIVIC, CHETO, COUPE, PICKUP]

var instanciados = []

func remover_al_salir(auto):
	instanciados.erase(auto)

func spawnear_auto(y: int):
	var auto = Utils.choice(VEHICULOS).instantiate()
	auto.position.y = y
	auto.sale.connect(remover_al_salir)		# Conectamos la señal
	instanciados.append(auto)
	return auto

func parar_todos():
	for vehiculo in instanciados:
		vehiculo.stopped = true
