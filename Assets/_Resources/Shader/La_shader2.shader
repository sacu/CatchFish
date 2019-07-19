// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:2012,x:33776,y:33352,varname:node_2012,prsc:2|emission-5696-OUT;n:type:ShaderForge.SFN_Tex2d,id:6040,x:32818,y:33155,ptovrint:False,ptlb:la_mask,ptin:_la_mask,varname:node_6040,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:676203b82dc51e54e8cb883efa555b80,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:1924,x:32992,y:33343,ptovrint:False,ptlb:lizi,ptin:_lizi,varname:node_1924,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:4be441e3f46663742b7a4e7cd2bd6a71,ntxv:0,isnm:False|UVIN-1801-UVOUT;n:type:ShaderForge.SFN_Multiply,id:3882,x:33312,y:33392,varname:node_3882,prsc:2|A-3621-OUT,B-1924-A,C-6471-OUT,D-2084-OUT;n:type:ShaderForge.SFN_Panner,id:1801,x:32818,y:33343,varname:node_1801,prsc:2,spu:0,spv:-0.4|UVIN-3533-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:3533,x:32642,y:33343,varname:node_3533,prsc:2,uv:0;n:type:ShaderForge.SFN_Multiply,id:3621,x:32992,y:33085,varname:node_3621,prsc:2|A-6059-R,B-6040-R;n:type:ShaderForge.SFN_Tex2d,id:6059,x:32818,y:32961,ptovrint:False,ptlb:mask,ptin:_mask,varname:node_6059,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:c80d2242d22fa34418cfa998c7b5b066,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Vector3,id:6471,x:32992,y:33220,varname:node_6471,prsc:2,v1:3,v2:2,v3:0.2;n:type:ShaderForge.SFN_Vector1,id:2084,x:32992,y:33509,varname:node_2084,prsc:2,v1:2;n:type:ShaderForge.SFN_Add,id:5696,x:33548,y:33467,varname:node_5696,prsc:2|A-3882-OUT,B-1502-OUT;n:type:ShaderForge.SFN_Tex2d,id:5184,x:32772,y:33750,ptovrint:False,ptlb:kapai_noise,ptin:_kapai_noise,varname:node_5184,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:7e4f78751982fbd4db2848b67685b9c9,ntxv:0,isnm:False|UVIN-2512-UVOUT;n:type:ShaderForge.SFN_Multiply,id:1502,x:33312,y:33553,varname:node_1502,prsc:2|A-8863-OUT,B-2705-A,C-3937-OUT;n:type:ShaderForge.SFN_Tex2d,id:2705,x:32992,y:33926,ptovrint:False,ptlb:kapai_mask,ptin:_kapai_mask,varname:node_2705,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:65033e6c8d654ab45841d3f0b0d560ca,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Panner,id:2512,x:32589,y:33750,varname:node_2512,prsc:2,spu:0,spv:-0.1|UVIN-4981-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:4981,x:32411,y:33750,varname:node_4981,prsc:2,uv:0;n:type:ShaderForge.SFN_Vector3,id:3937,x:32992,y:33619,varname:node_3937,prsc:2,v1:0.5,v2:0.4,v3:0.1;n:type:ShaderForge.SFN_Power,id:8863,x:32992,y:33750,varname:node_8863,prsc:2|VAL-5184-R,EXP-4969-OUT;n:type:ShaderForge.SFN_Vector1,id:4969,x:32772,y:33911,varname:node_4969,prsc:2,v1:3;proporder:6040-1924-6059-5184-2705;pass:END;sub:END;*/

Shader "Custom/la" {
    Properties {
        _la_mask ("la_mask", 2D) = "white" {}
        _lizi ("lizi", 2D) = "white" {}
        _mask ("mask", 2D) = "white" {}
        _kapai_noise ("kapai_noise", 2D) = "white" {}
        _kapai_mask ("kapai_mask", 2D) = "white" {}
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
            uniform sampler2D _la_mask; uniform float4 _la_mask_ST;
            uniform sampler2D _lizi; uniform float4 _lizi_ST;
            uniform sampler2D _mask; uniform float4 _mask_ST;
            uniform sampler2D _kapai_noise; uniform float4 _kapai_noise_ST;
            uniform sampler2D _kapai_mask; uniform float4 _kapai_mask_ST;
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
                float4 _mask_var = tex2D(_mask,TRANSFORM_TEX(i.uv0, _mask));
                float4 _la_mask_var = tex2D(_la_mask,TRANSFORM_TEX(i.uv0, _la_mask));
                float4 node_761 = _Time + _TimeEditor;
                float2 node_1801 = (i.uv0+node_761.g*float2(0,-0.4));
                float4 _lizi_var = tex2D(_lizi,TRANSFORM_TEX(node_1801, _lizi));
                float2 node_2512 = (i.uv0+node_761.g*float2(0,-0.1));
                float4 _kapai_noise_var = tex2D(_kapai_noise,TRANSFORM_TEX(node_2512, _kapai_noise));
                float4 _kapai_mask_var = tex2D(_kapai_mask,TRANSFORM_TEX(i.uv0, _kapai_mask));
                float3 emissive = (((_mask_var.r*_la_mask_var.r)*_lizi_var.a*float3(3,2,0.2)*2.0)+(pow(_kapai_noise_var.r,3.0)*_kapai_mask_var.a*float3(0.5,0.4,0.1)));
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
