// R4->R3 PERSPECTIVE PROJECTION
//-----------------------------------------------------------------------------
// performs a perspective projection of the hypertorus from R4 to R3 defined such that
//    the center of projection is on the w-axis at distance, v from the origin and such that
//    the projection hyperplane is w=0
vec3 R4toR3(vec4 p, float v) {
	float x = p.x;
	float y = p.y;
	float z = p.z;
	float w = p.w;

	vec3 p_proj = vec3((x*v)/(v-w), (y*v)/(v-w), (z*v)/(v-w));

	return p_proj;
}