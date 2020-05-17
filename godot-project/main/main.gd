extends Node2D

func _ready():
	if globals.n_players == 1:
		$player_2.start_bot()
	get_tree().paused = true


func _process(_delta):
	if Input.is_action_pressed("ui_pause"):
		$gui/pause_menu.pause_game()

func _on_score_player_wins(player):
	$gui/game_over_menu.run(player)


func _on_countdown_timer_timeout():
	$gui/ready_container.visible = false
	get_tree().paused = false
