// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:6623,x:32900,y:33037,varname:node_6623,prsc:2|emission-2024-OUT;n:type:ShaderForge.SFN_Add,id:1096,x:32427,y:33120,varname:node_1096,prsc:2|A-7898-OUT,B-1997-OUT;n:type:ShaderForge.SFN_Tex2d,id:197,x:31349,y:32407,ptovrint:False,ptlb:lizi,ptin:_lizi,varname:node_197,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:4be441e3f46663742b7a4e7cd2bd6a71,ntxv:0,isnm:False|UVIN-4175-UVOUT;n:type:ShaderForge.SFN_Panner,id:4175,x:31134,y:32407,varname:node_4175,prsc:2,spu:0,spv:0.02|UVIN-3188-UVOUT,DIST-8903-R;n:type:ShaderForge.SFN_Multiply,id:7898,x:31967,y:32679,varname:node_7898,prsc:2|A-197-A,B-7532-OUT,C-4874-OUT,D-4946-OUT,E-5115-OUT;n:type:ShaderForge.SFN_Tex2d,id:8903,x:30924,y:32494,ptovrint:False,ptlb:lizi_rl,ptin:_lizi_rl,varname:node_8903,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:2bd3fc7fe7f590d4bb5517e0f6af270e,ntxv:0,isnm:False|UVIN-1998-UVOUT;n:type:ShaderForge.SFN_Panner,id:1998,x:30705,y:32494,varname:node_1998,prsc:2,spu:0.1,spv:0|UVIN-600-UVOUT;n:type:ShaderForge.SFN_Panner,id:3188,x:30924,y:32314,varname:node_3188,prsc:2,spu:0.2,spv:-0.3|UVIN-600-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:5893,x:31349,y:32666,ptovrint:False,ptlb:lizi_mask,ptin:_lizi_mask,varname:node_5893,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:c1b3f4784aa0c5d43a268fcdb8ddcb4d,ntxv:0,isnm:False|UVIN-2769-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:1250,x:31349,y:32915,ptovrint:False,ptlb:lizi_fanwei,ptin:_lizi_fanwei,varname:node_1250,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:7b5bbc85b14afe143aef88db58968e88,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Panner,id:2769,x:31134,y:32666,varname:node_2769,prsc:2,spu:0.1,spv:0.1|UVIN-600-UVOUT;n:type:ShaderForge.SFN_Power,id:7532,x:31553,y:32666,varname:node_7532,prsc:2|VAL-5893-R,EXP-2908-OUT;n:type:ShaderForge.SFN_Vector1,id:2908,x:31349,y:32821,varname:node_2908,prsc:2,v1:1.5;n:type:ShaderForge.SFN_Vector3,id:4946,x:31553,y:33018,varname:node_4946,prsc:2,v1:1,v2:0.3,v3:0;n:type:ShaderForge.SFN_Multiply,id:2024,x:32680,y:32998,varname:node_2024,prsc:2|A-8595-A,B-1096-OUT;n:type:ShaderForge.SFN_Tex2d,id:8595,x:32427,y:32881,ptovrint:False,ptlb:node_8595,ptin:_node_8595,varname:node_8595,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:65033e6c8d654ab45841d3f0b0d560ca,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Power,id:4874,x:31553,y:32869,varname:node_4874,prsc:2|VAL-1250-R,EXP-5932-OUT;n:type:ShaderForge.SFN_Vector1,id:5932,x:31553,y:32811,varname:node_5932,prsc:2,v1:1.5;n:type:ShaderForge.SFN_Tex2d,id:3961,x:31348,y:33289,ptovrint:False,ptlb:dian1,ptin:_dian1,varname:node_3961,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:63ff3200e46c18645bd41efcac6970bd,ntxv:0,isnm:False|UVIN-202-UVOUT;n:type:ShaderForge.SFN_Rotator,id:202,x:31160,y:33289,varname:node_202,prsc:2|UVIN-600-UVOUT,ANG-6033-OUT;n:type:ShaderForge.SFN_TexCoord,id:600,x:30236,y:33209,varname:node_600,prsc:2,uv:0;n:type:ShaderForge.SFN_ValueProperty,id:6033,x:30960,y:33462,ptovrint:False,ptlb:dian1_xz,ptin:_dian1_xz,varname:node_6033,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Multiply,id:8533,x:31642,y:33329,varname:node_8533,prsc:2|A-5891-OUT,B-3961-R,C-4238-OUT;n:type:ShaderForge.SFN_ValueProperty,id:5891,x:31348,y:33215,ptovrint:False,ptlb:dian1_ld,ptin:_dian1_ld,varname:node_5891,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Tex2d,id:9928,x:31348,y:33678,ptovrint:False,ptlb:dian2,ptin:_dian2,varname:node_9928,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:b56036af92a6c9c4cabe6a7ad48bae27,ntxv:0,isnm:False|UVIN-6007-UVOUT;n:type:ShaderForge.SFN_Multiply,id:9487,x:31643,y:33634,varname:node_9487,prsc:2|A-8056-OUT,B-9928-R,C-1245-OUT;n:type:ShaderForge.SFN_ValueProperty,id:8056,x:31348,y:33590,ptovrint:False,ptlb:dian2_ld,ptin:_dian2_ld,varname:node_8056,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_ValueProperty,id:6750,x:30958,y:33865,ptovrint:False,ptlb:dian2_xz,ptin:_dian2_xz,varname:node_6750,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Add,id:1997,x:31889,y:33595,varname:node_1997,prsc:2|A-8533-OUT,B-9487-OUT,C-7146-OUT;n:type:ShaderForge.SFN_Multiply,id:7146,x:31644,y:33943,varname:node_7146,prsc:2|A-6683-OUT,B-674-R,C-5986-OUT;n:type:ShaderForge.SFN_Tex2d,id:674,x:31348,y:34093,ptovrint:False,ptlb:dian3,ptin:_dian3,varname:node_674,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:63ff3200e46c18645bd41efcac6970bd,ntxv:0,isnm:False|UVIN-2729-UVOUT;n:type:ShaderForge.SFN_ValueProperty,id:6683,x:31348,y:34016,ptovrint:False,ptlb:dian3_ld,ptin:_dian3_ld,varname:node_6683,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_ValueProperty,id:2755,x:30957,y:34267,ptovrint:False,ptlb:dian3_xz,ptin:_dian3_xz,varname:node_2755,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Rotator,id:6007,x:31162,y:33678,varname:node_6007,prsc:2|UVIN-600-UVOUT,ANG-6750-OUT;n:type:ShaderForge.SFN_Rotator,id:2729,x:31158,y:34093,varname:node_2729,prsc:2|UVIN-600-UVOUT,ANG-2755-OUT;n:type:ShaderForge.SFN_Vector3,id:4238,x:31348,y:33458,varname:node_4238,prsc:2,v1:2,v2:0.2,v3:0;n:type:ShaderForge.SFN_Vector3,id:1245,x:31348,y:33855,varname:node_1245,prsc:2,v1:1,v2:0.3,v3:0;n:type:ShaderForge.SFN_Vector3,id:5986,x:31348,y:34256,varname:node_5986,prsc:2,v1:1.5,v2:0.2,v3:0;n:type:ShaderForge.SFN_Vector1,id:5115,x:31831,y:32913,varname:node_5115,prsc:2,v1:10;proporder:197-8903-5893-1250-8595-3961-5891-6033-9928-8056-6750-674-6683-2755;pass:END;sub:END;*/

Shader "Custom/Kronos_shader_2" {
    Properties {
        _lizi ("lizi", 2D) = "white" {}
        _lizi_rl ("lizi_rl", 2D) = "white" {}
        _lizi_mask ("lizi_mask", 2D) = "white" {}
        _lizi_fanwei ("lizi_fanwei", 2D) = "white" {}
        _node_8595 ("node_8595", 2D) = "white" {}
        _dian1 ("dian1", 2D) = "white" {}
        _dian1_ld ("dian1_ld", Float ) = 1
        _dian1_xz ("dian1_xz", Float ) = 0
        _dian2 ("dian2", 2D) = "white" {}
        _dian2_ld ("dian2_ld", Float ) = 1
        _dian2_xz ("dian2_xz", Float ) = 0
        _dian3 ("dian3", 2D) = "white" {}
        _dian3_ld ("dian3_ld", Float ) = 1
        _dian3_xz ("dian3_xz", Float ) = 0
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
            uniform sampler2D _lizi; uniform float4 _lizi_ST;
            uniform sampler2D _lizi_rl; uniform float4 _lizi_rl_ST;
            uniform sampler2D _lizi_mask; uniform float4 _lizi_mask_ST;
            uniform sampler2D _lizi_fanwei; uniform float4 _lizi_fanwei_ST;
            uniform sampler2D _node_8595; uniform float4 _node_8595_ST;
            uniform sampler2D _dian1; uniform float4 _dian1_ST;
            uniform float _dian1_xz;
            uniform float _dian1_ld;
            uniform sampler2D _dian2; uniform float4 _dian2_ST;
            uniform float _dian2_ld;
            uniform float _dian2_xz;
            uniform sampler2D _dian3; uniform float4 _dian3_ST;
            uniform float _dian3_ld;
            uniform float _dian3_xz;
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
                float4 node_6791 = _Time + _TimeEditor;
                float2 node_1998 = (i.uv0+node_6791.g*float2(0.1,0));
                float4 _lizi_rl_var = tex2D(_lizi_rl,TRANSFORM_TEX(node_1998, _lizi_rl));
                float2 node_4175 = ((i.uv0+node_6791.g*float2(0.2,-0.3))+_lizi_rl_var.r*float2(0,0.02));
                float4 _lizi_var = tex2D(_lizi,TRANSFORM_TEX(node_4175, _lizi));
                float2 node_2769 = (i.uv0+node_6791.g*float2(0.1,0.1));
                float4 _lizi_mask_var = tex2D(_lizi_mask,TRANSFORM_TEX(node_2769, _lizi_mask));
                float4 _lizi_fanwei_var = tex2D(_lizi_fanwei,TRANSFORM_TEX(i.uv0, _lizi_fanwei));
                float node_202_ang = _dian1_xz;
                float node_202_spd = 1.0;
                float node_202_cos = cos(node_202_spd*node_202_ang);
                float node_202_sin = sin(node_202_spd*node_202_ang);
                float2 node_202_piv = float2(0.5,0.5);
                float2 node_202 = (mul(i.uv0-node_202_piv,float2x2( node_202_cos, -node_202_sin, node_202_sin, node_202_cos))+node_202_piv);
                float4 _dian1_var = tex2D(_dian1,TRANSFORM_TEX(node_202, _dian1));
                float node_6007_ang = _dian2_xz;
                float node_6007_spd = 1.0;
                float node_6007_cos = cos(node_6007_spd*node_6007_ang);
                float node_6007_sin = sin(node_6007_spd*node_6007_ang);
                float2 node_6007_piv = float2(0.5,0.5);
                float2 node_6007 = (mul(i.uv0-node_6007_piv,float2x2( node_6007_cos, -node_6007_sin, node_6007_sin, node_6007_cos))+node_6007_piv);
                float4 _dian2_var = tex2D(_dian2,TRANSFORM_TEX(node_6007, _dian2));
                float node_2729_ang = _dian3_xz;
                float node_2729_spd = 1.0;
                float node_2729_cos = cos(node_2729_spd*node_2729_ang);
                float node_2729_sin = sin(node_2729_spd*node_2729_ang);
                float2 node_2729_piv = float2(0.5,0.5);
                float2 node_2729 = (mul(i.uv0-node_2729_piv,float2x2( node_2729_cos, -node_2729_sin, node_2729_sin, node_2729_cos))+node_2729_piv);
                float4 _dian3_var = tex2D(_dian3,TRANSFORM_TEX(node_2729, _dian3));
                float3 emissive = (_node_8595_var.a*((_lizi_var.a*pow(_lizi_mask_var.r,1.5)*pow(_lizi_fanwei_var.r,1.5)*float3(1,0.3,0)*10.0)+((_dian1_ld*_dian1_var.r*float3(2,0.2,0))+(_dian2_ld*_dian2_var.r*float3(1,0.3,0))+(_dian3_ld*_dian3_var.r*float3(1.5,0.2,0)))));
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
