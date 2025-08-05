"""
la idea es q se cree el modelo dependiendo del json y el modelo se envia al crear 
la escena de la card y la card se envia al crear del holder
"""

static func create_new_cardset(cardset_id, cardset_data: Dictionary) -> Node2D:
	var cardset_resource = create_cardset_resource(cardset_id, cardset_data)
	var cardset_scene = create_cardset_scene(cardset_id, cardset_resource)
	return cardset_scene


static func create_cardset_resource(cardset_id, cardset_data: Dictionary) -> Resource:
	var new_cardset_resource
	#print_debug("CARDSET DATA TO CREATE RESOURCE: ", cardset_data)
	new_cardset_resource = BaseCardSetModel.new()
	#var cardset_type = GlobalData.CardSetTypes.keys().find(cardset_data["Type"])
	#match cardset_type:
		#GlobalData.CardSetTypes.BaseCardSet :
			#new_cardset_resource = BaseCardSetModel.new()
		#_:
			#new_cardset_resource = BaseCardSetModel.new()
	
	if cardset_data != {} :
		new_cardset_resource.load_data(cardset_id, cardset_data)
	
		
	return new_cardset_resource


static func create_cardset_scene(cardset_id, cardset_resource) :
	var new_cardset_scene = load(GlobalData.CardSetScene).instantiate()
	new_cardset_scene.name = cardset_id
	new_cardset_scene.set_cardset_data(cardset_resource) # Método en CardSet.gd
	#esta logica maneja todo lo del set de cartas, ya aca el script q llamo a este
	#debe continuar con la logica y crear el holder
	return new_cardset_scene
