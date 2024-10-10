// HYPERSPHERE DESCRIPTION
//-----------------------------------------------------------------------------
// get the euclidean R4 coordinates of a point on the surface of a hypersphere from the radius and 3 defining angles 
vec4 get_hyperSphere(vec3 angles, float r) {

	float a1 = angles.x;
	float a2 = angles.y;
	float a3 = angles.z;

	vec4 hyperSphere;
	hyperSphere.x = r * cos(a1);
	hyperSphere.y = r * sin(a1) * cos(a2);
	hyperSphere.z = r * sin(a1) * sin(a2) * cos(a3);
	hyperSphere.w = r * sin(a1) * sin(a2) * sin(a3);

	return hyperSphere;
}

// HYPERTORUS DESCRIPTION
//-----------------------------------------------------------------------------
// get the euclidean R4 coordinates of a point on the surface of a hypertorus from the radius and 3 defining angles 
vec4 get_hypertorus(vec3 angles, float r) {

	float a1 = angles.x;
	float a2 = angles.y;
	float a3 = angles.z;

	vec4 hypertorus;
	hypertorus.x = r * ((4 + (2 + cos(a1)) * cos(a2)) * sin(a3));
	hypertorus.y = r * ((2 + cos(a1)) * sin(a2));
	hypertorus.z = r * sin(a1);
	hypertorus.w = r * ((4 + (2 + cos(a1)) * cos(a2)) * cos(a3));

	return hypertorus;
}