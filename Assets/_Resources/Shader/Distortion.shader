// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:3,spmd:1,trmd:0,grmd:0,uamb:False,mssp:True,bkdf:False,hqlp:False,rprd:True,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:0,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:0,x:34392,y:32442,varname:node_0,prsc:2|diff-75-OUT,spec-75-OUT,gloss-75-OUT,alpha-75-OUT,refract-14-OUT;n:type:ShaderForge.SFN_Slider,id:13,x:33580,y:32752,ptovrint:False,ptlb:Distortion Intensity,ptin:_DistortionIntensity,varname:_RefractionIntensity,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5297809,max:1;n:type:ShaderForge.SFN_Multiply,id:14,x:34145,y:32724,varname:node_14,prsc:2|A-6306-OUT,B-13-OUT,C-221-OUT,D-7631-A;n:type:ShaderForge.SFN_TexCoord,id:26,x:32890,y:32080,varname:node_26,prsc:2,uv:0;n:type:ShaderForge.SFN_Vector1,id:75,x:33580,y:32353,varname:node_75,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:221,x:33737,y:32831,varname:node_221,prsc:2,v1:0.2;n:type:ShaderForge.SFN_Tex2d,id:8048,x:33331,y:32271,ptovrint:False,ptlb:Tex,ptin:_Tex,varname:node_8048,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:94a1414d81ebc8e40aa4c628ea02048a,ntxv:0,isnm:False|UVIN-1512-UVOUT;n:type:ShaderForge.SFN_ValueProperty,id:472,x:32717,y:32227,ptovrint:False,ptlb:Tex_Ang,ptin:_Tex_Ang,varname:_Tex_Ang_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Multiply,id:9808,x:32890,y:32227,varname:node_9808,prsc:2|A-472-OUT,B-4412-OUT;n:type:ShaderForge.SFN_Vector1,id:4157,x:32496,y:32565,varname:node_4157,prsc:2,v1:180;n:type:ShaderForge.SFN_Pi,id:4750,x:32529,y:32411,varname:node_4750,prsc:2;n:type:ShaderForge.SFN_Divide,id:4412,x:32693,y:32411,varname:node_4412,prsc:2|A-4750-OUT,B-4157-OUT;n:type:ShaderForge.SFN_Tex2d,id:1250,x:33331,y:32456,ptovrint:False,ptlb:Mask,ptin:_Mask,varname:_Tex_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:bbd9f6f5a17c8c74b891df3bec18f001,ntxv:0,isnm:False|UVIN-943-UVOUT;n:type:ShaderForge.SFN_Multiply,id:5020,x:33580,y:32519,varname:node_5020,prsc:2|A-8048-A,B-1250-A;n:type:ShaderForge.SFN_Rotator,id:1512,x:33175,y:32204,varname:node_1512,prsc:2|UVIN-26-UVOUT,ANG-9808-OUT;n:type:ShaderForge.SFN_Multiply,id:3271,x:32948,y:32430,varname:node_3271,prsc:2|A-4412-OUT,B-569-OUT;n:type:ShaderForge.SFN_ValueProperty,id:569,x:32693,y:32581,ptovrint:False,ptlb:Mask_Ang,ptin:_Mask_Ang,varname:node_569,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Rotator,id:943,x:33141,y:32400,varname:node_943,prsc:2|UVIN-26-UVOUT,ANG-3271-OUT;n:type:ShaderForge.SFN_Append,id:6306,x:33803,y:32468,varname:node_6306,prsc:2|A-75-OUT,B-5020-OUT;n:type:ShaderForge.SFN_VertexColor,id:7631,x:33737,y:32889,varname:node_7631,prsc:2;proporder:8048-472-1250-569-13;pass:END;sub:END;*/

Shader "Fx_Shader/Distortion" {
    Properties {
        _Tex ("Tex", 2D) = "white" {}
        _Tex_Ang ("Tex_Ang", Float ) = 0
        _Mask ("Mask", 2D) = "white" {}
        _Mask_Ang ("Mask_Ang", Float ) = 0
        _DistortionIntensity ("Distortion Intensity", Range(0, 1)) = 0.5297809
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        GrabPass{ }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            Cull Off
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdbase
            #pragma exclude_renderers opengl gles2 d3d11_9x
            #pragma target 2.0
            uniform sampler2D _GrabTexture;
            uniform float _DistortionIntensity;
            uniform sampler2D _Tex; uniform float4 _Tex_ST;
            uniform float _Tex_Ang;
            uniform sampler2D _Mask; uniform float4 _Mask_ST;
            uniform float _Mask_Ang;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float4 screenPos : TEXCOORD3;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos(v.vertex );
                o.screenPos = o.pos;
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                #if UNITY_UV_STARTS_AT_TOP
                    float grabSign = -_ProjectionParams.x;
                #else
                    float grabSign = _ProjectionParams.x;
                #endif
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float node_75 = 0.0;
                float node_4412 = (3.141592654/180.0);
                float node_1512_ang = (_Tex_Ang*node_4412);
                float node_1512_spd = 1.0;
                float node_1512_cos = cos(node_1512_spd*node_1512_ang);
                float node_1512_sin = sin(node_1512_spd*node_1512_ang);
                float2 node_1512_piv = float2(0.5,0.5);
                float2 node_1512 = (mul(i.uv0-node_1512_piv,float2x2( node_1512_cos, -node_1512_sin, node_1512_sin, node_1512_cos))+node_1512_piv);
                float4 _Tex_var = tex2D(_Tex,TRANSFORM_TEX(node_1512, _Tex));
                float node_943_ang = (node_4412*_Mask_Ang);
                float node_943_spd = 1.0;
                float node_943_cos = cos(node_943_spd*node_943_ang);
                float node_943_sin = sin(node_943_spd*node_943_ang);
                float2 node_943_piv = float2(0.5,0.5);
                float2 node_943 = (mul(i.uv0-node_943_piv,float2x2( node_943_cos, -node_943_sin, node_943_sin, node_943_cos))+node_943_piv);
                float4 _Mask_var = tex2D(_Mask,TRANSFORM_TEX(node_943, _Mask));
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5 + (float2(node_75,(_Tex_var.a*_Mask_var.a))*_DistortionIntensity*0.2*i.vertexColor.a);
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = 1;
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
///////// Gloss:
                float gloss = node_75;
                float specPow = exp2( gloss * 10.0+1.0);
/////// GI Data:
                UnityLight light;
                #ifdef LIGHTMAP_OFF
                    light.color = lightColor;
                    light.dir = lightDirection;
                    light.ndotl = LambertTerm (normalDirection, light.dir);
                #else
                    light.color = half3(0.f, 0.f, 0.f);
                    light.ndotl = 0.0f;
                    light.dir = half3(0.f, 0.f, 0.f);
                #endif
                UnityGIInput d;
                d.light = light;
                d.worldPos = i.posWorld.xyz;
                d.worldViewDir = viewDirection;
                d.atten = attenuation;
                d.boxMax[0] = unity_SpecCube0_BoxMax;
                d.boxMin[0] = unity_SpecCube0_BoxMin;
                d.probePosition[0] = unity_SpecCube0_ProbePosition;
                d.probeHDR[0] = unity_SpecCube0_HDR;
                d.boxMax[1] = unity_SpecCube1_BoxMax;
                d.boxMin[1] = unity_SpecCube1_BoxMin;
                d.probePosition[1] = unity_SpecCube1_ProbePosition;
                d.probeHDR[1] = unity_SpecCube1_HDR;
                Unity_GlossyEnvironmentData ugls_en_data;
                ugls_en_data.roughness = 1.0 - gloss;
                ugls_en_data.reflUVW = viewReflectDirection;
                UnityGI gi = UnityGlobalIllumination(d, 1, normalDirection, ugls_en_data );
                lightDirection = gi.light.dir;
                lightColor = gi.light.color;
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float LdotH = max(0.0,dot(lightDirection, halfDirection));
                float3 diffuseColor = float3(node_75,node_75,node_75); // Need this for specular when using metallic
                float specularMonochrome;
                float3 specularColor;
                diffuseColor = DiffuseAndSpecularFromMetallic( diffuseColor, node_75, specularColor, specularMonochrome );
                specularMonochrome = 1-specularMonochrome;
                float NdotV = max(0.0,dot( normalDirection, viewDirection ));
                float NdotH = max(0.0,dot( normalDirection, halfDirection ));
                float VdotH = max(0.0,dot( viewDirection, halfDirection ));
                float visTerm = SmithBeckmannVisibilityTerm( NdotL, NdotV, 1.0-gloss );
                float normTerm = max(0.0, NDFBlinnPhongNormalizedTerm(NdotH, RoughnessToSpecPower(1.0-gloss)));
                float specularPBL = max(0, (NdotL*visTerm*normTerm) * (UNITY_PI / 4) );
                float3 directSpecular = (floor(attenuation) * _LightColor0.xyz) * pow(max(0,dot(halfDirection,normalDirection)),specPow)*specularPBL*lightColor*FresnelTerm(specularColor, LdotH);
                half grazingTerm = saturate( gloss + specularMonochrome );
                float3 indirectSpecular = (gi.indirect.specular);
                indirectSpecular *= FresnelLerp (specularColor, grazingTerm, NdotV);
                float3 specular = (directSpecular + indirectSpecular);
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                half fd90 = 0.5 + 2 * LdotH * LdotH * (1-gloss);
                float3 directDiffuse = ((1 +(fd90 - 1)*pow((1.00001-NdotL), 5)) * (1 + (fd90 - 1)*pow((1.00001-NdotV), 5)) * NdotL) * attenColor;
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse + specular;
                return fixed4(lerp(sceneColor.rgb, finalColor,node_75),1);
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            Cull Off
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdadd
            #pragma exclude_renderers opengl gles2 d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 2.0
            uniform sampler2D _GrabTexture;
            uniform float _DistortionIntensity;
            uniform sampler2D _Tex; uniform float4 _Tex_ST;
            uniform float _Tex_Ang;
            uniform sampler2D _Mask; uniform float4 _Mask_ST;
            uniform float _Mask_Ang;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float4 screenPos : TEXCOORD3;
                float4 vertexColor : COLOR;
                LIGHTING_COORDS(4,5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos(v.vertex );
                o.screenPos = o.pos;
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                #if UNITY_UV_STARTS_AT_TOP
                    float grabSign = -_ProjectionParams.x;
                #else
                    float grabSign = _ProjectionParams.x;
                #endif
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float node_75 = 0.0;
                float node_4412 = (3.141592654/180.0);
                float node_1512_ang = (_Tex_Ang*node_4412);
                float node_1512_spd = 1.0;
                float node_1512_cos = cos(node_1512_spd*node_1512_ang);
                float node_1512_sin = sin(node_1512_spd*node_1512_ang);
                float2 node_1512_piv = float2(0.5,0.5);
                float2 node_1512 = (mul(i.uv0-node_1512_piv,float2x2( node_1512_cos, -node_1512_sin, node_1512_sin, node_1512_cos))+node_1512_piv);
                float4 _Tex_var = tex2D(_Tex,TRANSFORM_TEX(node_1512, _Tex));
                float node_943_ang = (node_4412*_Mask_Ang);
                float node_943_spd = 1.0;
                float node_943_cos = cos(node_943_spd*node_943_ang);
                float node_943_sin = sin(node_943_spd*node_943_ang);
                float2 node_943_piv = float2(0.5,0.5);
                float2 node_943 = (mul(i.uv0-node_943_piv,float2x2( node_943_cos, -node_943_sin, node_943_sin, node_943_cos))+node_943_piv);
                float4 _Mask_var = tex2D(_Mask,TRANSFORM_TEX(node_943, _Mask));
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5 + (float2(node_75,(_Tex_var.a*_Mask_var.a))*_DistortionIntensity*0.2*i.vertexColor.a);
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
///////// Gloss:
                float gloss = node_75;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float LdotH = max(0.0,dot(lightDirection, halfDirection));
                float3 diffuseColor = float3(node_75,node_75,node_75); // Need this for specular when using metallic
                float specularMonochrome;
                float3 specularColor;
                diffuseColor = DiffuseAndSpecularFromMetallic( diffuseColor, node_75, specularColor, specularMonochrome );
                specularMonochrome = 1-specularMonochrome;
                float NdotV = max(0.0,dot( normalDirection, viewDirection ));
                float NdotH = max(0.0,dot( normalDirection, halfDirection ));
                float VdotH = max(0.0,dot( viewDirection, halfDirection ));
                float visTerm = SmithBeckmannVisibilityTerm( NdotL, NdotV, 1.0-gloss );
                float normTerm = max(0.0, NDFBlinnPhongNormalizedTerm(NdotH, RoughnessToSpecPower(1.0-gloss)));
                float specularPBL = max(0, (NdotL*visTerm*normTerm) * (UNITY_PI / 4) );
                float3 directSpecular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow)*specularPBL*lightColor*FresnelTerm(specularColor, LdotH);
                float3 specular = directSpecular;
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                half fd90 = 0.5 + 2 * LdotH * LdotH * (1-gloss);
                float3 directDiffuse = ((1 +(fd90 - 1)*pow((1.00001-NdotL), 5)) * (1 + (fd90 - 1)*pow((1.00001-NdotV), 5)) * NdotL) * attenColor;
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse + specular;
                return fixed4(finalColor * node_75,0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
