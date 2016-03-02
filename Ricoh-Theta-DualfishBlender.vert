// Original author: RICOH THETA S DualfishBlender.exe
// Reverse engineered by mbirth: https://developers.theta360.com/en/forums/viewtopic.php?f=4&t=36


varying vec2 v_texcoord;
varying float v_pos_y;
uniform sampler2D texture;
uniform mat3 tilt;

const float M_PI = 3.14159265358979;
const float M_PI2 = M_PI / 2.0;
const float M_2PI = M_PI*2.0;
void main() {
    float theta0 = M_PI2 - M_PI * v_texcoord.y;
    float phi0 = M_2PI * v_texcoord.x;
    float cosTheta = cos(theta0);
    vec3 p = tilt * vec3(cosTheta * cos(phi0), sin(theta0), cosTheta * sin(phi0));
    if (p.y > 1.0) p.y = 1.0;
    if (p.y < -1.0) p.y = -1.0;
    float theta = asin(p.y);
    float phi = atan(p.z, p.x);
    vec2 q = vec2(mod(phi / M_2PI, 1.0), 0.5 - theta / M_PI);
    gl_FragColor = texture2D(texture, q);
}

varying vec2 v_texcoord;
varying float v_pos_y;
uniform sampler2D texture;
void main() {
    vec4 src = texture2D(texture, v_texcoord) - vec4(0.0625, 0.5, 0.5, 0.0);
    vec4 rgb;
    rgb.b = 1.164383*src.r + 1.596027*src.b;
    rgb.g = 1.164383*src.r - 0.391762*src.g - 0.812968*src.b;
    rgb.r = 1.164383*src.r + 2.017232*src.g;
    rgb.a = 1.0;
    gl_FragColor = rgb;
}

varying vec2 v_texcoord;
varying float v_pos_y;
uniform sampler2D texture;

void main() {
    gl_FragColor = texture2D(texture, v_texcoord);
}

varying vec2 v_texcoord;
varying float v_pos_y;
uniform sampler2D textureA;
uniform sampler2D textureB;
uniform sampler2D stitchTable;

void main() {
    vec2 offset = (texture2D(stitchTable, v_texcoord).rg - vec2(0.5, 0.5))/24.0;
    vec4 colA = texture2D(textureA, v_texcoord);
    vec4 colB = texture2D(textureB, v_texcoord + offset);
    colA.a = 1.0;
    colB.a = 1.0;
    float alpha = 0.5-(v_pos_y/0.02);
    if (alpha<=0.0) { alpha=0.0; } else if (alpha>=1.0) { alpha=1.0; }
    alpha = 1.0 - alpha;
    gl_FragColor = colA*(1.0-alpha) + colB*alpha;
}

attribute vec4 position;
attribute vec2 texcoord;
varying vec2 v_texcoord;
varying float v_pos_y;

void main() {
    gl_Position = position;
    v_texcoord = texcoord;
    v_pos_y = position.y;
}