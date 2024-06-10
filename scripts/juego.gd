extends Node2D

const JEEP = preload("res://escenas/auto_jeep.tscn")
const CAMION = preload("res://escenas/auto_camion.tscn")
const AMBULANCIA = preload("res://escenas/auto_ambulancia.tscn")
const CIVIC = preload("res://escenas/auto_civic.tscn")
const CHETO = preload("res://escenas/auto_cheto.tscn")
const COUPE = preload("res://escenas/auto_coupe.tscn")
const PICKUP = preload("res://escenas/auto_pickup.tscn")
const tracks = [200, 270, 370, 450]
@export var frecuencia_autos : float = 1.0

const VEHICULOS = [AMBULANCIA, JEEP, CAMION, CIVIC, CHETO, COUPE, PICKUP]
var instanciados = []
var rng = RandomNumberGenerator.new()


func elegir_carril(instancia):
	var window = get_window()
	var num = rng.randf_range(0, tracks.size())
	if num <= 2:
		instancia.position.x = -100;
		instancia.direccion = 1;
	else:
		instancia.position.x = window.size.x + 100
		instancia.direccion = -1;
	
	instancia.position.y = tracks[num]
	
func remover_al_salir(body):
	instanciados = instanciados.filter(func(ins): return ins != body)

func spawn_timer():
	if $Gallina.vivo:
		var auto = VEHICULOS[rng.randf_range(0, VEHICULOS.size())].instantiate()
		elegir_carril(auto)
		auto.scale.x = auto.direccion
		add_child(auto)
		get_tree().connect("node_removed", remover_al_salir)
		instanciados.append(auto)

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_timer()
	var timer = Timer.new()
	timer.wait_time = frecuencia_autos
	timer.connect("timeout", spawn_timer)  # Connect signal to self
	add_child(timer)  # Add timer node to scene tree
	timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func parar_autos():
	for n in range(instanciados.size()):
		instanciados[n].stopped = true

func _on_gallina_body_entered(body):
	if $Gallina.vivo:
		$Gallina.vivo = false;
		parar_autos()
		$Gallina/Animacion.play("chocado");
		$die_sound.play()
		$"YOU DIED".visible = true;
		$"YOU DIED/Animaciones".play("fade_in")
		await get_tree().create_timer(3.0).timeout
		await $die_sound.finished
		$"YOU DIED".visible = false;
		get_tree().reload_current_scene()

func _on_area_2d_area_entered(area):
	$Gallina.vivo = false # Lo marco como que no está vivo para que se deshabiliten los controles
	$victory_sound.play()
	$Gallina/Animacion.play("victoria")
	parar_autos()
	$victoria_texto.visible = true
	await get_tree().create_timer(3.0).timeout
	get_tree().reload_current_scene()
