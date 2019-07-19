// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:31837,y:33269,varname:node_3138,prsc:2|emission-9609-OUT,alpha-8700-OUT,clip-545-OUT;n:type:ShaderForge.SFN_Tex2d,id:3058,x:31104,y:33226,ptovrint:False,ptlb:Kronos,ptin:_Kronos,varname:node_3058,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:cf8249b59bc573c4b8e4c2a55bbcade1,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:3547,x:30509,y:33510,ptovrint:False,ptlb:node_3547,ptin:_node_3547,varname:node_3547,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:b11aa31d78fa1c64d8526a86dd7dbe2f,ntxv:0,isnm:False;n:type:ShaderForge.SFN_OneMinus,id:9026,x:31102,y:33084,varname:node_9026,prsc:2|IN-3547-RGB;n:type:ShaderForge.SFN_Multiply,id:7198,x:31328,y:33154,varname:node_7198,prsc:2|A-3058-RGB,B-9026-OUT;n:type:ShaderForge.SFN_Multiply,id:1582,x:31328,y:33280,varname:node_1582,prsc:2|A-3058-RGB,B-3547-RGB;n:type:ShaderForge.SFN_Add,id:9609,x:31533,y:33227,varname:node_9609,prsc:2|A-7198-OUT,B-1582-OUT;n:type:ShaderForge.SFN_Multiply,id:1597,x:31362,y:33777,varname:node_1597,prsc:2|A-3547-R,B-6671-OUT;n:type:ShaderForge.SFN_OneMinus,id:4879,x:31158,y:33536,varname:node_4879,prsc:2|IN-3547-R;n:type:ShaderForge.SFN_Slider,id:7315,x:30822,y:34005,ptovrint:False,ptlb:opacity,ptin:_opacity,varname:node_7315,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Tex2d,id:4967,x:30201,y:33858,ptovrint:False,ptlb:noise,ptin:_noise,varname:node_4967,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False;n:type:ShaderForge.SFN_RemapRange,id:8376,x:30826,y:33821,varname:node_8376,prsc:2,frmn:0,frmx:1,tomn:0,tomx:2|IN-7315-OUT;n:type:ShaderForge.SFN_OneMinus,id:4018,x:30979,y:33821,varname:node_4018,prsc:2|IN-8376-OUT;n:type:ShaderForge.SFN_Add,id:6671,x:31164,y:33797,varname:node_6671,prsc:2|A-3319-OUT,B-4018-OUT;n:type:ShaderForge.SFN_Multiply,id:6126,x:31345,y:33477,varname:node_6126,prsc:2|A-9640-OUT,B-4879-OUT;n:type:ShaderForge.SFN_Tex2d,id:3626,x:30201,y:33674,ptovrint:False,ptlb:UV,ptin:_UV,varname:node_3626,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:70d40687d5935a34f9dc9e885a46b782,ntxv:0,isnm:False|UVIN-3337-UVOUT;n:type:ShaderForge.SFN_Multiply,id:3319,x:30445,y:33797,varname:node_3319,prsc:2|A-3626-R,B-4967-R;n:type:ShaderForge.SFN_TexCoord,id:3337,x:30010,y:33670,varname:node_3337,prsc:2,uv:0;n:type:ShaderForge.SFN_Slider,id:9640,x:31001,y:33452,ptovrint:False,ptlb:alpha,ptin:_alpha,varname:node_9640,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.003117515,max:1;n:type:ShaderForge.SFN_Add,id:8700,x:31518,y:33477,varname:node_8700,prsc:2|A-6126-OUT,B-3547-R;n:type:ShaderForge.SFN_Add,id:545,x:31542,y:33777,varname:node_545,prsc:2|A-1597-OUT,B-4879-OUT;proporder:3058-3547-7315-4967-3626-9640;pass:END;sub:END;*/

Shader "Shader Forge/Amon_card" {
    Properties {
        _Kronos ("Kronos", 2D) = "white" {}
        _node_3547 ("node_3547", 2D) = "white" {}
        _opacity ("opacity", Range(0, 1)) = 1
        _noise ("noise", 2D) = "white" {}
        _UV ("UV", 2D) = "white" {}
        _alpha ("alpha", Range(0, 1)) = 0.003117515
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
            uniform sampler2D _Kronos; uniform float4 _Kronos_ST;
            uniform sampler2D _node_3547; uniform float4 _node_3547_ST;
            uniform float _opacity;
            uniform sampler2D _noise; uniform float4 _noise_ST;
            uniform sampler2D _UV; uniform float4 _UV_ST;
            uniform float _alpha;
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
                float4 _node_3547_var = tex2D(_node_3547,TRANSFORM_TEX(i.uv0, _node_3547));
                float4 _UV_var = tex2D(_UV,TRANSFORM_TEX(i.uv0, _UV));
                float4 _noise_var = tex2D(_noise,TRANSFORM_TEX(i.uv0, _noise));
                float node_3319 = (_UV_var.r*_noise_var.r);
                float node_6671 = (node_3319+(1.0 - (_opacity*2.0+0.0)));
                float node_1597 = (_node_3547_var.r*node_6671);
                float node_4879 = (1.0 - _node_3547_var.r);
                clip((node_1597+node_4879) - 0.5);
////// Lighting:
////// Emissive:
                float4 _Kronos_var = tex2D(_Kronos,TRANSFORM_TEX(i.uv0, _Kronos));
                float3 emissive = ((_Kronos_var.rgb*(1.0 - _node_3547_var.rgb))+(_Kronos_var.rgb*_node_3547_var.rgb));
                float3 finalColor = emissive;
                return fixed4(finalColor,((_alpha*node_4879)+_node_3547_var.r));
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
            uniform sampler2D _node_3547; uniform float4 _node_3547_ST;
            uniform float _opacity;
            uniform sampler2D _noise; uniform float4 _noise_ST;
            uniform sampler2D _UV; uniform float4 _UV_ST;
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
                float4 _node_3547_var = tex2D(_node_3547,TRANSFORM_TEX(i.uv0, _node_3547));
                float4 _UV_var = tex2D(_UV,TRANSFORM_TEX(i.uv0, _UV));
                float4 _noise_var = tex2D(_noise,TRANSFORM_TEX(i.uv0, _noise));
                float node_3319 = (_UV_var.r*_noise_var.r);
                float node_6671 = (node_3319+(1.0 - (_opacity*2.0+0.0)));
                float node_1597 = (_node_3547_var.r*node_6671);
                float node_4879 = (1.0 - _node_3547_var.r);
                clip((node_1597+node_4879) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
