extends Node2D

func _ready():
	get_tree().paused = false


func _process(_delta):
	if Input.is_action_pressed("ui_pause"):
		$gui/pause_menu.pause_game()

func _on_score_player_wins(player):
	$gui/game_over_menu.run(player)
