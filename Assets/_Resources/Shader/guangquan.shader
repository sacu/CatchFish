// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.03 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.03;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:False,lprd:False,rprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:2,bsrc:0,bdst:0,culm:0,dpts:2,wrdp:False,dith:2,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:7763,x:32903,y:32641,varname:node_7763,prsc:2|emission-3166-RGB;n:type:ShaderForge.SFN_Tex2d,id:3166,x:32495,y:32733,ptovrint:False,ptlb:node_3166,ptin:_node_3166,varname:node_3166,prsc:2,tex:a303ba84b9fdf514190b0d6d6e3cbbcd,ntxv:0,isnm:False|UVIN-8922-UVOUT;n:type:ShaderForge.SFN_Panner,id:8922,x:32313,y:32733,varname:node_8922,prsc:2,spu:0.1,spv:0.1|DIST-1739-R;n:type:ShaderForge.SFN_Tex2d,id:1739,x:32115,y:32733,ptovrint:False,ptlb:node_1739,ptin:_node_1739,varname:node_1739,prsc:2,tex:9e5ed53780b6cf44f8a5f3e17496d501,ntxv:0,isnm:False|UVIN-5845-UVOUT;n:type:ShaderForge.SFN_Panner,id:5845,x:31937,y:32733,varname:node_5845,prsc:2,spu:0,spv:0.3;proporder:3166-1739;pass:END;sub:END;*/

Shader "Custom/guanghuan" {
    Properties {
        _node_3166 ("node_3166", 2D) = "white" {}
        _node_1739 ("node_1739", 2D) = "white" {}
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        LOD 200
        Pass {
            Name "ForwardBase"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend One One
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma exclude_renderers gles2 xbox360 ps3 flash d3d11_9x 
            #pragma target 2.0
            // Dithering function, to use with scene UVs (screen pixel coords)
            // 3x3 Bayer matrix, based on https://en.wikipedia.org/wiki/Ordered_dithering
            float BinaryDither3x3( float value, float2 sceneUVs ) {
                float3x3 mtx = float3x3(
                    float3( 3,  7,  4 )/10.0,
                    float3( 6,  1,  9 )/10.0,
                    float3( 2,  8,  5 )/10.0
                );
                float2 px = floor(_ScreenParams.xy * sceneUVs);
                int xSmp = fmod(px.x,3);
                int ySmp = fmod(px.y,3);
                float3 xVec = 1-saturate(abs(float3(0,1,2) - xSmp));
                float3 yVec = 1-saturate(abs(float3(0,1,2) - ySmp));
                float3 pxMult = float3( dot(mtx[0],yVec), dot(mtx[1],yVec), dot(mtx[2],yVec) );
                return round(value + dot(pxMult, xVec));
            }
            uniform float4 _TimeEditor;
            uniform sampler2D _node_3166; uniform float4 _node_3166_ST;
            uniform sampler2D _node_1739; uniform float4 _node_1739_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 screenPos : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.screenPos = o.pos;
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                #if UNITY_UV_STARTS_AT_TOP
                    float grabSign = -_ProjectionParams.x;
                #else
                    float grabSign = _ProjectionParams.x;
                #endif
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5;
/////// Vectors:
////// Lighting:
////// Emissive:
                float4 node_3829 = _Time + _TimeEditor;
                float2 node_5845 = (i.uv0+node_3829.g*float2(0,0.3));
                float4 _node_1739_var = tex2D(_node_1739,TRANSFORM_TEX(node_5845, _node_1739));
                float2 node_8922 = (i.uv0+_node_1739_var.r*float2(0.1,0.1));
                float4 _node_3166_var = tex2D(_node_3166,TRANSFORM_TEX(node_8922, _node_3166));
                float3 emissive = _node_3166_var.rgb;
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
