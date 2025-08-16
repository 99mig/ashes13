## @class_doc
## @description Data Helper - A comprehensive player movement and interaction system
## Handles input processing, physics, and state management for the main character
## @tags core, helper
## @depends MainServices: implements the game flow
static func string_to_vector2i(input : String) -> Vector2i:
	# Eliminar todos los espacios y paréntesis
	var cleaned_input = input.replace(" ", "").replace("(", "").replace(")", "")
	
	# Separar la cadena por la coma
	var componentes = cleaned_input.split(",", false)
	
	if componentes.size() != 2:
		push_error("Formato inválido: se esperaban exactamente dos componentes separados por coma.")
		return Vector2i()
	
	# Verificar y convertir los valores
	var x = componentes[0]
	var y = componentes[1]
	
	if x.is_valid_int() and y.is_valid_int():
		return Vector2i(int(x), int(y))
	
	push_error("Valores no enteros encontrados: '%s', '%s'" % [x, y])
	return Vector2i()
