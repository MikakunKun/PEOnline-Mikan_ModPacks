#pragma header

uniform float u_elapsed;
uniform float u_scale;
uniform float u_intensity;

vec4 permute(vec4 v) {
	return mod((v * 34.0 + 1.0) * v, 289.0);
}

vec4 taylor(vec4 v) {
	return 1.79284291400159 - v * 0.85373472095314;
}

vec4 smplx(vec3 v) {
	vec3 i = floor(v + dot(v, vec3(1.0 / 3.0)));
	vec3 p1 = v - i + dot(i, vec3(1.0 / 6.0));
	
	vec3 g = step(p1.yzx, p1.xyz);
	vec3 l = 1.0 - g;
	vec3 i1 = min(g.xyz, l.zxy);
	vec3 i2 = max(g.xyz, l.zxy);
	
	vec3 p2 = p1 - i1 + (1.0 / 6.0);
	vec3 p3 = p1 - i2 + (1.0 / 3.0);
	vec3 p4 = p1 - 0.5;
	
	vec4 ix = i.x + vec4(0.0, i1.x, i2.x, 1.0);
	vec4 iy = i.y + vec4(0.0, i1.y, i2.y, 1.0);
	vec4 iz = i.z + vec4(0.0, i1.z, i2.z, 1.0);
	vec4 r = mod(permute(permute(permute(iz) + iy) + ix), 49.0);
	vec4 x0 = floor(r / 7.0);
	vec4 y0 = floor(r - 7.0 * x0);
	vec4 x = (x0 * 2.0 + 0.5) / 7.0 - 1.0;
	vec4 y = (y0 * 2.0 + 0.5) / 7.0 - 1.0;
	vec4 h = 1.0 - abs(x) - abs(y);
	
	vec4 b0 = vec4(x.xy, y.xy);
	vec4 b1 = vec4(x.zw, y.zw);
	
	vec4 s0 = floor(b0) * 2.0 + 1.0;
	vec4 s1 = floor(b1) * 2.0 + 1.0;
	vec4 sh = -step(h, vec4(0.0));
	vec4 a0 = b0.xzyw + s0.xzyw * sh.xxyy;
	vec4 a1 = b1.xzyw + s1.xzyw * sh.zzww;
	
	vec3 g1 = vec3(a0.xy, h.x);
	vec3 g2 = vec3(a0.zw, h.y);
	vec3 g3 = vec3(a1.xy, h.z);
	vec3 g4 = vec3(a1.zw, h.w);
	
	vec4 n = taylor(vec4(dot(g1, g1), dot(g2, g2), dot(g3, g3), dot(g4, g4)));
	vec3 n1 = g1 * n.x;
	vec3 n2 = g2 * n.y;
	vec3 n3 = g3 * n.z;
	vec3 n4 = g4 * n.w;
	
	vec4 m = vec4(dot(p1, p1), dot(p2, p2), dot(p3, p3), dot(p4, p4));
	vec4 m1 = max(0.6 - m, 0.0);
	vec4 m2 = m1 * m1;
	vec4 m3 = m2 * m1;
	vec4 m4 = m2 * m2;
	
	vec3 q1 = -6.0 * m3.x * p1 * dot(p1, n1) + m4.x * n1;
	vec3 q2 = -6.0 * m3.y * p2 * dot(p2, n2) + m4.y * n2;
	vec3 q3 = -6.0 * m3.z * p3 * dot(p3, n3) + m4.z * n3;
	vec3 q4 = -6.0 * m3.w * p4 * dot(p4, n4) + m4.w * n4;
	vec3 q = q1 + q2 + q3 + q4;
	
	vec4 t = vec4(dot(p1, n1), dot(p2, n2), dot(p3,n3), dot(p4, n4));
	return 42.0 * vec4(q, dot(m4, t));
}

vec4 fbm(vec3 v, int oct) {
	vec4 sig = vec4(0.0);
	float fac = 0.0;
	float s = 0.5;
	for (int i = 0; i < oct; i++){
		sig += s * (smplx(v) / 2.0 + 0.5);
		fac += s;
		v *= 2.0;
		s /= 2.0;
	}
	
	return sig / fac;
}

void main() {
	vec2 uv = openfl_TextureCoordv.xy;
	vec2 offs = fbm(vec3(uv * u_scale, u_elapsed), 3).xy;
	gl_FragColor = flixel_texture2D(bitmap, uv + (offs - 0.5) * u_intensity / 1e2);
}