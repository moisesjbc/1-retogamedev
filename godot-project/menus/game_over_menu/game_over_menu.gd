extends CenterContainer

var SceneUtils = preload("res://scripts/scene_utils.gd")

func run(player_index: int):
	$panel/margin/layout/title.text = "Player " + str(player_index) + " wins!"
	pause_game()

func pause_game():
	get_tree().paused = true
	visible = true

func unpause_game():
	visible = false
	get_tree().paused = false
	
func _input(event):
	if self.visible and Input.is_action_just_pressed("ui_resume"):
		self._on_restart_button_pressed()

func _on_restart_button_pressed():
	SceneUtils.change_scene(get_tree(), "res://main/main.tscn")
	unpause_game()

func _on_return_button_pressed():
	SceneUtils.change_scene(get_tree(), "res://menus/main_menu/main_menu.tscn")
	unpause_game()
