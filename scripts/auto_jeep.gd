extends Node2D

var velocidad = 7;
var direccion = 1
var rng = RandomNumberGenerator.new();

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var window = get_window()
	position.x += velocidad * direccion
	if position.x < -100 or position.x > window.size.x + 100:
		queue_free()
