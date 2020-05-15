extends KinematicBody2D

var ColorUtils = preload("res://scripts/color_utils.gd")

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
		
	if Input.is_action_just_pressed("ui_red_player_"+String(player_index)):
		ColorUtils.set_color(self, "R")
	elif Input.is_action_just_pressed("ui_green_player_"+String(player_index)):
		ColorUtils.set_color(self, "G")
	elif Input.is_action_just_pressed("ui_blue_player_"+String(player_index)):
		ColorUtils.set_color(self, "B")


func _process(delta):
	move_and_collide(velocity * direction * delta)
