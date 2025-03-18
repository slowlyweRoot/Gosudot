shader_type canvas_item;

uniform sampler2D noise_texture;
uniform float amount : hint_range(0.0,1.0);

void fragment() {
	vec4 current_pixel= texture(TEXTURE, UV);
	vec4 noise_pixel = texture(noise_texture, UV);
	
	if(noise_pixel.r > amount){
		COLOR.a -= 1.0f;
	}
	else{
		COLOR=current_pixel;
	}
	
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
