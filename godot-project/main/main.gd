extends Node2D

signal game_over

func _process(_delta):
	if Input.is_action_pressed("ui_pause"):
		$gui/pause_menu.pause_game()
	
	# Just a sample for triggering a game over.
	#if Input.is_action_pressed("ui_up"):
	#	emit_signal("game_over")


func _on_main_game_over():
	$gui/game_over_menu.run()
