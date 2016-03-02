// Original author: Paul Bourke http://paulbourke.net/dome/fish2/
// Fisheye to spherical conversion for Quartz Core Image Filter
// Assumes the fisheye image is square, centered, and the circle fills the image.
// Output (spherical) image should have 2:1 aspect.
// Strange (but helpful) that atan() == atan2(), normally they are different.

kernel vec4 fish2sphere(sampler src)
{
	vec2 pfish;
	float theta,phi,r;
	vec3 psph;
	
	float FOV = 3.141592654; // FOV of the fisheye, eg: 180 degrees
	float width = samplerSize(src).x;
	float height = samplerSize(src).y;

	// Polar angles
	theta = 2.0 * 3.14159265 * (destCoord().x / width - 0.5); // -pi to pi
	phi = 3.14159265 * (destCoord().y / height - 0.5);	// -pi/2 to pi/2

	// Vector in 3D space
	psph.x = cos(phi) * sin(theta);
	psph.y = cos(phi) * cos(theta);
	psph.z = sin(phi);
	
	// Calculate fisheye angle and radius
	theta = atan(psph.z,psph.x);
	phi = atan(sqrt(psph.x*psph.x+psph.z*psph.z),psph.y);
	r = width * phi / FOV; 

	// Pixel in fisheye space
	pfish.x = 0.5 * width + r * cos(theta);
	pfish.y = 0.5 * width + r * sin(theta);
	
	return sample(src, pfish);
}