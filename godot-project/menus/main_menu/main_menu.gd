extends CanvasLayer

var SceneUtils = preload("res://scripts/scene_utils.gd")

func _ready():
	if (OS.get_name() == "HTML5"):
		$CenterContainer/VBoxContainer/exit_game_button.queue_free()


func start_game(n_players):
	globals.n_players = n_players
	SceneUtils.change_scene(get_tree(), "res://main/main.tscn")


func _on_start_game_1_player_button_pressed():
	self.start_game(1)


func _on_start_game_2_players_button_pressed():
	self.start_game(2)


func _on_exit_game_button_pressed():
	get_tree().quit()


func _on_credits_button_pressed():
	SceneUtils.change_scene(get_tree(), "res://menus/credits_menu/credits_menu.tscn")


func _on_how_to_play_button_pressed():
	SceneUtils.change_scene(get_tree(), "res://menus/how_to_play_menu/how_to_play_menu.tscn")

func _on_options_button_pressed():
	SceneUtils.change_scene(get_tree(), "res://menus/options_menu/options_menu.tscn")
