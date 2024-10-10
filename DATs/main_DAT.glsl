// EXECUTING THE ALGORITHM
//-----------------------------------------------------------------------------
// output point color and projected point position
layout (location = 0) out vec4 posOut;
layout (location = 1) out vec4 colorOut;

void main()
{
	// initial texture is a triple cartesian set product L X L X L where L is a set of values in [0, 1) 
	vec3 init = texture(sTD2DInputs[0], vUV.st).xyz;

	// get the 3 angles which comprise the polar coordinates of a point on the surface of a hypertorus from the initial texture sample
	vec3 angles = 2 * PI * init;
	// get the cartesian coordinates of the point in R4
	vec4 r4Pos = get_hyperSphere(angles, 1.0);

	// define the rotation matrix as a composition of rotations about each plane in R4
	mat4 R = rotXY(uThetaXY) * rotXZ(uThetaXZ) * rotXW(uThetaXW) * rotYZ(uThetaYZ) * rotYW(uThetaYW) * rotZW(uThetaZW);
	// perform the transformation on the point in R4
	r4Pos = rotate_r4Pos(r4Pos, R);

	// perform the axial wave function
	r4Pos = wave(r4Pos);

	// perform the radial wave function
	float w1 = radial_wave(r4Pos, vec4(1,0,1,1), 1.0, 0.4, 6.0, 6.0);
	float w2 = radial_wave(r4Pos, vec4(-1,0,1,1), 1.0, 0.4, 6.0, 4.0);
	r4Pos.w += w1 + w2;

	// define the color of the projected point in R3 as a factor of the w-coordinate of the point in R4
	vec4 color = vec4(vec3(r4Pos.w + 0.5), 1.0);

	// perform the R4->R3 projection
	vec3 r3Pos = R4toR3(r4Pos, uVantage);

	// define the outputs
	posOut = TDOutputSwizzle(vec4(r3Pos, 1.0));
	colorOut = TDOutputSwizzle(color);
}