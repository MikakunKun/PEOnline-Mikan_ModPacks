#pragma header

uniform float u_contrast;

void main() {
	vec2 uv = openfl_TextureCoordv;
    vec4 tex = texture2D(bitmap, uv);
    gl_FragColor = clamp(vec4((tex.rgb - 0.5) * u_contrast + 0.5, tex.a), 0.0, 1.0);
}