Extends Control

#Small Image File Dropping Example For Godot.
#Used to create a texture from a file that is dropped on the control node and applying it to a nodes texture.

func _ready():
	get_tree().connect("files_dropped",self,"handleDroppedFiles") #This is a signal emitted when you drop a file in to this control nodes area.


func handleDroppedFiles(files:PoolStringArray,screen:int)->void:
	var dropped_image:Image = Image.new() #Start by creating a new image that will be used for a texture.
	dropped_image.load(files[0]) # Take the data from the file and load it it to the image.
	var new_texture:ImageTexture = ImageTexture.new()  # Create a new texture to apply your image to.
	new_texture.create_from_image(dropped_image,Texture.FLAG_REPEAT) # Create a texture using the dropped image data.
        applyTexture(new_texture) #apply the texture to the node.
        
        #To get the name of the dropped file
        var dropped_files_name = files[0].get_name() #this will get a single or first files name that was dropped.

func applyTexture(texture:ImageTexture) -> void:
            $nodeToApplyTextureTo.texture =_texture
