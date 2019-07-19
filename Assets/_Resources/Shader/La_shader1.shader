// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:2012,x:33223,y:33604,varname:node_2012,prsc:2|emission-4080-OUT;n:type:ShaderForge.SFN_Tex2d,id:7832,x:32065,y:32997,ptovrint:False,ptlb:la_kuijia,ptin:_la_kuijia,varname:node_7832,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:aafa476b79a8d3c408c2e9ada850e342,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:6724,x:32260,y:33139,varname:node_6724,prsc:2|A-7832-R,B-2692-OUT,C-6984-OUT;n:type:ShaderForge.SFN_Power,id:6797,x:32616,y:33314,varname:node_6797,prsc:2|VAL-6724-OUT,EXP-5367-OUT;n:type:ShaderForge.SFN_Vector1,id:5367,x:32260,y:33265,varname:node_5367,prsc:2,v1:1.1;n:type:ShaderForge.SFN_Vector3,id:2692,x:32065,y:33169,varname:node_2692,prsc:2,v1:0.5,v2:0.3,v3:0.1;n:type:ShaderForge.SFN_Multiply,id:2044,x:32616,y:33566,varname:node_2044,prsc:2|A-3934-A,B-6984-OUT,C-5611-OUT;n:type:ShaderForge.SFN_Add,id:4080,x:32956,y:33746,varname:node_4080,prsc:2|A-6797-OUT,B-2044-OUT,C-2567-OUT,D-5759-OUT;n:type:ShaderForge.SFN_Vector3,id:5611,x:32260,y:33519,varname:node_5611,prsc:2,v1:0.8,v2:0.5,v3:0.4;n:type:ShaderForge.SFN_Tex2d,id:3934,x:32260,y:33348,ptovrint:False,ptlb:la_baoshi1,ptin:_la_baoshi1,varname:node_3934,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:a8c660d4163ab724e85feac54373a52d,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:1489,x:32260,y:33703,ptovrint:False,ptlb:la_baoshi2,ptin:_la_baoshi2,varname:node_1489,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:f6faf0822d8407c4f89a529ab87f1dd8,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:2567,x:32616,y:33795,varname:node_2567,prsc:2|A-1489-A,B-6984-OUT,C-4872-OUT;n:type:ShaderForge.SFN_Vector3,id:4872,x:32260,y:33907,varname:node_4872,prsc:2,v1:0.3,v2:0.4,v3:0.2;n:type:ShaderForge.SFN_Sin,id:1348,x:31740,y:33482,varname:node_1348,prsc:2|IN-2196-TTR;n:type:ShaderForge.SFN_Time,id:2196,x:31560,y:33482,varname:node_2196,prsc:2;n:type:ShaderForge.SFN_Abs,id:6984,x:31916,y:33482,varname:node_6984,prsc:2|IN-1348-OUT;n:type:ShaderForge.SFN_Tex2d,id:4367,x:32253,y:34140,ptovrint:False,ptlb:node_4367,ptin:_node_4367,varname:node_4367,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:abe26fa1c790d8a41b07ddccb95c1b65,ntxv:0,isnm:False|UVIN-1264-UVOUT;n:type:ShaderForge.SFN_Rotator,id:1264,x:32076,y:34140,varname:node_1264,prsc:2|UVIN-8100-OUT,ANG-2310-OUT;n:type:ShaderForge.SFN_TexCoord,id:4270,x:31674,y:34140,varname:node_4270,prsc:2,uv:0;n:type:ShaderForge.SFN_Multiply,id:8100,x:31880,y:34140,varname:node_8100,prsc:2|A-5025-OUT,B-4270-UVOUT;n:type:ShaderForge.SFN_Vector1,id:5025,x:31674,y:34082,varname:node_5025,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Time,id:9795,x:31674,y:34287,varname:node_9795,prsc:2;n:type:ShaderForge.SFN_Multiply,id:2310,x:31880,y:34287,varname:node_2310,prsc:2|A-9795-T,B-3338-OUT,C-6767-OUT;n:type:ShaderForge.SFN_Vector1,id:3338,x:31674,y:34410,varname:node_3338,prsc:2,v1:-1;n:type:ShaderForge.SFN_Multiply,id:5759,x:32624,y:34283,varname:node_5759,prsc:2|A-4367-R,B-2184-A,C-6839-OUT;n:type:ShaderForge.SFN_Tex2d,id:2184,x:32253,y:34326,ptovrint:False,ptlb:node_2184,ptin:_node_2184,varname:node_2184,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:2e898954d93675641a5a5f306f97c759,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Vector3,id:6839,x:32253,y:34486,varname:node_6839,prsc:2,v1:0.8,v2:0.5,v3:0.2;n:type:ShaderForge.SFN_Vector1,id:6767,x:31674,y:34469,varname:node_6767,prsc:2,v1:0.4;proporder:7832-3934-1489-4367-2184;pass:END;sub:END;*/

Shader "Custom/La_shader1" {
    Properties {
        _la_kuijia ("la_kuijia", 2D) = "white" {}
        _la_baoshi1 ("la_baoshi1", 2D) = "white" {}
        _la_baoshi2 ("la_baoshi2", 2D) = "white" {}
        _node_4367 ("node_4367", 2D) = "white" {}
        _node_2184 ("node_2184", 2D) = "white" {}
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
            uniform sampler2D _la_kuijia; uniform float4 _la_kuijia_ST;
            uniform sampler2D _la_baoshi1; uniform float4 _la_baoshi1_ST;
            uniform sampler2D _la_baoshi2; uniform float4 _la_baoshi2_ST;
            uniform sampler2D _node_4367; uniform float4 _node_4367_ST;
            uniform sampler2D _node_2184; uniform float4 _node_2184_ST;
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
                float4 _la_kuijia_var = tex2D(_la_kuijia,TRANSFORM_TEX(i.uv0, _la_kuijia));
                float4 node_2196 = _Time + _TimeEditor;
                float node_6984 = abs(sin(node_2196.a));
                float4 _la_baoshi1_var = tex2D(_la_baoshi1,TRANSFORM_TEX(i.uv0, _la_baoshi1));
                float4 _la_baoshi2_var = tex2D(_la_baoshi2,TRANSFORM_TEX(i.uv0, _la_baoshi2));
                float4 node_9795 = _Time + _TimeEditor;
                float node_1264_ang = (node_9795.g*(-1.0)*0.4);
                float node_1264_spd = 1.0;
                float node_1264_cos = cos(node_1264_spd*node_1264_ang);
                float node_1264_sin = sin(node_1264_spd*node_1264_ang);
                float2 node_1264_piv = float2(0.5,0.5);
                float2 node_1264 = (mul((0.5*i.uv0)-node_1264_piv,float2x2( node_1264_cos, -node_1264_sin, node_1264_sin, node_1264_cos))+node_1264_piv);
                float4 _node_4367_var = tex2D(_node_4367,TRANSFORM_TEX(node_1264, _node_4367));
                float4 _node_2184_var = tex2D(_node_2184,TRANSFORM_TEX(i.uv0, _node_2184));
                float3 emissive = (pow((_la_kuijia_var.r*float3(0.5,0.3,0.1)*node_6984),1.1)+(_la_baoshi1_var.a*node_6984*float3(0.8,0.5,0.4))+(_la_baoshi2_var.a*node_6984*float3(0.3,0.4,0.2))+(_node_4367_var.r*_node_2184_var.a*float3(0.8,0.5,0.2)));
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
