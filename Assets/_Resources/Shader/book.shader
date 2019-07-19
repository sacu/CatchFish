// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:33033,y:32715,varname:node_3138,prsc:2|emission-2330-OUT,alpha-6020-A;n:type:ShaderForge.SFN_Color,id:7241,x:32172,y:33042,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_7241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.891,c2:0.8592384,c3:0.621027,c4:0.841;n:type:ShaderForge.SFN_Tex2d,id:7761,x:31790,y:32705,ptovrint:False,ptlb:node_7761,ptin:_node_7761,varname:node_7761,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:133fa2d9127a06c46bd4870232e91092,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:5202,x:31944,y:32917,ptovrint:False,ptlb:node_5202,ptin:_node_5202,varname:node_5202,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:0df7a0b61c9dfa6408ae01459c10ffec,ntxv:0,isnm:False|UVIN-9062-UVOUT;n:type:ShaderForge.SFN_Panner,id:9062,x:31754,y:32887,varname:node_9062,prsc:2,spu:0.2,spv:0.2|UVIN-8525-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:8525,x:31521,y:32720,varname:node_8525,prsc:2,uv:0;n:type:ShaderForge.SFN_Multiply,id:6221,x:32172,y:32852,varname:node_6221,prsc:2|A-2869-OUT,B-5202-RGB;n:type:ShaderForge.SFN_OneMinus,id:2869,x:31960,y:32722,varname:node_2869,prsc:2|IN-7761-RGB;n:type:ShaderForge.SFN_Vector1,id:5319,x:32373,y:32807,varname:node_5319,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Multiply,id:4553,x:32557,y:32832,varname:node_4553,prsc:2|A-5319-OUT,B-2148-OUT;n:type:ShaderForge.SFN_Add,id:2330,x:32782,y:32749,varname:node_2330,prsc:2|A-6020-RGB,B-4553-OUT;n:type:ShaderForge.SFN_Tex2d,id:6020,x:32580,y:32557,ptovrint:False,ptlb:node_6020,ptin:_node_6020,varname:node_6020,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:9cd4c96a485c3ff4a80e182ed41be8f3,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:2148,x:32367,y:32916,varname:node_2148,prsc:2|A-6221-OUT,B-7241-RGB;proporder:7241-7761-5202-6020;pass:END;sub:END;*/

Shader "Shader Forge/book" {
    Properties {
        _Color ("Color", Color) = (0.891,0.8592384,0.621027,0.841)
        _node_7761 ("node_7761", 2D) = "white" {}
        _node_5202 ("node_5202", 2D) = "white" {}
        _node_6020 ("node_6020", 2D) = "white" {}
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
            uniform float4 _Color;
            uniform sampler2D _node_7761; uniform float4 _node_7761_ST;
            uniform sampler2D _node_5202; uniform float4 _node_5202_ST;
            uniform sampler2D _node_6020; uniform float4 _node_6020_ST;
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
                float4 _node_6020_var = tex2D(_node_6020,TRANSFORM_TEX(i.uv0, _node_6020));
                float4 _node_7761_var = tex2D(_node_7761,TRANSFORM_TEX(i.uv0, _node_7761));
                float4 node_3962 = _Time + _TimeEditor;
                float2 node_9062 = (i.uv0+node_3962.g*float2(0.2,0.2));
                float4 _node_5202_var = tex2D(_node_5202,TRANSFORM_TEX(node_9062, _node_5202));
                float3 emissive = (_node_6020_var.rgb+(0.5*(((1.0 - _node_7761_var.rgb)*_node_5202_var.rgb)*_Color.rgb)));
                float3 finalColor = emissive;
                return fixed4(finalColor,_node_6020_var.a);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
