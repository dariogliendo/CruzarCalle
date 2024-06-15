extends Node

# Recibe una lista y devuelve un elemento al azar
func choice(opts: Array[Variant]):
	return opts[randi_range(0, len(opts) - 1)]
