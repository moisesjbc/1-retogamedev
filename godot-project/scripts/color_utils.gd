

static func set_color(node, color: String):
	if color == "R":
		node.modulate = globals.colors[globals.current_colors_index][0]
		node.set_collision_mask(node.layer + 4)
		node.set_collision_layer(node.layer + 4)
	elif color == "G":
		node.modulate = globals.colors[globals.current_colors_index][1]
		node.set_collision_mask(node.layer + 8)
		node.set_collision_layer(node.layer + 8)
	else:
		node.modulate = globals.colors[globals.current_colors_index][2]
		node.set_collision_mask(node.layer + 16)
		node.set_collision_layer(node.layer + 16)
		
	node.current_color = color
