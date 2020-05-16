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
	self.bot = false
	set_physics_process(true)

func start_bot():
	self.bot = true
	$ia_timer.start(0.1)


func _input(_event):
	if not self.bot:
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
	move_and_collide(velocity * self.direction * delta)


func _on_ia_timer_timeout():
	var direction_options = [1, -1, 0]
	var right_option_index = 0
	
	if self.global_position.y < ball.global_position.y:
		right_option_index = 0
	elif self.global_position.y > ball.global_position.y:
		right_option_index = 1
	else:
		right_option_index = 2
		
	if randi() % 100 < 90:
		self.direction.y = direction_options[right_option_index]
	else:
		self.direction.y = direction_options[(right_option_index + 1) % 3]
		
	ColorUtils.set_color(self, ball.current_color)
