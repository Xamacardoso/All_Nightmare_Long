shader_type canvas_item;

//Set the blur intensity
uniform float blur_size : hint_range(0.0, 3.0);

//Create a blur effect in the pause menu background
void fragment() {
	//smooths the transition between pixel blur
    vec2 offset = vec2(blur_size / float(textureSize(SCREEN_TEXTURE, 0).x), blur_size / float(textureSize(SCREEN_TEXTURE, 0).y));
    vec4 color = vec4(0.0);
    color += texture(SCREEN_TEXTURE, SCREEN_UV + vec2(-offset.x, -offset.y)) * 0.05;
    color += texture(SCREEN_TEXTURE, SCREEN_UV + vec2(0.0, -offset.y)) * 0.1;
    color += texture(SCREEN_TEXTURE, SCREEN_UV + vec2(offset.x, -offset.y)) * 0.05;
    color += texture(SCREEN_TEXTURE, SCREEN_UV + vec2(-offset.x, 0.0)) * 0.1;
    color += texture(SCREEN_TEXTURE, SCREEN_UV) * 0.4;
    color += texture(SCREEN_TEXTURE, SCREEN_UV + vec2(offset.x, 0.0)) * 0.1;
    color += texture(SCREEN_TEXTURE, SCREEN_UV + vec2(-offset.x, offset.y)) * 0.05;
    color += texture(SCREEN_TEXTURE, SCREEN_UV + vec2(0.0, offset.y)) * 0.1;
    color += texture(SCREEN_TEXTURE, SCREEN_UV + vec2(offset.x, offset.y)) * 0.05;
    COLOR = color;
}
