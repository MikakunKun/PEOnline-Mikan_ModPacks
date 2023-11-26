#pragma header

uniform float u_shift;

vec3 hue_shift(vec3 col, float hue) {
	vec3 k = vec3(0.57735);
	float c = cos(hue);
	return vec3(col * c + cross(k, col) * sin(hue) + k * dot(k, col) * (1.0 - c));
}

void main() {
	vec2 uv = openfl_TextureCoordv;
	gl_FragColor = texture2D(bitmap, uv);
	gl_FragColor = vec4(hue_shift(gl_FragColor.rgb, u_shift), gl_FragColor.a);
}