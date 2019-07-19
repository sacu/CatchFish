// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:6623,x:32900,y:33037,varname:node_6623,prsc:2|emission-2024-OUT;n:type:ShaderForge.SFN_Tex2d,id:7665,x:31385,y:33131,ptovrint:False,ptlb:toukui_mask,ptin:_toukui_mask,varname:node_7665,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:0123fb6f420c21844919c437cd6e2f52,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:7351,x:31307,y:32351,ptovrint:False,ptlb:yan_mask,ptin:_yan_mask,varname:node_7351,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:e9723410d0bdc31488f982546b81d8e5,ntxv:0,isnm:False|UVIN-803-UVOUT;n:type:ShaderForge.SFN_Multiply,id:3166,x:31600,y:32353,varname:node_3166,prsc:2|A-8305-R,B-7351-R,C-4419-OUT,D-2113-OUT;n:type:ShaderForge.SFN_Tex2d,id:5157,x:30918,y:32351,ptovrint:False,ptlb:yan_mask_rl,ptin:_yan_mask_rl,varname:node_5157,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:2bd3fc7fe7f590d4bb5517e0f6af270e,ntxv:0,isnm:False|UVIN-8849-UVOUT;n:type:ShaderForge.SFN_Add,id:1096,x:32427,y:33120,varname:node_1096,prsc:2|A-3166-OUT,B-6470-OUT;n:type:ShaderForge.SFN_Panner,id:803,x:31127,y:32351,varname:node_803,prsc:2,spu:0,spv:-0.03|UVIN-2573-UVOUT,DIST-5157-R;n:type:ShaderForge.SFN_Vector3,id:4419,x:31307,y:32520,varname:node_4419,prsc:2,v1:2.5,v2:0,v3:0;n:type:ShaderForge.SFN_Tex2d,id:8305,x:31307,y:32165,ptovrint:False,ptlb:yan_tex_rl,ptin:_yan_tex_rl,varname:node_8305,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:2bd3fc7fe7f590d4bb5517e0f6af270e,ntxv:0,isnm:False|UVIN-9431-UVOUT;n:type:ShaderForge.SFN_Panner,id:8849,x:30721,y:32351,varname:node_8849,prsc:2,spu:0,spv:-0.05|UVIN-2573-UVOUT;n:type:ShaderForge.SFN_Panner,id:9431,x:31127,y:32165,varname:node_9431,prsc:2,spu:0,spv:-0.1|UVIN-2573-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:2573,x:30066,y:32618,varname:node_2573,prsc:2,uv:0;n:type:ShaderForge.SFN_Multiply,id:6470,x:31670,y:33097,varname:node_6470,prsc:2|A-1041-R,B-7665-R,C-7457-OUT;n:type:ShaderForge.SFN_Tex2d,id:1041,x:31385,y:32946,ptovrint:False,ptlb:toutui_lg,ptin:_toutui_lg,varname:node_1041,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:2bd3fc7fe7f590d4bb5517e0f6af270e,ntxv:0,isnm:False|UVIN-3454-UVOUT;n:type:ShaderForge.SFN_Panner,id:3454,x:31196,y:32946,varname:node_3454,prsc:2,spu:0,spv:-0.2|UVIN-2573-UVOUT;n:type:ShaderForge.SFN_Multiply,id:2024,x:32680,y:32998,varname:node_2024,prsc:2|A-8595-A,B-1096-OUT;n:type:ShaderForge.SFN_Tex2d,id:8595,x:32427,y:32881,ptovrint:False,ptlb:node_8595,ptin:_node_8595,varname:node_8595,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:65033e6c8d654ab45841d3f0b0d560ca,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Sin,id:5187,x:31113,y:32634,varname:node_5187,prsc:2|IN-7631-T;n:type:ShaderForge.SFN_Time,id:7631,x:30931,y:32634,varname:node_7631,prsc:2;n:type:ShaderForge.SFN_Add,id:2113,x:31307,y:32634,varname:node_2113,prsc:2|A-5187-OUT,B-5185-OUT;n:type:ShaderForge.SFN_Vector1,id:5185,x:31113,y:32764,varname:node_5185,prsc:2,v1:2;n:type:ShaderForge.SFN_Vector1,id:7457,x:31385,y:33298,varname:node_7457,prsc:2,v1:2;proporder:7351-5157-8305-7665-1041-8595;pass:END;sub:END;*/

Shader "Custom/Kronos_shader_1" {
    Properties {
        _yan_mask ("yan_mask", 2D) = "white" {}
        _yan_mask_rl ("yan_mask_rl", 2D) = "white" {}
        _yan_tex_rl ("yan_tex_rl", 2D) = "white" {}
        _toukui_mask ("toukui_mask", 2D) = "white" {}
        _toutui_lg ("toutui_lg", 2D) = "white" {}
        _node_8595 ("node_8595", 2D) = "white" {}
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        LOD 200
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
            #pragma multi_compile_fog
            #pragma exclude_renderers gles2 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 2.0
            uniform float4 _TimeEditor;
            uniform sampler2D _toukui_mask; uniform float4 _toukui_mask_ST;
            uniform sampler2D _yan_mask; uniform float4 _yan_mask_ST;
            uniform sampler2D _yan_mask_rl; uniform float4 _yan_mask_rl_ST;
            uniform sampler2D _yan_tex_rl; uniform float4 _yan_tex_rl_ST;
            uniform sampler2D _toutui_lg; uniform float4 _toutui_lg_ST;
            uniform sampler2D _node_8595; uniform float4 _node_8595_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos(v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float4 _node_8595_var = tex2D(_node_8595,TRANSFORM_TEX(i.uv0, _node_8595));
                float4 node_5179 = _Time + _TimeEditor;
                float2 node_9431 = (i.uv0+node_5179.g*float2(0,-0.1));
                float4 _yan_tex_rl_var = tex2D(_yan_tex_rl,TRANSFORM_TEX(node_9431, _yan_tex_rl));
                float2 node_8849 = (i.uv0+node_5179.g*float2(0,-0.05));
                float4 _yan_mask_rl_var = tex2D(_yan_mask_rl,TRANSFORM_TEX(node_8849, _yan_mask_rl));
                float2 node_803 = (i.uv0+_yan_mask_rl_var.r*float2(0,-0.03));
                float4 _yan_mask_var = tex2D(_yan_mask,TRANSFORM_TEX(node_803, _yan_mask));
                float4 node_7631 = _Time + _TimeEditor;
                float2 node_3454 = (i.uv0+node_5179.g*float2(0,-0.2));
                float4 _toutui_lg_var = tex2D(_toutui_lg,TRANSFORM_TEX(node_3454, _toutui_lg));
                float4 _toukui_mask_var = tex2D(_toukui_mask,TRANSFORM_TEX(i.uv0, _toukui_mask));
                float3 emissive = (_node_8595_var.a*((_yan_tex_rl_var.r*_yan_mask_var.r*float3(2.5,0,0)*(sin(node_7631.g)+2.0))+(_toutui_lg_var.r*_toukui_mask_var.r*2.0)));
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
