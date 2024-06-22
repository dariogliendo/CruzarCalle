extends TileMap

const PASTO = Vector2i(0, 9)
const ASFALTO = Vector2i(2, 0)
const SENDA = Vector2i(0, 0)
const LINEA = Vector2i(1, 1)
const SEPARADOR = Vector2i(0, 2)

const ancho = 80
const alto = 41

var fila = alto

func crear_fila(tile):
	for x in range(ancho):
		set_cell(0, Vector2i(x, fila), 0, tile)
	fila -= 1
	
func crear_fila_calle(tile):
	for x in range(3):
		set_cell(0, Vector2i(x, fila), 0, tile)
	for x in range(3, 8):
		set_cell(0, Vector2i(x, fila), 0, SENDA)
	for x in range(8, ancho):
		set_cell(0, Vector2i(x, fila), 0, tile)
	fila -= 1

func pasto(n):
	for i in range(n):
		crear_fila(PASTO)
		
func calle(n):
	crear_fila(SEPARADOR)
	for i in range(n / 2):
		crear_fila_calle(ASFALTO)
	crear_fila_calle(LINEA)
	for i in range(n / 2):
		crear_fila_calle(ASFALTO)
	crear_fila(SEPARADOR)

func _ready():
	pasto(6)
	calle(6)
	pasto(4)
	calle(10)
	pasto(1)
	calle(12)
