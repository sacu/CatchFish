// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:32719,y:32712,varname:node_3138,prsc:2|emission-586-OUT,clip-7373-OUT;n:type:ShaderForge.SFN_Tex2d,id:1621,x:32103,y:33031,ptovrint:False,ptlb:mask,ptin:_mask,varname:node_1621,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:47067b9771745624099656e6cfe85b7d,ntxv:0,isnm:False|UVIN-9873-UVOUT;n:type:ShaderForge.SFN_Step,id:7373,x:32301,y:33121,varname:node_7373,prsc:2|A-1621-R,B-1709-OUT;n:type:ShaderForge.SFN_Slider,id:1709,x:32000,y:33264,ptovrint:False,ptlb:node_1709,ptin:_node_1709,varname:node_1709,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Tex2d,id:5577,x:32220,y:32733,ptovrint:False,ptlb:tex,ptin:_tex,varname:node_5577,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:6712dc0f195c1d64c87291f4de358c5e,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:1841,x:31447,y:32410,ptovrint:False,ptlb:node_1841,ptin:_node_1841,varname:node_1841,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:97ff3b62642f462418e8b21c7a77681d,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Vector1,id:7454,x:31578,y:32404,varname:node_7454,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Step,id:6851,x:31803,y:32404,varname:node_6851,prsc:2|A-7454-OUT,B-1841-RGB;n:type:ShaderForge.SFN_Panner,id:3180,x:31591,y:32226,varname:node_3180,prsc:2,spu:0.1,spv:0.2|UVIN-9873-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:9873,x:30761,y:32940,varname:node_9873,prsc:2,uv:0;n:type:ShaderForge.SFN_Add,id:586,x:32398,y:32574,varname:node_586,prsc:2|A-5059-OUT,B-5577-RGB;n:type:ShaderForge.SFN_Tex2d,id:9148,x:31803,y:32226,ptovrint:False,ptlb:node_9148,ptin:_node_9148,varname:node_9148,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False|UVIN-3180-UVOUT;n:type:ShaderForge.SFN_Multiply,id:5059,x:32150,y:32287,varname:node_5059,prsc:2|A-9148-RGB,B-6851-OUT;proporder:1621-1709-5577-1841-9148;pass:END;sub:END;*/

Shader "Shader Forge/La_card_yuan" {
    Properties {
        _mask ("mask", 2D) = "white" {}
        _node_1709 ("node_1709", Range(0, 1)) = 1
        _tex ("tex", 2D) = "white" {}
        _node_1841 ("node_1841", 2D) = "white" {}
        _node_9148 ("node_9148", 2D) = "white" {}
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
            #pragma exclude_renderers gles2 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 2.0
            uniform float4 _TimeEditor;
            uniform sampler2D _mask; uniform float4 _mask_ST;
            uniform float _node_1709;
            uniform sampler2D _tex; uniform float4 _tex_ST;
            uniform sampler2D _node_1841; uniform float4 _node_1841_ST;
            uniform sampler2D _node_9148; uniform float4 _node_9148_ST;
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
                float4 _mask_var = tex2D(_mask,TRANSFORM_TEX(i.uv0, _mask));
                clip(step(_mask_var.r,_node_1709) - 0.5);
////// Lighting:
////// Emissive:
                float4 node_2240 = _Time + _TimeEditor;
                float2 node_3180 = (i.uv0+node_2240.g*float2(0.1,0.2));
                float4 _node_9148_var = tex2D(_node_9148,TRANSFORM_TEX(node_3180, _node_9148));
                float node_7454 = 0.5;
                float4 _node_1841_var = tex2D(_node_1841,TRANSFORM_TEX(i.uv0, _node_1841));
                float4 _tex_var = tex2D(_tex,TRANSFORM_TEX(i.uv0, _tex));
                float3 emissive = ((_node_9148_var.rgb*step(node_7454,_node_1841_var.rgb))+_tex_var.rgb);
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
            uniform sampler2D _mask; uniform float4 _mask_ST;
            uniform float _node_1709;
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
                float4 _mask_var = tex2D(_mask,TRANSFORM_TEX(i.uv0, _mask));
                clip(step(_mask_var.r,_node_1709) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
