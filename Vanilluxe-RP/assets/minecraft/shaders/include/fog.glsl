#version 150

vec4 linear_fog(vec4 inColor, float vertexDistance, float fogStart, float fogEnd, vec4 fogColor) {
    //Custom
    float fogRColor = ceil(fogColor.r * 255);
    float fogGColor = ceil(fogColor.g * 255);
    float fogBColor = ceil(fogColor.b * 255);
    bool fogLava = fogRColor == 153 && fogGColor == 26 && fogBColor == 0;
    bool fogPowderedSnow = fogRColor == 159 && fogGColor == 188 && fogBColor == 201;
    bool fogBlindness = fogRColor == 0 && fogGColor == 0 && fogBColor == 0;
    if (fogLava) {
        fogEnd += 5.0;
    }
    if (fogPowderedSnow) {
        fogEnd += 2.0;
    }
    if (fogBlindness) {
        fogEnd += 3.0;
    }
    if (!fogLava && !fogPowderedSnow && !fogBlindness) {
        fogEnd += 64.0;
    }
    //////// Custom End
    if (vertexDistance <= fogStart) {
        return inColor;
    }

    float fogValue = vertexDistance < fogEnd ? smoothstep(fogStart, fogEnd, vertexDistance) : 1.0;
    return vec4(mix(inColor.rgb, fogColor.rgb, fogValue * fogColor.a), inColor.a);
}

float linear_fog_fade(float vertexDistance, float fogStart, float fogEnd) {
    if (vertexDistance <= fogStart) {
        return 1.0;
    } else if (vertexDistance >= fogEnd) {
        return 0.0;
    }

    return smoothstep(fogEnd, fogStart, vertexDistance);
}

float fog_distance(vec3 pos, int shape) {
    if (shape == 0) {
        return length(pos);
    } else {
        float distXZ = length(pos.xz);
        float distY = abs(pos.y);
        return max(distXZ, distY);
    }
}