// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:2,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,rfrpo:False,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:33146,y:32914,varname:node_3138,prsc:2|emission-2410-OUT;n:type:ShaderForge.SFN_Tex2d,id:6729,x:32473,y:33096,ptovrint:False,ptlb:node_6729,ptin:_node_6729,varname:node_6729,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:a25aa049beaa6d8419f3a0e555d8e0bf,ntxv:0,isnm:False|UVIN-8319-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:9043,x:32010,y:33051,varname:node_9043,prsc:2,uv:0;n:type:ShaderForge.SFN_Slider,id:6853,x:31900,y:33347,ptovrint:False,ptlb:node_6853,ptin:_node_6853,varname:node_6853,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5299146,max:1;n:type:ShaderForge.SFN_Rotator,id:8319,x:32297,y:33096,varname:node_8319,prsc:2|UVIN-9043-UVOUT,SPD-6853-OUT;n:type:ShaderForge.SFN_Tex2d,id:6229,x:32491,y:32729,ptovrint:False,ptlb:node_6229,ptin:_node_6229,varname:node_6229,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:e87d6ef53e0d93649b5dc704bc4c2ac2,ntxv:0,isnm:False|UVIN-3044-UVOUT;n:type:ShaderForge.SFN_Rotator,id:3044,x:32337,y:32729,varname:node_3044,prsc:2|UVIN-9043-UVOUT,SPD-5758-OUT;n:type:ShaderForge.SFN_Slider,id:5758,x:31922,y:32693,ptovrint:False,ptlb:node_6853_copy,ptin:_node_6853_copy,varname:_node_6853_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1.196581,max:2;n:type:ShaderForge.SFN_Add,id:2410,x:32965,y:33078,varname:node_2410,prsc:2|A-1702-OUT,B-228-OUT;n:type:ShaderForge.SFN_Multiply,id:1702,x:32668,y:32851,varname:node_1702,prsc:2|A-6229-RGB,B-7890-OUT;n:type:ShaderForge.SFN_Multiply,id:228,x:32668,y:33253,varname:node_228,prsc:2|A-6729-RGB,B-9193-OUT;n:type:ShaderForge.SFN_Vector3,id:7890,x:32477,y:32972,varname:node_7890,prsc:2,v1:0,v2:1.5,v3:2;n:type:ShaderForge.SFN_Vector3,id:9193,x:32398,y:33516,varname:node_9193,prsc:2,v1:1.5,v2:1,v3:2;n:type:ShaderForge.SFN_Vector1,id:7189,x:32893,y:32846,varname:node_7189,prsc:2,v1:3;n:type:ShaderForge.SFN_Tex2d,id:2678,x:33017,y:33609,ptovrint:False,ptlb:node_2678,ptin:_node_2678,varname:node_2678,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:bdc451f0465043d4f8b5eae320c43227,ntxv:0,isnm:False|UVIN-492-UVOUT;n:type:ShaderForge.SFN_Rotator,id:8750,x:32541,y:33738,varname:node_8750,prsc:2|UVIN-9043-UVOUT,ANG-7746-OUT;n:type:ShaderForge.SFN_Vector1,id:7746,x:32435,y:33667,varname:node_7746,prsc:2,v1:12;n:type:ShaderForge.SFN_Panner,id:492,x:32834,y:33608,varname:node_492,prsc:2,spu:0,spv:0.5|UVIN-8750-UVOUT;n:type:ShaderForge.SFN_Multiply,id:2492,x:33346,y:33705,varname:node_2492,prsc:2|A-2678-RGB,B-6139-OUT,C-3991-OUT;n:type:ShaderForge.SFN_Vector3,id:6139,x:32963,y:33808,varname:node_6139,prsc:2,v1:0.516,v2:1,v3:1;n:type:ShaderForge.SFN_Vector1,id:3991,x:33108,y:33924,varname:node_3991,prsc:2,v1:0.2;proporder:6729-6853-6229-5758-2678;pass:END;sub:END;*/

Shader "Shader Forge/card" {
    Properties {
        _node_6729 ("node_6729", 2D) = "white" {}
        _node_6853 ("node_6853", Range(0, 1)) = 0.5299146
        _node_6229 ("node_6229", 2D) = "white" {}
        _node_6853_copy ("node_6853_copy", Range(0, 2)) = 1.196581
        _node_2678 ("node_2678", 2D) = "white" {}
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
            Cull Off
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma exclude_renderers gles2 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 2.0
            uniform float4 _TimeEditor;
            uniform sampler2D _node_6729; uniform float4 _node_6729_ST;
            uniform float _node_6853;
            uniform sampler2D _node_6229; uniform float4 _node_6229_ST;
            uniform float _node_6853_copy;
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
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
////// Lighting:
////// Emissive:
                float4 node_7673 = _Time + _TimeEditor;
                float node_3044_ang = node_7673.g;
                float node_3044_spd = _node_6853_copy;
                float node_3044_cos = cos(node_3044_spd*node_3044_ang);
                float node_3044_sin = sin(node_3044_spd*node_3044_ang);
                float2 node_3044_piv = float2(0.5,0.5);
                float2 node_3044 = (mul(i.uv0-node_3044_piv,float2x2( node_3044_cos, -node_3044_sin, node_3044_sin, node_3044_cos))+node_3044_piv);
                float4 _node_6229_var = tex2D(_node_6229,TRANSFORM_TEX(node_3044, _node_6229));
                float node_8319_ang = node_7673.g;
                float node_8319_spd = _node_6853;
                float node_8319_cos = cos(node_8319_spd*node_8319_ang);
                float node_8319_sin = sin(node_8319_spd*node_8319_ang);
                float2 node_8319_piv = float2(0.5,0.5);
                float2 node_8319 = (mul(i.uv0-node_8319_piv,float2x2( node_8319_cos, -node_8319_sin, node_8319_sin, node_8319_cos))+node_8319_piv);
                float4 _node_6729_var = tex2D(_node_6729,TRANSFORM_TEX(node_8319, _node_6729));
                float3 emissive = ((_node_6229_var.rgb*float3(0,1.5,2))+(_node_6729_var.rgb*float3(1.5,1,2)));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
