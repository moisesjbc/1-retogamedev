extends KinematicBody2D

var ColorUtils = preload("res://scripts/color_utils.gd")

export var speed: int = 500
var velocity: Vector2
var current_color: String = "R"
var layer: int = 1

# Emited whenever occurs a goal. The "player" signal is the index of the player
# (1 / 2) who scored.
signal goal(player)

# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)
	restart()


func restart():
	self.set_position(Vector2(0, 0))
	ColorUtils.set_color(self, current_color)
	randomize()
	velocity = Vector2(self.random_velocity_component(), self.random_velocity_component())


func random_sign():
	if randi() % 100 > 50:
		return 1
	else:
		return -1


func random_velocity_component(from: float = 0.4, to: float = 0.6):
	return self.random_sign() * rand_range(from, to)


func _physics_process(delta):
	# Source for colliding and bouncing:
	# https://godotengine.org/qa/25738/how-to-use-linear_velocity-reflect-or-bounce
	var collision = move_and_collide(speed * velocity.normalized() * delta)
	if collision:
		$hit_sound.play(0.05)
		velocity = velocity.bounce(collision.normal)
		
		# If the ball collides with a wall, set its color with the color of the
		# wall
		if collision.get_collider().name.find("wall") != -1:
			ColorUtils.set_color(self, collision.get_collider().current_color)


func _on_visibility_notifier_screen_exited():
	# Emit a signal indicating which player scored.
	var player = 1
	if position.x < 50:
		player = 2
	emit_signal("goal", player)
	
	# Restar the ball.
	restart()
