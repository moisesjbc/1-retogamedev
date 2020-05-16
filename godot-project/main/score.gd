extends HBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	$player_1_score.text = "0"
	$player_2_score.text = "0"

func increment_score(player_score_label):
	player_score_label.text = str(int(player_score_label.text) + 1)
	

func _on_ball_goal(player):
	if player == 1:
		increment_score($player_1_score)
	else:
		increment_score($player_2_score)
