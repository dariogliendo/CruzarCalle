extends Node2D

var velocidad = 1;
var direccion = 1
var rng = RandomNumberGenerator.new();
var stopped = false;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var window = get_window()
	if not stopped:
		position.x += velocidad * direccion
	if position.x < -100 or position.x > window.size.x + 100:
		queue_free()
