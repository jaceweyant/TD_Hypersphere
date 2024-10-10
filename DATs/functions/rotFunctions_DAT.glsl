// R4 ROTATION TRANSFORMS
//-----------------------------------------------------------------------------
// rotate about the zw-plane
mat4 rotXY(float theta) {
	mat4 rot = mat4(cos(theta), -1*sin(theta), 0, 0,
					sin(theta),    cos(theta), 0, 0,
						0,             0,      1, 0,
						0,             0,      0, 1);
	return rot;
} 

// rotate about the yw-plane
mat4 rotXZ(float theta) {
	mat4 rot = mat4(cos(theta), 0, -1*sin(theta), 0,
					    0,      1,       0,       0,
					sin(theta), 0,    cos(theta), 0,
						0,      0,        0,      1);
	return rot;
}

// rotate about the yz-plane
mat4 rotXW(float theta) {
	mat4 rot = mat4(cos(theta), 0, 0, -1*sin(theta),
					         0, 1, 0,             0,
					         0, 0, 1,             0,
					sin(theta), 0, 0,    cos(theta));
	return rot;
}

// rotate about the xw-plane
mat4 rotYZ(float theta) {
	mat4 rot = mat4(1,     0,            0,       0,
					0, cos(theta), -1*sin(theta), 0,
					0, sin(theta),    cos(theta), 0,
					0,      0,            0,      1);
	return rot;
}

// rotate about the xz-plane
mat4 rotYW(float theta) {
	mat4 rot = mat4(1,          0, 0,             0,
					0, cos(theta), 0, -1*sin(theta),
					0,          0, 1,             0,
					0, sin(theta), 0,    cos(theta));
	return rot;
}

// rotate about the xy-plane
mat4 rotZW(float theta) {
	mat4 rot = mat4(1, 0,          0,             0,
					0, 1,          0,             0,
					0, 0, cos(theta), -1*sin(theta),
					0, 0, sin(theta),    cos(theta));
	return rot;
}

// APPLICATION OF AN R4 TRANSFORMATION
//-----------------------------------------------------------------------------
// a point on the surface of the hypertorus is rotated a certain angle about a certain plane in R4
vec4 rotate_r4Pos(vec4 p, mat4 R) {
	vec4 newP = R * p;
	return newP;
}