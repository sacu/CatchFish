// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:2,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:0,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:32719,y:32712,varname:node_3138,prsc:2|emission-5288-OUT,clip-4964-OUT;n:type:ShaderForge.SFN_Tex2d,id:8511,x:32036,y:32782,ptovrint:False,ptlb:opacity,ptin:_opacity,varname:node_8511,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Step,id:4964,x:32213,y:32906,varname:node_4964,prsc:2|A-8511-R,B-142-OUT;n:type:ShaderForge.SFN_Slider,id:142,x:31879,y:32960,ptovrint:False,ptlb:power,ptin:_power,varname:node_142,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Color,id:3682,x:32218,y:32437,ptovrint:False,ptlb:alpha,ptin:_alpha,varname:node_3682,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2d,id:9102,x:32038,y:32603,ptovrint:False,ptlb:texture,ptin:_texture,varname:node_9102,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:1bbc68a0ae672ad46937578bc34c8cdd,ntxv:0,isnm:False|UVIN-7715-UVOUT;n:type:ShaderForge.SFN_Add,id:7099,x:32229,y:32572,varname:node_7099,prsc:2|A-205-OUT,B-9102-RGB;n:type:ShaderForge.SFN_Panner,id:7715,x:31882,y:32603,varname:node_7715,prsc:2,spu:0.01,spv:0.07|UVIN-1485-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:1485,x:31692,y:32603,varname:node_1485,prsc:2,uv:0;n:type:ShaderForge.SFN_Multiply,id:5288,x:32412,y:32512,varname:node_5288,prsc:2|A-3682-RGB,B-7099-OUT;n:type:ShaderForge.SFN_Vector3,id:205,x:32038,y:32490,varname:node_205,prsc:2,v1:0.6,v2:0.4,v3:0;proporder:8511-142-3682-9102;pass:END;sub:END;*/

Shader "Shader Forge/tianping" {
    Properties {
        _opacity ("opacity", 2D) = "white" {}
        _power ("power", Range(0, 1)) = 1
        _alpha ("alpha", Color) = (1,1,1,1)
        _texture ("texture", 2D) = "white" {}
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
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma exclude_renderers gles2 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 2.0
            uniform float4 _TimeEditor;
            uniform sampler2D _opacity; uniform float4 _opacity_ST;
            uniform float _power;
            uniform float4 _alpha;
            uniform sampler2D _texture; uniform float4 _texture_ST;
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
                float4 _opacity_var = tex2D(_opacity,TRANSFORM_TEX(i.uv0, _opacity));
                clip(step(_opacity_var.r,_power) - 0.5);
////// Lighting:
////// Emissive:
                float4 node_2453 = _Time + _TimeEditor;
                float2 node_7715 = (i.uv0+node_2453.g*float2(0.01,0.07));
                float4 _texture_var = tex2D(_texture,TRANSFORM_TEX(node_7715, _texture));
                float3 node_7099 = (float3(0.6,0.4,0)+_texture_var.rgb);
                float3 emissive = (_alpha.rgb*node_7099);
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
            #pragma exclude_renderers gles2 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 2.0
            uniform sampler2D _opacity; uniform float4 _opacity_ST;
            uniform float _power;
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
                float4 _opacity_var = tex2D(_opacity,TRANSFORM_TEX(i.uv0, _opacity));
                clip(step(_opacity_var.r,_power) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
