extends Sprite2D


func _on_gallina_body_entered(body):
	visible = true
	$Animaciones.play("fade_in")
	await get_tree().create_timer(3.0).timeout
	$Animaciones.play("fade_out")
	await $Animaciones.animation_finished
	visible = false
	
