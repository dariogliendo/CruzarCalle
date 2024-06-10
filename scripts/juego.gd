extends Node2D

const JEEP = preload("res://escenas/auto_jeep.tscn")
const tracks = [200, 270, 370, 450]

func elegir_direccion(): 
	var sides = [-1, 1] # -1 izquierda / 1 derecha
	return sides[randi() % sides.size()]

func spawn_timer():
	var window = get_window()
	var rng = RandomNumberGenerator.new()
	var jeep = JEEP.instantiate()
	jeep.direccion = elegir_direccion()
	var posicion_spawn_x;
	if jeep.direccion == 1:
		posicion_spawn_x = -100
	if jeep.direccion == -1:
		posicion_spawn_x = window.size.x + 100
		jeep.scale.x = -1
	add_child(jeep)
	jeep.position = Vector2(posicion_spawn_x, tracks[rng.randf_range(0,3)])

# Called when the node enters the scene tree for the first time.
func _ready():
	var timer = Timer.new()
	timer.wait_time = 1.0
	timer.connect("timeout", spawn_timer)  # Connect signal to self
	add_child(timer)  # Add timer node to scene tree
	timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
