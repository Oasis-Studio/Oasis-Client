# Allows us to display the Button in the editor and update it's rect size
tool
extends Control

export(Texture) onready var Normal = load("res://bedrock_res/resources/textures/ui/button_borderless_light.tres")
export(Texture) onready var Hover = load("res://bedrock_res/resources/textures/ui/button_borderless_lighthover.tres")
export(String) var Text = "" setget var_signal
export(Texture) var Icon = null
export(bool) var AddChild = true

export(String) var FilePath = ""

var hover = false
var node

# Called when the node enters the scene tree for the first time.
func _ready():
	mouse_filter = 1
	connect("item_rect_changed", self, "_item_rect_changed")
	connect("mouse_entered", self, "hover", [true])
	connect("mouse_exited", self, "hover", [false])
	add_child(ColorRect.new(), true)
	add_child(ColorRect.new(), true)
	add_child(ColorRect.new(), true)
	add_child(ColorRect.new(), true)
	add_child(ColorRect.new(), true)
	add_child(ColorRect.new(), true)
	add_child(ColorRect.new(), true)
	add_child(ColorRect.new(), true)
	add_child(Label.new(), true)
	add_child(TextureRect.new(), true)
	add_child(AudioStreamPlayer.new(), true)
	get_node("AudioStreamPlayer").bus = "Sound"
	for _i in get_children():
		if _i.name != "AudioStreamPlayer":
			_i.mouse_filter = 1
	get_node("ColorRect").name = "Border"
	get_node("ColorRect2").name = "BottomRightBorder"
	get_node("ColorRect3").name = "TopLeftBorder"
	get_node("ColorRect4").name = "Filling"
	get_node("ColorRect5").name = "TopLeftCorner"
	get_node("ColorRect6").name = "TopRightCorner"
	get_node("ColorRect7").name = "BottomLeftCorner"
	get_node("ColorRect8").name = "BottomRightCorner"
	node = get_node("Label")
	node.text = Text
	node.add_color_override("font_color", Color("#4b4b4b"))
	$Label.set("custom_fonts/font", load("res://bedrock_res/resources/font/minecraft.tres"))
	node.rect_size = rect_size
	node.align = 1
	node.valign = 1
	_item_rect_changed()
	hover(false)

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed and hover:
			get_node("AudioStreamPlayer").stream = load("res://bedrock_res/resource_packs/vanilla/sounds/random/explode" + str(rand_range(1, 5)).pad_decimals(0) + ".ogg")
			get_node("AudioStreamPlayer").play()
			if FilePath != "":
				var child = load(FilePath).instance()
				if AddChild:
					get_tree().get_current_scene().add_child(child)
				else:
					get_tree().change_scene(FilePath)
				child.free()
			#get_tree().get_current_scene().menu = "Play"
			

func _item_rect_changed():
	get_node("TextureRect").texture = Icon
	node = get_node("Label")
	node.text = Text
	node.add_color_override("font_color", Color("#4b4b4b"))
	$Label.set("custom_fonts/font", load("res://bedrock_res/resources/font/minecraft.tres"))
	node.rect_size = rect_size
	node.align = 1
	node.valign = 1
	node = get_node("Border")
	node.rect_size = rect_size
	node.set_position(Vector2(0, 0))
	node.color = Color(0, 0, 0)
	node = get_node("BottomRightBorder")
	node.rect_size = Vector2(rect_size[0] - 9, rect_size[1] - 9)
	node.set_position(Vector2(6, 6))
	node = get_node("TopLeftBorder")
	node.rect_size = Vector2(rect_size[0] - 9, rect_size[1] - 9)
	node.set_position(Vector2(3,3))
	node = get_node("Filling")
	node.rect_size = Vector2(rect_size[0] - 12, rect_size[1] - 12)
	node.set_position(Vector2(6, 6))
	node = get_node("TopLeftCorner")
	node.rect_size = Vector2(3, 3)
	node.set_position(Vector2(3, 3))
	node = get_node("TopRightCorner")
	node.rect_size = Vector2(3, 3)
	node.set_position(Vector2(rect_size[0] - 6, 3))
	node = get_node("BottomLeftCorner")
	node.rect_size = Vector2(3, 3)
	node.set_position(Vector2(3, rect_size[1] - 6))
	node = get_node("BottomRightCorner")
	node.rect_size = Vector2(3, 3)
	node.set_position(Vector2(rect_size[0] - 6, rect_size[1] - 6))

func hover(hovr):
	if not hovr:
		hover = false
		var data = Normal.get_data()
		data.lock()
		get_node("TopLeftCorner").color = data.get_pixel(0,0)
		get_node("TopLeftBorder").color = data.get_pixel(0,1)
		get_node("Filling").color = data.get_pixel(1,1)
		get_node("TopRightCorner").color = data.get_pixel(3,0)
		get_node("BottomLeftCorner").color = data.get_pixel(0,3)
		get_node("BottomRightBorder").color = data.get_pixel(3,2)
		get_node("BottomRightCorner").color = data.get_pixel(3,3)
		get_node("Label").add_color_override("font_color", Color("#4b4b4b"))
		get_node("Border").color = Color(0,0,0)
	if hovr:
		hover = true
		var data = Hover.get_data()
		data.lock()
		get_node("TopLeftCorner").color = data.get_pixel(0,0)
		get_node("TopLeftBorder").color = data.get_pixel(0,1)
		get_node("Filling").color = data.get_pixel(1,1)
		get_node("TopRightCorner").color = data.get_pixel(3,0)
		get_node("BottomLeftCorner").color = data.get_pixel(0,3)
		get_node("BottomRightBorder").color = data.get_pixel(3,2)
		get_node("BottomRightCorner").color = data.get_pixel(3,3)
		get_node("Label").add_color_override("font_color", Color(1,1,1))
		get_node("Border").color = Color(1,1,1)

func var_signal(text):
	if get_node("Label") != null:
		get_node("./Label").text = text
	Text = text
