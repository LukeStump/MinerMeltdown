shader_type canvas_item;


void fragment() {
	vec4 input_color = texture(TEXTURE, UV);
	COLOR = vec4(1.0, input_color.g, 0.0, input_color.a);
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
