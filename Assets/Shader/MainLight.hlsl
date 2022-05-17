void MainLight_half(float3 WorldPos, out half3 Direction, out half3 Color, out half DistanceAtten, out half ShadowAtten)
{
    Direction = half3(0.5, 0.5, 0);
    Color = 1;
    DistanceAtten = 1;
    ShadowAtten = 1;

    #ifdef UNIVERSAL_LIGHTING_INCLUDED
    half4 shadowCoord = TransformWorldToShadowCoord(WorldPos);
    Light mainLight = GetMainLight(shadowCoord);
    Direction = mainLight.direction;
    Color = mainLight.color;
    DistanceAtten = mainLight.distanceAttenuation;
    ShadowAtten = SampleScreenSpaceShadowmap(shadowCoord);
    #endif
}