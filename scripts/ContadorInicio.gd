extends Node

@export var cuenta = 3;

signal contador_inicio_completado()

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Label.text = str(cuenta);


func _on_timer_timeout():
	if (cuenta == 0):
		$Timer.stop();
		contador_inicio_completado.emit()
		$Label.visible = false;
		queue_free()
	else:
		cuenta -= 1;
