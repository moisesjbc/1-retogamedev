extends KinematicBody2D

var ColorUtils = preload("res://scripts/color_utils.gd")

export var speed: int = 500
var velocity: Vector2
var current_color: String = "R"
var layer: int = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	ColorUtils.set_color(self, current_color)
	set_physics_process(true)
	randomize()
	
	velocity = Vector2(self.random_velocity_component(), self.random_velocity_component())
	

func random_velocity_component():
	var _sign = 1
	if randi() % 100 > 50:
		_sign = -1
	return _sign * randf() + 0.50


func _physics_process(delta):
	# Source: https://godotengine.org/qa/25738/how-to-use-linear_velocity-reflect-or-bounce
	var collision = move_and_collide(speed * velocity.normalized() * delta)
	if collision:
		print(collision.get_collider().current_color)
		velocity = velocity.bounce(collision.normal)
