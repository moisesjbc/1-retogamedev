extends Sprite

var current_color: Color = Color(1, 0, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
	self.modulate = current_color


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
