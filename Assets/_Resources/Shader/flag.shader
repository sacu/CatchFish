// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:2,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:32034,y:32676,varname:node_3138,prsc:2|emission-10-OUT,alpha-7351-A;n:type:ShaderForge.SFN_Tex2d,id:7351,x:31054,y:32815,ptovrint:False,ptlb:node_7351,ptin:_node_7351,varname:node_7351,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:03283abbbdfebcd4cb31d226e933d7db,ntxv:0,isnm:False|UVIN-2572-OUT;n:type:ShaderForge.SFN_Tex2d,id:2019,x:30084,y:32618,ptovrint:False,ptlb:node_2019,ptin:_node_2019,varname:node_2019,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:0df7a0b61c9dfa6408ae01459c10ffec,ntxv:0,isnm:False|UVIN-3417-UVOUT;n:type:ShaderForge.SFN_Panner,id:3417,x:29894,y:32618,varname:node_3417,prsc:2,spu:-0.06,spv:0.08|UVIN-6232-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:6232,x:29402,y:32799,varname:node_6232,prsc:2,uv:0;n:type:ShaderForge.SFN_Add,id:2572,x:30696,y:32806,varname:node_2572,prsc:2|A-9369-OUT,B-6232-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:8300,x:29935,y:32359,ptovrint:False,ptlb:node_8300,ptin:_node_8300,varname:node_8300,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:1e7627244dfee8a44a5674e56f9415ee,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Slider,id:7823,x:30302,y:32551,ptovrint:False,ptlb:node_7823,ptin:_node_7823,varname:node_7823,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-1,cur:0.0678314,max:1;n:type:ShaderForge.SFN_Multiply,id:5971,x:30271,y:32618,varname:node_5971,prsc:2|A-6225-OUT,B-2019-R;n:type:ShaderForge.SFN_Multiply,id:9369,x:30486,y:32630,varname:node_9369,prsc:2|A-7823-OUT,B-5971-OUT;n:type:ShaderForge.SFN_Multiply,id:6225,x:30203,y:32324,varname:node_6225,prsc:2|A-5759-OUT,B-8300-R;n:type:ShaderForge.SFN_Vector1,id:5759,x:29939,y:32228,varname:node_5759,prsc:2,v1:2;n:type:ShaderForge.SFN_Add,id:10,x:31607,y:32798,varname:node_10,prsc:2|A-9025-OUT,B-7351-RGB,C-2544-OUT,D-915-OUT;n:type:ShaderForge.SFN_Tex2d,id:220,x:31145,y:32581,ptovrint:False,ptlb:node_220,ptin:_node_220,varname:node_220,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:70d408d5d89edb34189053f54373252b,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:7595,x:31136,y:32360,varname:node_7595,prsc:2|A-1157-OUT,B-319-RGB;n:type:ShaderForge.SFN_Tex2d,id:319,x:30888,y:32384,ptovrint:False,ptlb:node_319,ptin:_node_319,varname:node_319,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:ed28e030239d0f84e9e5c303d9170b3e,ntxv:0,isnm:False|UVIN-8178-UVOUT;n:type:ShaderForge.SFN_Panner,id:8178,x:30708,y:32259,varname:node_8178,prsc:2,spu:0.6,spv:0.6|UVIN-6232-UVOUT;n:type:ShaderForge.SFN_Multiply,id:9025,x:31346,y:32483,varname:node_9025,prsc:2|A-7595-OUT,B-220-RGB;n:type:ShaderForge.SFN_Vector3,id:1157,x:30904,y:32259,varname:node_1157,prsc:2,v1:4,v2:1,v3:0.5;n:type:ShaderForge.SFN_Tex2d,id:8533,x:30923,y:33334,ptovrint:False,ptlb:node_8533,ptin:_node_8533,varname:node_8533,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:fd0e43b5dfdda114ba8ae33376a8e9a2,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:2544,x:31128,y:33463,varname:node_2544,prsc:2|A-8533-RGB,B-2054-OUT;n:type:ShaderForge.SFN_Slider,id:1828,x:30659,y:33789,ptovrint:False,ptlb:node_1828,ptin:_node_1828,varname:node_1828,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-2,cur:1.176313,max:4;n:type:ShaderForge.SFN_Color,id:4894,x:30858,y:33580,ptovrint:False,ptlb:node_4894,ptin:_node_4894,varname:node_4894,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Multiply,id:915,x:31337,y:32800,varname:node_915,prsc:2|A-4592-OUT,B-7351-RGB,C-5576-OUT;n:type:ShaderForge.SFN_OneMinus,id:4592,x:30646,y:32439,varname:node_4592,prsc:2|IN-6225-OUT;n:type:ShaderForge.SFN_Vector1,id:5576,x:31237,y:32743,varname:node_5576,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Add,id:2054,x:31089,y:33669,varname:node_2054,prsc:2|A-4894-RGB,B-1828-OUT;proporder:7351-2019-8300-7823-220-319-8533-1828-4894;pass:END;sub:END;*/

Shader "Shader Forge/flag" {
    Properties {
        _node_7351 ("node_7351", 2D) = "white" {}
        _node_2019 ("node_2019", 2D) = "white" {}
        _node_8300 ("node_8300", 2D) = "white" {}
        _node_7823 ("node_7823", Range(-1, 1)) = 0.0678314
        _node_220 ("node_220", 2D) = "white" {}
        _node_319 ("node_319", 2D) = "white" {}
        _node_8533 ("node_8533", 2D) = "white" {}
        _node_1828 ("node_1828", Range(-2, 4)) = 1.176313
        _node_4894 ("node_4894", Color) = (1,0,0,1)
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
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
            Blend SrcAlpha OneMinusSrcAlpha
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
            uniform sampler2D _node_7351; uniform float4 _node_7351_ST;
            uniform sampler2D _node_2019; uniform float4 _node_2019_ST;
            uniform sampler2D _node_8300; uniform float4 _node_8300_ST;
            uniform float _node_7823;
            uniform sampler2D _node_220; uniform float4 _node_220_ST;
            uniform sampler2D _node_319; uniform float4 _node_319_ST;
            uniform sampler2D _node_8533; uniform float4 _node_8533_ST;
            uniform float _node_1828;
            uniform float4 _node_4894;
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
                float4 node_1911 = _Time + _TimeEditor;
                float2 node_8178 = (i.uv0+node_1911.g*float2(0.6,0.6));
                float4 _node_319_var = tex2D(_node_319,TRANSFORM_TEX(node_8178, _node_319));
                float4 _node_220_var = tex2D(_node_220,TRANSFORM_TEX(i.uv0, _node_220));
                float4 _node_8300_var = tex2D(_node_8300,TRANSFORM_TEX(i.uv0, _node_8300));
                float node_6225 = (2.0*_node_8300_var.r);
                float2 node_3417 = (i.uv0+node_1911.g*float2(-0.06,0.08));
                float4 _node_2019_var = tex2D(_node_2019,TRANSFORM_TEX(node_3417, _node_2019));
                float2 node_2572 = ((_node_7823*(node_6225*_node_2019_var.r))+i.uv0);
                float4 _node_7351_var = tex2D(_node_7351,TRANSFORM_TEX(node_2572, _node_7351));
                float4 _node_8533_var = tex2D(_node_8533,TRANSFORM_TEX(i.uv0, _node_8533));
                float3 emissive = (((float3(4,1,0.5)*_node_319_var.rgb)*_node_220_var.rgb)+_node_7351_var.rgb+(_node_8533_var.rgb*(_node_4894.rgb+_node_1828))+((1.0 - node_6225)*_node_7351_var.rgb*0.5));
                float3 finalColor = emissive;
                return fixed4(finalColor,_node_7351_var.a);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
