// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.03 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.03;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:False,lprd:False,rprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:1,bsrc:3,bdst:7,culm:0,dpts:2,wrdp:False,dith:2,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:2380,x:32911,y:32310,varname:node_2380,prsc:2|emission-7347-OUT,alpha-8629-A;n:type:ShaderForge.SFN_Tex2d,id:8047,x:31971,y:32366,ptovrint:False,ptlb:mask,ptin:_mask,varname:node_8047,prsc:2,tex:70b6643e947f5ad4aa5f14f2c602d211,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:864,x:32543,y:32321,varname:node_864,prsc:2|A-2099-RGB,B-362-OUT;n:type:ShaderForge.SFN_Tex2d,id:8629,x:32543,y:32499,ptovrint:False,ptlb:node_8629,ptin:_node_8629,varname:node_8629,prsc:2,tex:c4e913f1fa4dc3e4e9aad6f33f6e21d0,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:2099,x:32161,y:32128,ptovrint:False,ptlb:node_2099,ptin:_node_2099,varname:node_2099,prsc:2,tex:dd611bbbb9804f0488e778e27ea3ce73,ntxv:0,isnm:False|UVIN-7811-UVOUT;n:type:ShaderForge.SFN_Panner,id:7811,x:31975,y:32128,varname:node_7811,prsc:2,spu:0.05,spv:-0.05|UVIN-1831-UVOUT,DIST-9558-R;n:type:ShaderForge.SFN_Tex2d,id:9558,x:31771,y:32220,ptovrint:False,ptlb:node_9558,ptin:_node_9558,varname:node_9558,prsc:2,tex:7e4f78751982fbd4db2848b67685b9c9,ntxv:0,isnm:False|UVIN-5627-UVOUT;n:type:ShaderForge.SFN_Panner,id:5627,x:31602,y:32220,varname:node_5627,prsc:2,spu:0,spv:-0.02;n:type:ShaderForge.SFN_Panner,id:1831,x:31771,y:32043,varname:node_1831,prsc:2,spu:0.005,spv:-0.01;n:type:ShaderForge.SFN_Add,id:7347,x:32738,y:32402,varname:node_7347,prsc:2|A-864-OUT,B-8629-RGB;n:type:ShaderForge.SFN_Multiply,id:362,x:32357,y:32415,varname:node_362,prsc:2|A-1486-OUT,B-5903-OUT;n:type:ShaderForge.SFN_Sin,id:7068,x:31797,y:32592,varname:node_7068,prsc:2|IN-1111-OUT;n:type:ShaderForge.SFN_Time,id:2251,x:31421,y:32578,varname:node_2251,prsc:2;n:type:ShaderForge.SFN_Multiply,id:9111,x:31971,y:32592,varname:node_9111,prsc:2|A-7068-OUT,B-5936-OUT;n:type:ShaderForge.SFN_Add,id:5903,x:32170,y:32592,varname:node_5903,prsc:2|A-9111-OUT,B-3764-OUT;n:type:ShaderForge.SFN_Vector1,id:5936,x:31797,y:32742,varname:node_5936,prsc:2,v1:0.3;n:type:ShaderForge.SFN_Vector1,id:3764,x:31971,y:32742,varname:node_3764,prsc:2,v1:0.9;n:type:ShaderForge.SFN_Power,id:1486,x:32170,y:32415,varname:node_1486,prsc:2|VAL-8047-R,EXP-7552-OUT;n:type:ShaderForge.SFN_Vector1,id:7552,x:31971,y:32527,varname:node_7552,prsc:2,v1:0.7;n:type:ShaderForge.SFN_Multiply,id:1111,x:31627,y:32592,varname:node_1111,prsc:2|A-2251-T,B-2890-OUT;n:type:ShaderForge.SFN_Vector1,id:2890,x:31421,y:32706,varname:node_2890,prsc:2,v1:5;proporder:8047-8629-2099-9558;pass:END;sub:END;*/

Shader "Custom/hexin" {
    Properties {
        _mask ("mask", 2D) = "white" {}
        _node_8629 ("node_8629", 2D) = "white" {}
        _node_2099 ("node_2099", 2D) = "white" {}
        _node_9558 ("node_9558", 2D) = "white" {}
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
            uniform sampler2D _node_8629; uniform float4 _node_8629_ST;
            uniform sampler2D _node_2099; uniform float4 _node_2099_ST;
            uniform sampler2D _node_9558; uniform float4 _node_9558_ST;
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
                float4 node_4268 = _Time + _TimeEditor;
                float2 node_5627 = (i.uv0+node_4268.g*float2(0,-0.02));
                float4 _node_9558_var = tex2D(_node_9558,TRANSFORM_TEX(node_5627, _node_9558));
                float2 node_7811 = ((i.uv0+node_4268.g*float2(0.005,-0.01))+_node_9558_var.r*float2(0.05,-0.05));
                float4 _node_2099_var = tex2D(_node_2099,TRANSFORM_TEX(node_7811, _node_2099));
                float4 _mask_var = tex2D(_mask,TRANSFORM_TEX(i.uv0, _mask));
                float4 node_2251 = _Time + _TimeEditor;
                float4 _node_8629_var = tex2D(_node_8629,TRANSFORM_TEX(i.uv0, _node_8629));
                float3 emissive = ((_node_2099_var.rgb*(pow(_mask_var.r,0.7)*((sin((node_2251.g*5.0))*0.3)+0.9)))+_node_8629_var.rgb);
                float3 finalColor = emissive;
                return fixed4(finalColor,_node_8629_var.a);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
