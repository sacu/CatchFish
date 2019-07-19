// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:6167,x:33573,y:32408,varname:node_6167,prsc:2|emission-6657-OUT;n:type:ShaderForge.SFN_Add,id:2330,x:32926,y:32638,varname:node_2330,prsc:2|A-8061-R,B-3476-R,C-9786-R;n:type:ShaderForge.SFN_Tex2d,id:8061,x:32636,y:32512,ptovrint:False,ptlb:feng1,ptin:_feng1,varname:node_8061,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:fdf8778a78a935d45a8886925cbb9f2b,ntxv:0,isnm:False|UVIN-5238-UVOUT;n:type:ShaderForge.SFN_Rotator,id:5238,x:32454,y:32512,varname:node_5238,prsc:2|UVIN-4418-UVOUT,ANG-5110-OUT;n:type:ShaderForge.SFN_TexCoord,id:4418,x:31845,y:32646,varname:node_4418,prsc:2,uv:0;n:type:ShaderForge.SFN_ValueProperty,id:5110,x:32239,y:32620,ptovrint:False,ptlb:feng1_xz,ptin:_feng1_xz,varname:node_5110,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Tex2d,id:3476,x:32629,y:32762,ptovrint:False,ptlb:feng2,ptin:_feng2,varname:_feng2,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:fdf8778a78a935d45a8886925cbb9f2b,ntxv:0,isnm:False|UVIN-5923-UVOUT;n:type:ShaderForge.SFN_Rotator,id:5923,x:32454,y:32762,varname:node_5923,prsc:2|UVIN-4418-UVOUT,ANG-9095-OUT;n:type:ShaderForge.SFN_TexCoord,id:4957,x:32239,y:32701,varname:node_4957,prsc:2,uv:0;n:type:ShaderForge.SFN_ValueProperty,id:9095,x:32239,y:32875,ptovrint:False,ptlb:feng2_xz,ptin:_feng2_xz,varname:_feng1_xz_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Tex2d,id:9786,x:32629,y:33002,ptovrint:False,ptlb:feng3,ptin:_feng3,varname:_feng3,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:fdf8778a78a935d45a8886925cbb9f2b,ntxv:0,isnm:False|UVIN-8059-UVOUT;n:type:ShaderForge.SFN_Rotator,id:8059,x:32454,y:33002,varname:node_8059,prsc:2|UVIN-4418-UVOUT,ANG-8428-OUT;n:type:ShaderForge.SFN_TexCoord,id:9300,x:32239,y:32941,varname:node_9300,prsc:2,uv:0;n:type:ShaderForge.SFN_ValueProperty,id:8428,x:32239,y:33115,ptovrint:False,ptlb:feng3_xz,ptin:_feng3_xz,varname:_feng1_xz_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Multiply,id:6173,x:33150,y:32568,varname:node_6173,prsc:2|A-6375-OUT,B-2330-OUT;n:type:ShaderForge.SFN_Vector3,id:6375,x:32926,y:32524,varname:node_6375,prsc:2,v1:0,v2:0.25,v3:0.25;n:type:ShaderForge.SFN_Multiply,id:6657,x:33372,y:32508,varname:node_6657,prsc:2|A-2799-A,B-6173-OUT;n:type:ShaderForge.SFN_Tex2d,id:2799,x:33150,y:32389,ptovrint:False,ptlb:node_2799,ptin:_node_2799,varname:node_2799,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:65033e6c8d654ab45841d3f0b0d560ca,ntxv:0,isnm:False;proporder:8061-5110-3476-9095-9786-8428-2799;pass:END;sub:END;*/

Shader "Custom/Amon_shader1" {
    Properties {
        _feng1 ("feng1", 2D) = "white" {}
        _feng1_xz ("feng1_xz", Float ) = 0
        _feng2 ("feng2", 2D) = "white" {}
        _feng2_xz ("feng2_xz", Float ) = 0
        _feng3 ("feng3", 2D) = "white" {}
        _feng3_xz ("feng3_xz", Float ) = 0
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
            uniform sampler2D _feng1; uniform float4 _feng1_ST;
            uniform float _feng1_xz;
            uniform sampler2D _feng2; uniform float4 _feng2_ST;
            uniform float _feng2_xz;
            uniform sampler2D _feng3; uniform float4 _feng3_ST;
            uniform float _feng3_xz;
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
                float node_5238_ang = _feng1_xz;
                float node_5238_spd = 1.0;
                float node_5238_cos = cos(node_5238_spd*node_5238_ang);
                float node_5238_sin = sin(node_5238_spd*node_5238_ang);
                float2 node_5238_piv = float2(0.5,0.5);
                float2 node_5238 = (mul(i.uv0-node_5238_piv,float2x2( node_5238_cos, -node_5238_sin, node_5238_sin, node_5238_cos))+node_5238_piv);
                float4 _feng1_var = tex2D(_feng1,TRANSFORM_TEX(node_5238, _feng1));
                float node_5923_ang = _feng2_xz;
                float node_5923_spd = 1.0;
                float node_5923_cos = cos(node_5923_spd*node_5923_ang);
                float node_5923_sin = sin(node_5923_spd*node_5923_ang);
                float2 node_5923_piv = float2(0.5,0.5);
                float2 node_5923 = (mul(i.uv0-node_5923_piv,float2x2( node_5923_cos, -node_5923_sin, node_5923_sin, node_5923_cos))+node_5923_piv);
                float4 _feng2_var = tex2D(_feng2,TRANSFORM_TEX(node_5923, _feng2));
                float node_8059_ang = _feng3_xz;
                float node_8059_spd = 1.0;
                float node_8059_cos = cos(node_8059_spd*node_8059_ang);
                float node_8059_sin = sin(node_8059_spd*node_8059_ang);
                float2 node_8059_piv = float2(0.5,0.5);
                float2 node_8059 = (mul(i.uv0-node_8059_piv,float2x2( node_8059_cos, -node_8059_sin, node_8059_sin, node_8059_cos))+node_8059_piv);
                float4 _feng3_var = tex2D(_feng3,TRANSFORM_TEX(node_8059, _feng3));
                float3 emissive = (_node_2799_var.a*(float3(0,0.25,0.25)*(_feng1_var.r+_feng2_var.r+_feng3_var.r)));
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
