"""
la idea es q se cree el modelo dependiendo del json y el modelo se envia al crear 
la escena de la card y la card se envia al crear del holder
"""
static func create_card_resource(card_id: String, card_type: GlobalData.CardTypes, data: Dictionary) -> HeroCardModel:
	var new_card_resource
	var new_card
	
	match card_type:
		GlobalData.CardTypes.BaseCard :
			new_card_resource = BaseCardModel.new()
		GlobalData.CardTypes.HeroCard :
			new_card_resource = HeroCardModel.new()
	
	if data != {} :
		new_card_resource._load_data(card_id, data)
	
	if new_card_resource :
		new_card = create_card_scene(new_card_resource)
		
	return new_card


static func create_card_scene(card_resource) :
	var new_card_scene = load(GlobalData.CardScene).instantiate()
	new_card_scene.set_resource(card_resource) # Método en Card.gd
	
	return new_card_scene
