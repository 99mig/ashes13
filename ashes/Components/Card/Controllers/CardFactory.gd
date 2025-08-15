# @class MyCharacter
# @description A character controller for the player
# @author JohnDoe
# @version 1.0.0
# @tutorial https://example.com/tutorials/character-controller
class_name CardFactory



# @var pruebaborrar
# @type float
# @default 300.0
# @desc The character's movement speed
static var pruebaborrar

# @func move_character
# @desc Moves the character based on input
# @param {Vector2} direction - The direction to move
# @param {float} delta - Time since last frame
# @return {bool} - Whether movement was successful
static func create_card_resource(card_id, card_data: Dictionary) -> Resource:
	var new_card_resource
	print_debug("CARD DATA TO CREATE RESOURCE: ", card_data)
	# @var speed
	# @type float
	# @default 300.0
	# @desc The character's movement speed
	var card_type = GlobalData.CardTypes.keys().find(card_data["Type"])
	match card_type:
		GlobalData.CardTypes.BaseCard :
			new_card_resource = BaseCardModel.new()
		GlobalData.CardTypes.HeroCard :
			new_card_resource = HeroCardModel.new()
		_:
			new_card_resource = BaseCardModel.new()
	
	if card_data != {} :
		new_card_resource.load_data(card_id, card_data)
	
		
	return new_card_resource


static func create_card_scene(card_resource) :
	var new_card_scene = load(GlobalData.CardScene).instantiate()
	new_card_scene.set_resource(card_resource) # Método en Card.gd
	#esta logica maneja todo lo de la carta, ya aca el script q llamo a este
	#debe continuar con la logica y crear el holder
	return new_card_scene
