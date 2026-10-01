uniform vec3 orbPosition;
uniform float orbRadius;

out float intensity;
out vec3 worldPosition;

void main() {

    vec3 deformedPosition = (modelMatrix * vec4(position, 1.0)).xyz;

    float distanceToOrb = distance(deformedPosition, orbPosition);

    if (distanceToOrb < orbRadius + 1.0) {
        deformedPosition = orbPosition + normalize(deformedPosition - orbPosition) * orbRadius;
    }

    worldPosition = deformedPosition;

    // Lighting
    vec3 lightDirection = normalize(orbPosition - worldPosition);
    vec3 worldNormal = normalize(normalMatrix * normal);
    intensity = dot(worldNormal, lightDirection);

    gl_Position = projectionMatrix * viewMatrix * vec4(deformedPosition, 1.0);
}

