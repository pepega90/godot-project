extends ParallaxBackground

export (Texture) var bg_texture

func _ready():
	$BackgroundTexture.texture = bg_texture
