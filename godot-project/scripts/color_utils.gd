

static func set_color(node, color: String):
	if color == "R":
		node.modulate = Color(1, 0, 0)
		node.set_collision_mask(node.layer + 4)
		node.set_collision_layer(node.layer + 4)
	elif color == "G":
		node.modulate = Color(0, 1, 0)
		node.set_collision_mask(node.layer + 8)
		node.set_collision_layer(node.layer + 8)
	else:
		node.modulate = Color(0, 0, 1)
		node.set_collision_mask(node.layer + 16)
		node.set_collision_layer(node.layer + 16)
		
	node.current_color = color
