extends CenterContainer

var SceneUtils = preload("res://scripts/scene_utils.gd")

func run():
	pause_game()

func pause_game():
	get_tree().paused = not get_tree().paused
	visible = true

func unpause_game():
	get_tree().paused = false
	visible = false

func _on_resume_button_pressed():
	unpause_game()

func _on_return_button_pressed():
	unpause_game()
	SceneUtils.change_scene(get_tree(), "res://menus/main_menu/main_menu.tscn")


func _input(_event):
	if Input.is_action_just_pressed(("ui_resume")):
		unpause_game()
