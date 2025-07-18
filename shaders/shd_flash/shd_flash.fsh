varying vec2 v_vTexcoord;
varying vec4 v_vColour;
void main()
{
	vec4 tex = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
	gl_FragColor.rgb = vec3(1, 1, 1);
	gl_FragColor.a = tex.a;
}