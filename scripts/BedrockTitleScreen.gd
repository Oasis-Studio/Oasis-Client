extends Control


onready var menu = "Main"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _input(event):
	if event.is_action_pressed("escape"):
		if menu == "Main":
			print("[BedrockTitleScreen] Opening Quit Menu")
			menu = "Quit"
		if menu == "Quit":
			print("[BedrockTitleScreen] Closing Quit Menu")
			menu = "Main"
		if menu == "Play":
			print("[BedrockTitleScreen] Closing Play Menu")
			menu = "Main"


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
