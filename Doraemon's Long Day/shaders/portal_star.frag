#pragma header

uniform float u_elapsed;

float fsin(float v) {
	v = 2.0 * fract(v / 2.0);
	v = v <= 1.0 ? -4.0 * v * (v - 1.0) : 4.0 * (v - 1.0) * (v - 2.0);
	return v * (0.775 + 0.225 * abs(v));
}

mat2 rot(float a) {
	float s = fsin(a);
	float c = fsin(a + 0.5);
	return mat2(c, -s, s, c);
}

void main() {
	float time = fract(u_elapsed);
	vec2 uv = 2.0 * (openfl_TextureCoordv - 0.5) * rot(0.1 / (fsin(time) / fsin(time + 0.5))) / fsin(time);
	float val = max(1.0 - length(uv), 0.0) / abs(uv.x * uv.y / (1.0 / fsin(time / 2.0) - 1.0));
	vec3 col = clamp(val * vec3(0.5, 0.2, 0.8), 0.0, 1.0);
	gl_FragColor = vec4(col * col, 1.0);
}