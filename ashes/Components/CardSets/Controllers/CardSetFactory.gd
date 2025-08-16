"""
la idea es q se cree el modelo dependiendo del json y el modelo se envia al crear 
la escena de la card y la card se envia al crear del holder
"""
## @class_doc
## @description este es la factory de cardsets
## @tags cardset, core
class_name CardSetFactory

static var pruebaborrar

# @func_title: create_new_cardset
# recive el id del set y el diccionario con los datos y devuelve el nodo creado

# @param cardset_id: es el identificador del cardset
# @param cardset_data: Dictionary contiende los datos necesairos
# @return: Node2D - devuelve la escena completa del cardset
static func create_new_cardset(cardset_id, cardset_data: Dictionary) -> Node2D:
	var cardset_resource = create_cardset_resource(cardset_id, cardset_data)
	var cardset_scene = create_cardset_scene(cardset_id, cardset_resource)
	return cardset_scene


## @func_doc
## @description This function handles player movementssdsdsdsdsd
## @param cardset_id: el identificard del cardset
## @param cardset_data: el diccionario con los datos
## @return Resource creaado apartir del identificador
## @tags movement, core
static func create_cardset_resource(cardset_id, cardset_data: Dictionary) -> Resource:
	## @var_doc
	## @description thius variable is loval for the function
	## @tags resoruces, local
	var new_cardset_resource
	new_cardset_resource = BaseCardSetModel.new()
	
	if cardset_data != {} :
		new_cardset_resource.load_data(cardset_id, cardset_data)
		
	return new_cardset_resource

static func create_cardset_scene(cardset_id, cardset_resource) :
	var new_cardset_scene = load(GlobalData.CardSetScene).instantiate()
	new_cardset_scene.name = cardset_id
	new_cardset_scene.set_cardset_data(cardset_resource)

	return new_cardset_scene
