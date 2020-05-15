extends KinematicBody2D

var current_color: Color = Color(1, 0, 0)
export var player_index: int = 1
export var velocity: float = 900
var direction: Vector2 = Vector2(0.0, 0.0)


func _ready():
	self.modulate = current_color


func _input(_event):
	if Input.is_action_pressed("ui_up_player_"+String(player_index)):
		direction.y = -1
	elif Input.is_action_pressed("ui_down_player_"+String(player_index)):
		direction.y = 1
	else:
		direction.y = 0


func _process(delta):
	move_and_collide(velocity * direction * delta)
