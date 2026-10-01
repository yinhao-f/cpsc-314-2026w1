// The value of the "varying" variable is interpolated between values computed in the vertex shader
// The varying variable we passed from the vertex shader is identified by the 'in' classifier
in float intensity;
in vec3 worldPosition;
uniform vec3 orbPosition;
uniform float orbRadius;

void main() {
 	// TODO: Set final rendered colour to intensity (a grey level)
	float distanceToOrb = distance(worldPosition, orbPosition);
	if ((distanceToOrb >= orbRadius) && (distanceToOrb <= orbRadius + 1.0)) {
	    gl_FragColor = vec4(0.0, 1.0, 1.0, 1.0);
	} else {
	    gl_FragColor = vec4(intensity*vec3(1.0,1.0,1.0), 1.0); 
	}
}
