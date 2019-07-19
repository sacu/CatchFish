// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:32694,y:32907,varname:node_3138,prsc:2|emission-2756-OUT,clip-2783-A;n:type:ShaderForge.SFN_Tex2d,id:2783,x:32255,y:32866,ptovrint:False,ptlb:node_2783,ptin:_node_2783,varname:node_2783,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:2928596402e97854d853e086b1ee53f3,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:309,x:31859,y:32849,ptovrint:False,ptlb:node_309,ptin:_node_309,varname:node_309,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:133fa2d9127a06c46bd4870232e91092,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Panner,id:1227,x:31396,y:32970,varname:node_1227,prsc:2,spu:0.3,spv:0.05|UVIN-1233-UVOUT;n:type:ShaderForge.SFN_Multiply,id:8436,x:32255,y:33028,varname:node_8436,prsc:2|A-6718-OUT,B-6944-RGB,C-8730-OUT,D-4535-OUT;n:type:ShaderForge.SFN_Add,id:2756,x:32416,y:33006,varname:node_2756,prsc:2|A-2783-RGB,B-8436-OUT;n:type:ShaderForge.SFN_Tex2d,id:6944,x:31724,y:33054,ptovrint:False,ptlb:node_6944,ptin:_node_6944,varname:node_6944,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False|UVIN-7186-OUT;n:type:ShaderForge.SFN_OneMinus,id:6718,x:32044,y:32866,varname:node_6718,prsc:2|IN-309-RGB;n:type:ShaderForge.SFN_TexCoord,id:1233,x:31129,y:33056,varname:node_1233,prsc:2,uv:0;n:type:ShaderForge.SFN_Slider,id:8730,x:31910,y:33115,ptovrint:False,ptlb:node_8730,ptin:_node_8730,varname:node_8730,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.8376079,max:1;n:type:ShaderForge.SFN_Vector1,id:4365,x:31253,y:33214,varname:node_4365,prsc:2,v1:2;n:type:ShaderForge.SFN_Rotator,id:7008,x:31416,y:33162,varname:node_7008,prsc:2|UVIN-1233-UVOUT,ANG-4365-OUT;n:type:ShaderForge.SFN_Add,id:7186,x:31546,y:33054,varname:node_7186,prsc:2|A-1227-UVOUT,B-7008-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:8474,x:31746,y:33347,ptovrint:False,ptlb:node_8474,ptin:_node_8474,varname:node_8474,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:ed28e030239d0f84e9e5c303d9170b3e,ntxv:0,isnm:False|UVIN-9392-OUT;n:type:ShaderForge.SFN_Tex2d,id:478,x:31737,y:33485,ptovrint:False,ptlb:node_478,ptin:_node_478,varname:node_478,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:98f9768ff8ad0b54cbcb78fc65c4ff0d,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Panner,id:9638,x:31385,y:33328,varname:node_9638,prsc:2,spu:0.1,spv:-1|UVIN-1233-UVOUT;n:type:ShaderForge.SFN_Add,id:9392,x:31544,y:33305,varname:node_9392,prsc:2|A-7008-UVOUT,B-9638-UVOUT;n:type:ShaderForge.SFN_Multiply,id:4535,x:32079,y:33351,varname:node_4535,prsc:2|A-478-RGB,B-3528-OUT;n:type:ShaderForge.SFN_Multiply,id:3528,x:31926,y:33238,varname:node_3528,prsc:2|A-7325-OUT,B-8474-RGB;n:type:ShaderForge.SFN_Vector3,id:7325,x:31746,y:33217,varname:node_7325,prsc:2,v1:1,v2:1,v3:0.7;proporder:2783-309-6944-8730-8474-478;pass:END;sub:END;*/

Shader "Shader Forge/1" {
    Properties {
        _node_2783 ("node_2783", 2D) = "white" {}
        _node_309 ("node_309", 2D) = "white" {}
        _node_6944 ("node_6944", 2D) = "white" {}
        _node_8730 ("node_8730", Range(0, 1)) = 0.8376079
        _node_8474 ("node_8474", 2D) = "white" {}
        _node_478 ("node_478", 2D) = "white" {}
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="AlphaTest"
            "RenderType"="TransparentCutout"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma exclude_renderers metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 2.0
            uniform float4 _TimeEditor;
            uniform sampler2D _node_2783; uniform float4 _node_2783_ST;
            uniform sampler2D _node_309; uniform float4 _node_309_ST;
            uniform sampler2D _node_6944; uniform float4 _node_6944_ST;
            uniform float _node_8730;
            uniform sampler2D _node_8474; uniform float4 _node_8474_ST;
            uniform sampler2D _node_478; uniform float4 _node_478_ST;
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
                float4 _node_2783_var = tex2D(_node_2783,TRANSFORM_TEX(i.uv0, _node_2783));
                clip(_node_2783_var.a - 0.5);
////// Lighting:
////// Emissive:
                float4 _node_309_var = tex2D(_node_309,TRANSFORM_TEX(i.uv0, _node_309));
                float4 node_7512 = _Time + _TimeEditor;
                float node_7008_ang = 2.0;
                float node_7008_spd = 1.0;
                float node_7008_cos = cos(node_7008_spd*node_7008_ang);
                float node_7008_sin = sin(node_7008_spd*node_7008_ang);
                float2 node_7008_piv = float2(0.5,0.5);
                float2 node_7008 = (mul(i.uv0-node_7008_piv,float2x2( node_7008_cos, -node_7008_sin, node_7008_sin, node_7008_cos))+node_7008_piv);
                float2 node_7186 = ((i.uv0+node_7512.g*float2(0.3,0.05))+node_7008);
                float4 _node_6944_var = tex2D(_node_6944,TRANSFORM_TEX(node_7186, _node_6944));
                float4 _node_478_var = tex2D(_node_478,TRANSFORM_TEX(i.uv0, _node_478));
                float2 node_9392 = (node_7008+(i.uv0+node_7512.g*float2(0.1,-1)));
                float4 _node_8474_var = tex2D(_node_8474,TRANSFORM_TEX(node_9392, _node_8474));
                float3 emissive = (_node_2783_var.rgb+((1.0 - _node_309_var.rgb)*_node_6944_var.rgb*_node_8730*(_node_478_var.rgb*(float3(1,1,0.7)*_node_8474_var.rgb))));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
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
            #pragma exclude_renderers metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 2.0
            uniform sampler2D _node_2783; uniform float4 _node_2783_ST;
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
            float4 frag(VertexOutput i) : COLOR {
                float4 _node_2783_var = tex2D(_node_2783,TRANSFORM_TEX(i.uv0, _node_2783));
                clip(_node_2783_var.a - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
