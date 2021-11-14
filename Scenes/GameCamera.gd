extends Camera2D

export (Color, RGB) var Backdrop
# Player position: Setting it to zero and then storing will nake the script player independant
var target_position = Vector2.ZERO
var camera_pos_x
var camera_pos_y

func _ready():
	VisualServer.set_default_clear_color(Backdrop)

func _process(delta):
	aquire_target_position()
	
	camera_pos_x = lerp(target_position.x, global_position.x, pow(2, -10 * delta))
	camera_pos_y = lerp(target_position.y, global_position.y, pow(2, -10 * delta))
	global_position =  Vector2(camera_pos_x, camera_pos_y)
		
func aquire_target_position():
	var players = get_tree().get_nodes_in_group("player")
	if(players.size() > 0):
		var player = players[0]
		target_position = player.global_position
