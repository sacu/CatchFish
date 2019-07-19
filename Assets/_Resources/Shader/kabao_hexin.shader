// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.03 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.03;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:False,lprd:False,rprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:1,bsrc:3,bdst:7,culm:0,dpts:2,wrdp:False,dith:2,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:9764,x:33171,y:32814,varname:node_9764,prsc:2|emission-2496-OUT,alpha-2260-OUT;n:type:ShaderForge.SFN_Tex2d,id:785,x:31884,y:32535,ptovrint:False,ptlb:mask,ptin:_mask,varname:node_785,prsc:2,tex:c94dcad2672d93e4b9e46cb0c7635ff9,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:4602,x:31884,y:32727,ptovrint:False,ptlb:wenli,ptin:_wenli,varname:node_4602,prsc:2,tex:4f79e5df81976fa4eb81694a85293d25,ntxv:0,isnm:False|UVIN-5214-UVOUT;n:type:ShaderForge.SFN_Panner,id:5214,x:31727,y:32727,varname:node_5214,prsc:2,spu:0,spv:0.06;n:type:ShaderForge.SFN_Tex2d,id:7013,x:32101,y:33103,ptovrint:False,ptlb:hexin1,ptin:_hexin1,varname:node_7013,prsc:2,tex:eab4c1e895e20e2458be3787503aa522,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:9615,x:31884,y:32917,ptovrint:False,ptlb:hexin2,ptin:_hexin2,varname:node_9615,prsc:2,tex:ee3ea3a2baec34345a88ecc58aa641ff,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Add,id:1096,x:32556,y:33104,varname:node_1096,prsc:2|A-9615-A,B-7013-A;n:type:ShaderForge.SFN_Add,id:2496,x:32718,y:32820,varname:node_2496,prsc:2|A-607-OUT,B-997-OUT,C-578-OUT;n:type:ShaderForge.SFN_Multiply,id:3654,x:32101,y:32917,varname:node_3654,prsc:2|A-9615-RGB,B-9615-A;n:type:ShaderForge.SFN_Multiply,id:997,x:32300,y:33120,varname:node_997,prsc:2|A-7013-RGB,B-7013-A;n:type:ShaderForge.SFN_Multiply,id:578,x:32106,y:32637,varname:node_578,prsc:2|A-785-R,B-4602-RGB,C-9294-OUT;n:type:ShaderForge.SFN_Add,id:607,x:32321,y:32781,varname:node_607,prsc:2|A-578-OUT,B-3654-OUT;n:type:ShaderForge.SFN_Sin,id:3179,x:31364,y:32585,varname:node_3179,prsc:2|IN-8683-TTR;n:type:ShaderForge.SFN_Time,id:8683,x:31184,y:32585,varname:node_8683,prsc:2;n:type:ShaderForge.SFN_Multiply,id:9323,x:31548,y:32585,varname:node_9323,prsc:2|A-3179-OUT,B-965-OUT;n:type:ShaderForge.SFN_Add,id:9294,x:31727,y:32585,varname:node_9294,prsc:2|A-9323-OUT,B-5435-OUT;n:type:ShaderForge.SFN_Vector1,id:965,x:31364,y:32739,varname:node_965,prsc:2,v1:0.3;n:type:ShaderForge.SFN_Vector1,id:5435,x:31548,y:32739,varname:node_5435,prsc:2,v1:0.3;n:type:ShaderForge.SFN_Multiply,id:2260,x:32855,y:33107,varname:node_2260,prsc:2|A-1096-OUT,B-6937-OUT;n:type:ShaderForge.SFN_Slider,id:6937,x:32477,y:33254,ptovrint:False,ptlb:Alpha,ptin:_Alpha,varname:node_6937,prsc:2,min:0,cur:1,max:1;proporder:6937-785-4602-7013-9615;pass:END;sub:END;*/

Shader "Custom/kabao_hexin" {
    Properties {
        _Alpha ("Alpha", Range(0, 1)) = 1
        _mask ("mask", 2D) = "white" {}
        _wenli ("wenli", 2D) = "white" {}
        _hexin1 ("hexin1", 2D) = "white" {}
        _hexin2 ("hexin2", 2D) = "white" {}
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
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
            Blend SrcAlpha OneMinusSrcAlpha
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
            uniform sampler2D _mask; uniform float4 _mask_ST;
            uniform sampler2D _wenli; uniform float4 _wenli_ST;
            uniform sampler2D _hexin1; uniform float4 _hexin1_ST;
            uniform sampler2D _hexin2; uniform float4 _hexin2_ST;
            uniform float _Alpha;
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
                float4 _mask_var = tex2D(_mask,TRANSFORM_TEX(i.uv0, _mask));
                float4 node_1271 = _Time + _TimeEditor;
                float2 node_5214 = (i.uv0+node_1271.g*float2(0,0.06));
                float4 _wenli_var = tex2D(_wenli,TRANSFORM_TEX(node_5214, _wenli));
                float4 node_8683 = _Time + _TimeEditor;
                float3 node_578 = (_mask_var.r*_wenli_var.rgb*((sin(node_8683.a)*0.3)+0.3));
                float4 _hexin2_var = tex2D(_hexin2,TRANSFORM_TEX(i.uv0, _hexin2));
                float4 _hexin1_var = tex2D(_hexin1,TRANSFORM_TEX(i.uv0, _hexin1));
                float3 emissive = ((node_578+(_hexin2_var.rgb*_hexin2_var.a))+(_hexin1_var.rgb*_hexin1_var.a)+node_578);
                float3 finalColor = emissive;
                return fixed4(finalColor,((_hexin2_var.a+_hexin1_var.a)*_Alpha));
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
