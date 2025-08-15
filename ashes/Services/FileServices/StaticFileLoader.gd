# =========================================
# Script: StaticFileLoader.gd
# Propósito: Controla el comportamiento de cargar los archivos estaticos
# Dependencias:
# Última modificación: 2025-08-15
# @tag: main
# =========================================

## Funciones ##
## Recive el path de un archivo json y lo devuelve en formato diccionario
static func load_static_json(json_path: String)-> Dictionary :
	if not FileAccess.file_exists(json_path):
		print("El archivo no existe.")
		return {}
		
	var json_data = FileAccess.open(json_path, FileAccess.READ)
	var result_data = JSON.parse_string(json_data.get_as_text())
	json_data.close()
	
	if result_data is Dictionary :
		return result_data
	else:
		print("Error al parsear JSON")
		return {}
