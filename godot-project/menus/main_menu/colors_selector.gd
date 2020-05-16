extends HBoxContainer


func _ready():
	self.set_colors(0)


func set_colors(color_index):
	globals.current_colors_index = color_index
	$color_r.color = globals.colors[globals.current_colors_index][0]
	$color_g.color = globals.colors[globals.current_colors_index][1]
	$color_b.color = globals.colors[globals.current_colors_index][2]


func _on_change_colors_button_pressed():
	set_colors((globals.current_colors_index + 1) % globals.colors.size())
