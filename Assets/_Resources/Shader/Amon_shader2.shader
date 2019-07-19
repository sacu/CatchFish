// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:6167,x:33295,y:31901,varname:node_6167,prsc:2|emission-6657-OUT;n:type:ShaderForge.SFN_Tex2d,id:5330,x:32076,y:32195,ptovrint:False,ptlb:node_5330,ptin:_node_5330,varname:node_5330,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:72ccafe50ff03894492b5f306de41e63,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:3817,x:31524,y:31549,ptovrint:False,ptlb:node_3817,ptin:_node_3817,varname:node_3817,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:89bfa9aea346d1b4d94e7d17f78475a4,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:9546,x:32304,y:32346,varname:node_9546,prsc:2|A-5330-RGB,B-9902-OUT,C-504-OUT;n:type:ShaderForge.SFN_Vector3,id:7830,x:31743,y:31863,varname:node_7830,prsc:2,v1:1.2,v2:0.5,v3:0;n:type:ShaderForge.SFN_Multiply,id:1081,x:32025,y:31861,varname:node_1081,prsc:2|A-216-OUT,B-7830-OUT,C-301-OUT,D-5851-OUT;n:type:ShaderForge.SFN_Tex2d,id:6261,x:31524,y:31929,ptovrint:False,ptlb:node_6261,ptin:_node_6261,varname:node_6261,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:ca2b5f0d84019fb409387ae0c392c05f,ntxv:0,isnm:False|UVIN-6494-UVOUT;n:type:ShaderForge.SFN_Power,id:301,x:31743,y:31960,varname:node_301,prsc:2|VAL-6261-R,EXP-6961-OUT;n:type:ShaderForge.SFN_Vector1,id:6961,x:31524,y:32090,varname:node_6961,prsc:2,v1:1.2;n:type:ShaderForge.SFN_Panner,id:6494,x:31331,y:31929,varname:node_6494,prsc:2,spu:0,spv:0.1|UVIN-3120-UVOUT,DIST-6183-R;n:type:ShaderForge.SFN_Tex2d,id:6183,x:31122,y:32012,ptovrint:False,ptlb:node_6183,ptin:_node_6183,varname:node_6183,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:2bd3fc7fe7f590d4bb5517e0f6af270e,ntxv:0,isnm:False|UVIN-5202-UVOUT;n:type:ShaderForge.SFN_Panner,id:3120,x:31122,y:31839,varname:node_3120,prsc:2,spu:0,spv:-0.03|UVIN-4418-UVOUT;n:type:ShaderForge.SFN_Panner,id:5202,x:30920,y:32012,varname:node_5202,prsc:2,spu:0,spv:-0.08|UVIN-4418-UVOUT;n:type:ShaderForge.SFN_Vector3,id:9902,x:32076,y:32364,varname:node_9902,prsc:2,v1:1,v2:0.3,v3:0;n:type:ShaderForge.SFN_Add,id:1041,x:32754,y:32117,varname:node_1041,prsc:2|A-1081-OUT,B-9546-OUT;n:type:ShaderForge.SFN_Sin,id:20,x:31727,y:32489,varname:node_20,prsc:2|IN-7790-TTR;n:type:ShaderForge.SFN_Time,id:7790,x:31549,y:32489,varname:node_7790,prsc:2;n:type:ShaderForge.SFN_Multiply,id:3321,x:31906,y:32489,varname:node_3321,prsc:2|A-20-OUT,B-1276-OUT;n:type:ShaderForge.SFN_Vector1,id:1276,x:31727,y:32615,varname:node_1276,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Add,id:504,x:32076,y:32489,varname:node_504,prsc:2|A-3321-OUT,B-633-OUT;n:type:ShaderForge.SFN_Vector1,id:633,x:31906,y:32615,varname:node_633,prsc:2,v1:0.6;n:type:ShaderForge.SFN_ValueProperty,id:5851,x:31743,y:32115,ptovrint:False,ptlb:liangdu,ptin:_liangdu,varname:node_5851,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:216,x:31743,y:31672,varname:node_216,prsc:2|A-3817-R,B-3347-OUT;n:type:ShaderForge.SFN_Tex2d,id:7656,x:31331,y:31644,ptovrint:False,ptlb:node_7656,ptin:_node_7656,varname:node_7656,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:e050378c747b7a347a0220f936660d2e,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Power,id:3347,x:31524,y:31740,varname:node_3347,prsc:2|VAL-7656-R,EXP-7389-OUT;n:type:ShaderForge.SFN_Vector1,id:7389,x:31331,y:31822,varname:node_7389,prsc:2,v1:0.6;n:type:ShaderForge.SFN_TexCoord,id:4418,x:30691,y:31831,varname:node_4418,prsc:2,uv:0;n:type:ShaderForge.SFN_Multiply,id:6657,x:33012,y:32036,varname:node_6657,prsc:2|A-2799-A,B-1041-OUT;n:type:ShaderForge.SFN_Tex2d,id:2799,x:32754,y:31911,ptovrint:False,ptlb:node_2799,ptin:_node_2799,varname:node_2799,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:65033e6c8d654ab45841d3f0b0d560ca,ntxv:0,isnm:False;proporder:5330-3817-6261-6183-7656-5851-2799;pass:END;sub:END;*/

Shader "Custom/Amon_shader2" {
    Properties {
        _node_5330 ("node_5330", 2D) = "white" {}
        _node_3817 ("node_3817", 2D) = "white" {}
        _node_6261 ("node_6261", 2D) = "white" {}
        _node_6183 ("node_6183", 2D) = "white" {}
        _node_7656 ("node_7656", 2D) = "white" {}
        _liangdu ("liangdu", Float ) = 1
        _node_2799 ("node_2799", 2D) = "white" {}
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
            uniform sampler2D _node_5330; uniform float4 _node_5330_ST;
            uniform sampler2D _node_3817; uniform float4 _node_3817_ST;
            uniform sampler2D _node_6261; uniform float4 _node_6261_ST;
            uniform sampler2D _node_6183; uniform float4 _node_6183_ST;
            uniform float _liangdu;
            uniform sampler2D _node_7656; uniform float4 _node_7656_ST;
            uniform sampler2D _node_2799; uniform float4 _node_2799_ST;
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
                float4 _node_2799_var = tex2D(_node_2799,TRANSFORM_TEX(i.uv0, _node_2799));
                float4 _node_3817_var = tex2D(_node_3817,TRANSFORM_TEX(i.uv0, _node_3817));
                float4 _node_7656_var = tex2D(_node_7656,TRANSFORM_TEX(i.uv0, _node_7656));
                float4 node_7377 = _Time + _TimeEditor;
                float2 node_5202 = (i.uv0+node_7377.g*float2(0,-0.08));
                float4 _node_6183_var = tex2D(_node_6183,TRANSFORM_TEX(node_5202, _node_6183));
                float2 node_6494 = ((i.uv0+node_7377.g*float2(0,-0.03))+_node_6183_var.r*float2(0,0.1));
                float4 _node_6261_var = tex2D(_node_6261,TRANSFORM_TEX(node_6494, _node_6261));
                float4 _node_5330_var = tex2D(_node_5330,TRANSFORM_TEX(i.uv0, _node_5330));
                float4 node_7790 = _Time + _TimeEditor;
                float3 emissive = (_node_2799_var.a*(((_node_3817_var.r*pow(_node_7656_var.r,0.6))*float3(1.2,0.5,0)*pow(_node_6261_var.r,1.2)*_liangdu)+(_node_5330_var.rgb*float3(1,0.3,0)*((sin(node_7790.a)*0.5)+0.6))));
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
