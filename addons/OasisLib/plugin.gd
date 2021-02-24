tool
extends EditorPlugin


func _enter_tree():
	print("[OasisLib] Tree Entered")
	add_custom_type("BedButton", "Control", preload("res://addons/OasisLib/ui/BedButton.gd"), preload("res://addons/OasisLib/icons/UIButton.png"))
	print("[OasisLib] Attempted to add UIButton")
	#add_custom_type("JavaOptionsBackground", "Control", preload("res://addons/OasisLib/ui/UIButton.gd"), preload("res://addons/OasisLib/icons/UIButton.png"))
	#print("[OasisLib] Attempted to add UIButton")
	# add type BedrockUI under Control, class_name BedrockUI, extends Control
	# add type BedButton under BedrockUI, extends BedrockUI
	
	# add type JavaUI under Control, class_name JavaUI, extends Control
	# add type JavaButton under JavaUI, extends JavaUI
	# add type JavaBackground under JavaUI, extends JavaUI
	
	# REWRITE
	#add_custom_type("BedrockUI", "Control", preload("res://addons/OasisLib/ui/bedrock.gd"), preload("res://addons/OasisLib/icons/UIButton.png"))
	#add_custom_type("BedButton", "BedrockUI", preload("res://addons/OasisLib/ui/BedButton.gd"), preload("res://addons/OasisLib/icons/UIButton.png"))
	
	
	
	pass
	


func _exit_tree():
	print("[OasisLib] Tree Exited")
	remove_custom_type("BedrockUI")
	remove_custom_type("BedButton")
	print("[OasisLib] Attempted to remove UIButton")
