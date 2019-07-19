// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.03 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.03;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:False,lprd:False,rprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:5,bsrc:3,bdst:0,culm:0,dpts:2,wrdp:False,dith:2,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:2746,x:33576,y:32810,varname:node_2746,prsc:2|emission-8970-OUT,alpha-3958-A;n:type:ShaderForge.SFN_Tex2d,id:2940,x:31964,y:32129,ptovrint:False,ptlb:mask_bian,ptin:_mask_bian,varname:node_2940,prsc:2,tex:18f150f626bd812458e3c344076da52b,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:1377,x:31964,y:32335,ptovrint:False,ptlb:guangtiao,ptin:_guangtiao,varname:node_1377,prsc:2,tex:2b2d7e2f7956a7446a026eafc9669873,ntxv:0,isnm:False|UVIN-2334-UVOUT;n:type:ShaderForge.SFN_Multiply,id:1745,x:32430,y:32405,varname:node_1745,prsc:2|A-3385-OUT,B-9390-OUT;n:type:ShaderForge.SFN_Panner,id:2334,x:31802,y:32335,varname:node_2334,prsc:2,spu:0.3,spv:0|DIST-1566-OUT;n:type:ShaderForge.SFN_Slider,id:1566,x:31468,y:32372,ptovrint:False,ptlb:sao_zuoshang,ptin:_sao_zuoshang,varname:node_1566,prsc:2,min:0,cur:3,max:3;n:type:ShaderForge.SFN_Power,id:9390,x:32197,y:32442,varname:node_9390,prsc:2|VAL-1377-R,EXP-9429-OUT;n:type:ShaderForge.SFN_Vector1,id:9429,x:32197,y:32386,varname:node_9429,prsc:2,v1:1.3;n:type:ShaderForge.SFN_Tex2d,id:3958,x:31964,y:32554,ptovrint:False,ptlb:mask,ptin:_mask,varname:node_3958,prsc:2,tex:ec1426216c3e63048a65f20fab364322,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:9277,x:32197,y:32903,varname:node_9277,prsc:2|A-3958-A,B-775-OUT;n:type:ShaderForge.SFN_Multiply,id:3191,x:32429,y:32827,varname:node_3191,prsc:2|A-9532-OUT,B-9277-OUT,C-5128-OUT;n:type:ShaderForge.SFN_Add,id:7883,x:32632,y:32534,varname:node_7883,prsc:2|A-1745-OUT,B-3191-OUT;n:type:ShaderForge.SFN_Power,id:9532,x:32197,y:32740,varname:node_9532,prsc:2|VAL-1377-R,EXP-9445-OUT;n:type:ShaderForge.SFN_Vector1,id:9445,x:32197,y:32687,varname:node_9445,prsc:2,v1:2;n:type:ShaderForge.SFN_Tex2d,id:272,x:31757,y:33004,ptovrint:False,ptlb:wenli,ptin:_wenli,varname:node_272,prsc:2,tex:bc89dc67c2ea8934d91c27fb62d8c725,ntxv:0,isnm:False|UVIN-3798-UVOUT;n:type:ShaderForge.SFN_Panner,id:3798,x:31576,y:33004,varname:node_3798,prsc:2,spu:0.03,spv:0.03;n:type:ShaderForge.SFN_Add,id:775,x:31988,y:32931,varname:node_775,prsc:2|A-8500-R,B-272-R;n:type:ShaderForge.SFN_Tex2d,id:8500,x:31757,y:32814,ptovrint:False,ptlb:node_8500,ptin:_node_8500,varname:node_8500,prsc:2,tex:bc89dc67c2ea8934d91c27fb62d8c725,ntxv:0,isnm:False|UVIN-9352-UVOUT;n:type:ShaderForge.SFN_Panner,id:9352,x:31576,y:32814,varname:node_9352,prsc:2,spu:0.01,spv:0.01;n:type:ShaderForge.SFN_Multiply,id:3385,x:32197,y:32185,varname:node_3385,prsc:2|A-9996-OUT,B-2940-A;n:type:ShaderForge.SFN_Vector1,id:9996,x:32197,y:32129,varname:node_9996,prsc:2,v1:1.5;n:type:ShaderForge.SFN_Vector1,id:5128,x:32197,y:33035,varname:node_5128,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Multiply,id:8970,x:32865,y:32596,varname:node_8970,prsc:2|A-7883-OUT,B-1585-OUT;n:type:ShaderForge.SFN_Vector3,id:1585,x:32632,y:32690,varname:node_1585,prsc:2,v1:1,v2:1.5,v3:2.3;proporder:1566-2940-1377-3958-272-8500;pass:END;sub:END;*/

Shader "Custom/zjm" {
    Properties {
        _sao_zuoshang ("sao_zuoshang", Range(0, 3)) = 3
        _mask_bian ("mask_bian", 2D) = "white" {}
        _guangtiao ("guangtiao", 2D) = "white" {}
        _mask ("mask", 2D) = "white" {}
        _wenli ("wenli", 2D) = "white" {}
        _node_8500 ("node_8500", 2D) = "white" {}
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
            Blend SrcAlpha One
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
            uniform sampler2D _mask_bian; uniform float4 _mask_bian_ST;
            uniform sampler2D _guangtiao; uniform float4 _guangtiao_ST;
            uniform float _sao_zuoshang;
            uniform sampler2D _mask; uniform float4 _mask_ST;
            uniform sampler2D _wenli; uniform float4 _wenli_ST;
            uniform sampler2D _node_8500; uniform float4 _node_8500_ST;
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
                float4 _mask_bian_var = tex2D(_mask_bian,TRANSFORM_TEX(i.uv0, _mask_bian));
                float2 node_2334 = (i.uv0+_sao_zuoshang*float2(0.3,0));
                float4 _guangtiao_var = tex2D(_guangtiao,TRANSFORM_TEX(node_2334, _guangtiao));
                float4 _mask_var = tex2D(_mask,TRANSFORM_TEX(i.uv0, _mask));
                float4 node_7222 = _Time + _TimeEditor;
                float2 node_9352 = (i.uv0+node_7222.g*float2(0.01,0.01));
                float4 _node_8500_var = tex2D(_node_8500,TRANSFORM_TEX(node_9352, _node_8500));
                float2 node_3798 = (i.uv0+node_7222.g*float2(0.03,0.03));
                float4 _wenli_var = tex2D(_wenli,TRANSFORM_TEX(node_3798, _wenli));
                float3 emissive = ((((1.5*_mask_bian_var.a)*pow(_guangtiao_var.r,1.3))+(pow(_guangtiao_var.r,2.0)*(_mask_var.a*(_node_8500_var.r+_wenli_var.r))*0.5))*float3(1,1.5,2.3));
                float3 finalColor = emissive;
                return fixed4(finalColor,_mask_var.a);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
