extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var conf = ProjectSettings.get_setting("Minecraft/UI/Main Type")
	if conf == null:
		print("Select game type")
	if conf == "bedrock":
		print("[GameStarter] Launching Bedrock UI")
		get_tree().change_scene("res://scenes/BedrockTitleScreen.tscn")
	if conf == "java":
		print("[GameStarter] Launching Java UI")
		get_tree().change_scene("res://scenes/JavaTitleScreen.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#func _ready():
	#var logger = Logger.new()
	#logger.config("[GameStarter] | %dt | %(levelname)s | %(message)s", "%y-%mo-%d %h:%m:%s", "jeff")
	#logger.DEBUG("Ready function called")
#	pass
