extends HBoxContainer

signal player_wins(player)

export var win_score = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	$player_1_score.text = "0"
	$player_2_score.text = "0"

func increment_score(player_index, player_score_label):
	var new_player_score: int = int(player_score_label.text) + 1
	player_score_label.text = str(new_player_score)
	if new_player_score >= win_score:
		emit_signal("player_wins", player_index)
	

func _on_ball_goal(player):
	if player == 1:
		increment_score(1, $player_1_score)
	else:
		increment_score(2, $player_2_score)
