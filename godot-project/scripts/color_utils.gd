

static func set_color(node, color: String):
	if color == "R":
		node.modulate = Color(1, 0, 0)
	elif color == "G":
		node.modulate = Color(0, 1, 0)
	else:
		node.modulate = Color(0, 0, 1)
