// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:33057,y:33076,varname:node_3138,prsc:2|emission-8504-OUT,alpha-6762-A,clip-4510-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:31811,y:33258,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_7241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.7155544,c2:0.2044766,c3:0.8970588,c4:1;n:type:ShaderForge.SFN_Tex2d,id:4695,x:31811,y:32831,ptovrint:False,ptlb:node_4695,ptin:_node_4695,varname:node_4695,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:3c1871d7414ba4e46843e53910714062,ntxv:0,isnm:False|UVIN-2720-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:2802,x:31811,y:33072,ptovrint:False,ptlb:node_2802,ptin:_node_2802,varname:node_2802,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False|UVIN-1583-UVOUT;n:type:ShaderForge.SFN_Panner,id:2720,x:31605,y:32831,varname:node_2720,prsc:2,spu:0,spv:0.02|UVIN-6862-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:6862,x:31287,y:32960,varname:node_6862,prsc:2,uv:0;n:type:ShaderForge.SFN_Panner,id:1583,x:31583,y:33072,varname:node_1583,prsc:2,spu:0.1,spv:-0.05|UVIN-6862-UVOUT;n:type:ShaderForge.SFN_Multiply,id:2520,x:31998,y:33231,varname:node_2520,prsc:2|A-2802-RGB,B-7241-RGB;n:type:ShaderForge.SFN_Add,id:804,x:32229,y:32965,varname:node_804,prsc:2|A-4695-RGB,B-2520-OUT;n:type:ShaderForge.SFN_Multiply,id:8504,x:32682,y:33136,varname:node_8504,prsc:2|A-804-OUT,B-6762-RGB,C-4236-OUT;n:type:ShaderForge.SFN_VertexColor,id:6762,x:32353,y:33334,varname:node_6762,prsc:2;n:type:ShaderForge.SFN_Tex2d,id:9873,x:32066,y:33455,ptovrint:False,ptlb:node_9873,ptin:_node_9873,varname:node_9873,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Step,id:4510,x:32309,y:33515,varname:node_4510,prsc:2|A-9873-R,B-494-OUT;n:type:ShaderForge.SFN_Slider,id:494,x:31968,y:33668,ptovrint:False,ptlb:node_494,ptin:_node_494,varname:node_494,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Vector1,id:4236,x:32425,y:33137,varname:node_4236,prsc:2,v1:0.7;proporder:7241-4695-2802-9873-494;pass:END;sub:END;*/

Shader "Shader Forge/hand" {
    Properties {
        _Color ("Color", Color) = (0.7155544,0.2044766,0.8970588,1)
        _node_4695 ("node_4695", 2D) = "white" {}
        _node_2802 ("node_2802", 2D) = "white" {}
        _node_9873 ("node_9873", 2D) = "white" {}
        _node_494 ("node_494", Range(0, 1)) = 1
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
            uniform float4 _Color;
            uniform sampler2D _node_4695; uniform float4 _node_4695_ST;
            uniform sampler2D _node_2802; uniform float4 _node_2802_ST;
            uniform sampler2D _node_9873; uniform float4 _node_9873_ST;
            uniform float _node_494;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.pos = UnityObjectToClipPos(v.vertex );
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float4 _node_9873_var = tex2D(_node_9873,TRANSFORM_TEX(i.uv0, _node_9873));
                clip(step(_node_9873_var.r,_node_494) - 0.5);
////// Lighting:
////// Emissive:
                float4 node_7357 = _Time + _TimeEditor;
                float2 node_2720 = (i.uv0+node_7357.g*float2(0,0.02));
                float4 _node_4695_var = tex2D(_node_4695,TRANSFORM_TEX(node_2720, _node_4695));
                float2 node_1583 = (i.uv0+node_7357.g*float2(0.1,-0.05));
                float4 _node_2802_var = tex2D(_node_2802,TRANSFORM_TEX(node_1583, _node_2802));
                float3 emissive = ((_node_4695_var.rgb+(_node_2802_var.rgb*_Color.rgb))*i.vertexColor.rgb*0.7);
                float3 finalColor = emissive;
                return fixed4(finalColor,i.vertexColor.a);
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma exclude_renderers gles2 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 2.0
            uniform sampler2D _node_9873; uniform float4 _node_9873_ST;
            uniform float _node_494;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos(v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float4 _node_9873_var = tex2D(_node_9873,TRANSFORM_TEX(i.uv0, _node_9873));
                clip(step(_node_9873_var.r,_node_494) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
