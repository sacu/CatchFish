// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:32101,y:33784,varname:node_3138,prsc:2|emission-5050-OUT;n:type:ShaderForge.SFN_Tex2d,id:4228,x:31319,y:34528,ptovrint:False,ptlb:liuguang_caizhi,ptin:_liuguang_caizhi,varname:node_4228,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:474bbb53c85dc7e48ae334433d270a64,ntxv:0,isnm:False|UVIN-8038-UVOUT;n:type:ShaderForge.SFN_Panner,id:8038,x:31158,y:34528,varname:node_8038,prsc:2,spu:0,spv:-0.3|UVIN-2253-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:2253,x:31158,y:34385,varname:node_2253,prsc:2,uv:0;n:type:ShaderForge.SFN_Multiply,id:6268,x:31493,y:34424,varname:node_6268,prsc:2|A-2505-OUT,B-9914-RGB,C-4228-RGB;n:type:ShaderForge.SFN_Tex2d,id:9914,x:31319,y:34356,ptovrint:False,ptlb:liuguang_mask,ptin:_liuguang_mask,varname:node_9914,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Slider,id:2505,x:31240,y:34267,ptovrint:False,ptlb:liuguang_power,ptin:_liuguang_power,varname:node_2505,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.600106,max:4;n:type:ShaderForge.SFN_Add,id:5050,x:31773,y:33880,varname:node_5050,prsc:2|A-5841-OUT,B-4753-OUT,C-6268-OUT,D-9500-OUT;n:type:ShaderForge.SFN_Tex2d,id:5398,x:30259,y:32953,ptovrint:False,ptlb:node_5398,ptin:_node_5398,varname:node_5398,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:1289a8d510dd0894fa8c3e30833a945f,ntxv:0,isnm:False|UVIN-2930-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:2930,x:29391,y:33990,varname:node_2930,prsc:2,uv:0;n:type:ShaderForge.SFN_Add,id:4753,x:30755,y:33149,varname:node_4753,prsc:2|A-2779-OUT,B-3802-OUT,C-4097-OUT;n:type:ShaderForge.SFN_Multiply,id:2779,x:30465,y:33026,varname:node_2779,prsc:2|A-5398-RGB,B-2636-RGB,C-2636-A;n:type:ShaderForge.SFN_Color,id:2636,x:30098,y:33031,ptovrint:False,ptlb:xingxing,ptin:_xingxing,varname:node_2636,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Lerp,id:8645,x:30425,y:33172,varname:node_8645,prsc:2|A-1324-RGB,B-4161-RGB,T-6106-OUT;n:type:ShaderForge.SFN_Tex2d,id:1324,x:30253,y:33172,ptovrint:False,ptlb:1,ptin:_1,varname:node_1324,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-6299-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:4161,x:30253,y:33343,ptovrint:False,ptlb:2,ptin:_2,varname:node_4161,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-6299-UVOUT;n:type:ShaderForge.SFN_Slider,id:6106,x:29941,y:33216,ptovrint:False,ptlb:1.1,ptin:_11,varname:node_6106,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Color,id:9645,x:30425,y:33324,ptovrint:False,ptlb:lei,ptin:_lei,varname:node_9645,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:3802,x:30601,y:33172,varname:node_3802,prsc:2|A-8645-OUT,B-9645-RGB;n:type:ShaderForge.SFN_Rotator,id:6299,x:30098,y:33296,varname:node_6299,prsc:2|UVIN-2930-UVOUT,ANG-2330-OUT;n:type:ShaderForge.SFN_Slider,id:2330,x:29772,y:33339,ptovrint:False,ptlb:Ang_2,ptin:_Ang_2,varname:node_2330,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Lerp,id:4575,x:30681,y:33795,varname:node_4575,prsc:2|A-614-RGB,B-2856-RGB,T-1843-OUT;n:type:ShaderForge.SFN_Tex2d,id:2856,x:30504,y:33936,ptovrint:False,ptlb:2.1,ptin:_21,varname:_3,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-8415-UVOUT;n:type:ShaderForge.SFN_Slider,id:1843,x:30198,y:33784,ptovrint:False,ptlb:2.2,ptin:_22,varname:_12,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Color,id:7571,x:30681,y:33952,ptovrint:False,ptlb:lei_copy,ptin:_lei_copy,varname:_lei_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:4097,x:30853,y:33795,varname:node_4097,prsc:2|A-4575-OUT,B-7571-RGB;n:type:ShaderForge.SFN_Rotator,id:8415,x:30243,y:33861,varname:node_8415,prsc:2|UVIN-2930-UVOUT,ANG-1237-OUT;n:type:ShaderForge.SFN_Slider,id:1237,x:29928,y:33900,ptovrint:False,ptlb:Ang_3,ptin:_Ang_3,varname:_Ang_3,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-2,cur:-0.5089925,max:1;n:type:ShaderForge.SFN_Tex2d,id:614,x:30504,y:33753,ptovrint:False,ptlb:1.01,ptin:_101,varname:node_614,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-8415-UVOUT;n:type:ShaderForge.SFN_Panner,id:5261,x:29941,y:34518,varname:node_5261,prsc:2,spu:0.02,spv:0.1|UVIN-2930-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:3171,x:30446,y:34383,ptovrint:False,ptlb:node_3171,ptin:_node_3171,varname:node_3171,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False|UVIN-1980-UVOUT;n:type:ShaderForge.SFN_Multiply,id:9500,x:30644,y:34454,varname:node_9500,prsc:2|A-3171-RGB,B-1341-RGB,C-7754-RGB;n:type:ShaderForge.SFN_Tex2d,id:1211,x:30116,y:34518,ptovrint:False,ptlb:node_1211,ptin:_node_1211,varname:node_1211,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-5261-UVOUT;n:type:ShaderForge.SFN_Add,id:780,x:30448,y:34700,varname:node_780,prsc:2|A-3436-OUT,B-2930-UVOUT;n:type:ShaderForge.SFN_Slider,id:8730,x:29970,y:34730,ptovrint:False,ptlb:node_8730,ptin:_node_8730,varname:node_8730,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.3196581,max:1;n:type:ShaderForge.SFN_Tex2d,id:1341,x:30644,y:34592,ptovrint:False,ptlb:node_1341,ptin:_node_1341,varname:node_1341,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-780-OUT;n:type:ShaderForge.SFN_Multiply,id:3436,x:30284,y:34632,varname:node_3436,prsc:2|A-1211-R,B-8730-OUT;n:type:ShaderForge.SFN_Panner,id:1980,x:30268,y:34383,varname:node_1980,prsc:2,spu:-0.2,spv:0.1|UVIN-2930-UVOUT;n:type:ShaderForge.SFN_Color,id:7754,x:30446,y:34560,ptovrint:False,ptlb:node_7754,ptin:_node_7754,varname:node_7754,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:2,c2:2,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2d,id:7107,x:31319,y:34708,ptovrint:False,ptlb:node_7107,ptin:_node_7107,varname:node_7107,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:3a5a96df060a5cf4a9cc0c59e13486b7,ntxv:0,isnm:False|UVIN-4856-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:4856,x:31165,y:34708,varname:node_4856,prsc:2,uv:0;n:type:ShaderForge.SFN_Color,id:8949,x:31287,y:34864,ptovrint:False,ptlb:node_8949,ptin:_node_8949,varname:node_8949,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:5841,x:31486,y:34782,varname:node_5841,prsc:2|A-7107-RGB,B-8949-RGB;proporder:4228-9914-2505-5398-2636-1324-4161-6106-9645-2330-2856-1843-7571-1237-614-3171-1211-8730-1341-7754-7107-8949;pass:END;sub:END;*/

Shader "Shader Forge/OdinShader" {
    Properties {
        _liuguang_caizhi ("liuguang_caizhi", 2D) = "white" {}
        _liuguang_mask ("liuguang_mask", 2D) = "white" {}
        _liuguang_power ("liuguang_power", Range(0, 4)) = 0.600106
        _node_5398 ("node_5398", 2D) = "white" {}
        _xingxing ("xingxing", Color) = (0.5,0.5,0.5,1)
        _1 ("1", 2D) = "white" {}
        _2 ("2", 2D) = "white" {}
        _11 ("1.1", Range(0, 1)) = 1
        _lei ("lei", Color) = (0.5,0.5,0.5,1)
        _Ang_2 ("Ang_2", Range(0, 1)) = 0
        _21 ("2.1", 2D) = "white" {}
        _22 ("2.2", Range(0, 1)) = 1
        _lei_copy ("lei_copy", Color) = (0.5,0.5,0.5,1)
        _Ang_3 ("Ang_3", Range(-2, 1)) = -0.5089925
        _101 ("1.01", 2D) = "white" {}
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
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
			//ะกรื gles2
            #pragma exclude_renderers gles2 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 2.0
            uniform float4 _TimeEditor;
            uniform sampler2D _liuguang_caizhi; uniform float4 _liuguang_caizhi_ST;
            uniform sampler2D _liuguang_mask; uniform float4 _liuguang_mask_ST;
            uniform float _liuguang_power;
            uniform sampler2D _node_5398; uniform float4 _node_5398_ST;
            uniform float4 _xingxing;
            uniform sampler2D _1; uniform float4 _1_ST;
            uniform sampler2D _2; uniform float4 _2_ST;
            uniform float _11;
            uniform float4 _lei;
            uniform float _Ang_2;
            uniform sampler2D _21; uniform float4 _21_ST;
            uniform float _22;
            uniform float4 _lei_copy;
            uniform float _Ang_3;
            uniform sampler2D _101; uniform float4 _101_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos(v.vertex );
                return o;
            }
			float4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float node_6299_ang = _Ang_2;
                float node_6299_spd = 1.0;
                float node_6299_cos = cos(node_6299_spd*node_6299_ang);
                float node_6299_sin = sin(node_6299_spd*node_6299_ang);
                float2 node_6299_piv = float2(0.5,0.5);
                float2 node_6299 = (mul(i.uv0-node_6299_piv,float2x2( node_6299_cos, -node_6299_sin, node_6299_sin, node_6299_cos))+node_6299_piv);
                float4 _1_var = tex2D(_1,TRANSFORM_TEX(node_6299, _1));
                float4 _2_var = tex2D(_2,TRANSFORM_TEX(node_6299, _2));
                float node_8415_ang = _Ang_3;
                float node_8415_spd = 1.0;
                float node_8415_cos = cos(node_8415_spd*node_8415_ang);
                float node_8415_sin = sin(node_8415_spd*node_8415_ang);
                float2 node_8415_piv = float2(0.5,0.5);
                float2 node_8415 = (mul(i.uv0-node_8415_piv,float2x2( node_8415_cos, -node_8415_sin, node_8415_sin, node_8415_cos))+node_8415_piv);
                float4 _101_var = tex2D(_101,TRANSFORM_TEX(node_8415, _101));
				float4 _21_var = tex2D(_21,TRANSFORM_TEX(node_8415, _21));
                float3 thunder = (_1_var.rgb * (1 - _11) + _2_var.rgb * _11) * _lei.rgb + (_101_var.rgb * (1 - _22) + _21_var.rgb * _11) * _lei_copy.rgb;
				return float4(thunder, 1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
