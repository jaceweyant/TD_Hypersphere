// Spherical Wave 
// --------------------------------------------------------------

// projects the point orthogonally to a defined axis
vec4 ptProj(vec4 pt, vec4 axis) {
	vec4 proj = (dot(pt, axis) / dot(axis, axis)) * axis;
	return proj;
}

// performs a kind of wave through 4-space propogating outward with respect to the defined axis
vec4 wave(vec4 posTex) {
	float waveFreq = 1 / uWavePeriod;

	float distAlongAxis = length(ptProj(posTex, uWaveAxis));

	vec4 velDir = normalize(posTex);
	float velMag = uWaveIntensity * cos((uWaveSpeed * uTime) + (waveFreq * distAlongAxis));

	vec4 pos = posTex + (velMag * velDir);

	return pos;
}

float radial_wave(vec4 p, vec4 s, float a, float d, float k, float w) {
    float r = length(s - p);
    w = a * pow(E, -1*d*r) * sin(k*r - w*uTime);
    return w;
}