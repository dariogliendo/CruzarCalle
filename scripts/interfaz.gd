extends Node


func youDied():
	$die_sound.play()
	$"YOU DIED".visible = true
	$"YOU DIED/Animaciones".play("fade_in")
	await $die_sound.finished
	$"YOU DIED".visible = false

func youWon():
	$victory_sound.play()
	$victoria_texto.visible = true
	await get_tree().create_timer(3.0).timeout
