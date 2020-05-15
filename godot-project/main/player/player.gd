extends KinematicBody2D

var ColorUtils = preload("res://scripts/color_utils.gd")

var current_color: String = "R"
export var player_index: int = 1
export var bot: bool = false
export var velocity: float = 900
var direction: Vector2 = Vector2(0.0, 0.0)
var layer: int = 2

export var ball_path: NodePath
var ball: Node2D

func _ready():
	ColorUtils.set_color(self, current_color)
	ball = get_node(ball_path)
	print(ball)


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

func _physics_process(delta):
	if bot:
		if ball.position.y < self.position.y:
			direction.y = -1
		elif ball.position.y > self.position.y:
			direction.y = 1
		else:
			direction.y = 0
			
		ColorUtils.set_color(self, ball.current_color)
	
	move_and_collide(velocity * direction * delta)
