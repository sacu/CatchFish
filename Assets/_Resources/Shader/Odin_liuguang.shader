// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:32719,y:32712,varname:node_3138,prsc:2|emission-6650-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:31722,y:32367,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_7241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:2,c2:2,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2d,id:1751,x:31890,y:32529,ptovrint:False,ptlb:odin_light_mask,ptin:_odin_light_mask,varname:node_1751,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:c27c494c69d2bfc4baa820205c013d67,ntxv:0,isnm:False|UVIN-2651-OUT;n:type:ShaderForge.SFN_Multiply,id:5356,x:32090,y:32676,varname:node_5356,prsc:2|A-742-RGB,B-1751-RGB,C-7241-RGB;n:type:ShaderForge.SFN_Tex2d,id:742,x:31722,y:32166,ptovrint:False,ptlb:idin_fog,ptin:_idin_fog,varname:node_742,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:af7f129efe55b714bb08434496f4ae9e,ntxv:0,isnm:False|UVIN-9670-UVOUT;n:type:ShaderForge.SFN_Panner,id:9670,x:31428,y:32166,varname:node_9670,prsc:2,spu:-0.2,spv:0.1|UVIN-1302-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:1302,x:30874,y:32895,varname:node_1302,prsc:2,uv:0;n:type:ShaderForge.SFN_Add,id:2651,x:31722,y:32529,varname:node_2651,prsc:2|A-8279-OUT,B-1302-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:359,x:31369,y:32311,ptovrint:False,ptlb:odin_light_tex,ptin:_odin_light_tex,varname:node_359,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False|UVIN-3945-UVOUT;n:type:ShaderForge.SFN_Panner,id:3945,x:31198,y:32311,varname:node_3945,prsc:2,spu:0.02,spv:0.1|UVIN-1302-UVOUT;n:type:ShaderForge.SFN_Slider,id:3014,x:31212,y:32505,ptovrint:False,ptlb:raoluan_power,ptin:_raoluan_power,varname:node_3014,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Multiply,id:8279,x:31556,y:32436,varname:node_8279,prsc:2|A-359-R,B-3014-OUT;n:type:ShaderForge.SFN_Multiply,id:2407,x:31898,y:32967,varname:node_2407,prsc:2|A-3567-OUT,B-1442-RGB,C-9244-RGB;n:type:ShaderForge.SFN_Slider,id:3567,x:31456,y:32836,ptovrint:False,ptlb:liuguang_power,ptin:_liuguang_power,varname:node_3567,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.6,max:4;n:type:ShaderForge.SFN_Tex2d,id:1442,x:31556,y:32970,ptovrint:False,ptlb:liuguang_mask,ptin:_liuguang_mask,varname:node_1442,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:723c0675ae0367d4ab140a4e7f116a07,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Panner,id:1335,x:32822,y:34951,varname:node_1335,prsc:2,spu:0.2,spv:0.2|UVIN-3454-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:3454,x:32628,y:34951,varname:node_3454,prsc:2,uv:0;n:type:ShaderForge.SFN_Panner,id:7948,x:32886,y:35015,varname:node_7948,prsc:2,spu:0.2,spv:0.2|UVIN-67-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:67,x:32692,y:35015,varname:node_67,prsc:2,uv:0;n:type:ShaderForge.SFN_Tex2d,id:9244,x:31534,y:33197,ptovrint:False,ptlb:liuguang_caizhi,ptin:_liuguang_caizhi,varname:node_9244,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:474bbb53c85dc7e48ae334433d270a64,ntxv:0,isnm:False|UVIN-7801-UVOUT;n:type:ShaderForge.SFN_Panner,id:9865,x:32950,y:35079,varname:node_9865,prsc:2,spu:0.2,spv:0.2|UVIN-4671-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:4671,x:32756,y:35079,varname:node_4671,prsc:2,uv:0;n:type:ShaderForge.SFN_Panner,id:7801,x:31348,y:33197,varname:node_7801,prsc:2,spu:0,spv:-0.3|UVIN-1302-UVOUT;n:type:ShaderForge.SFN_Add,id:6650,x:32256,y:32885,varname:node_6650,prsc:2|A-5356-OUT,B-2407-OUT;proporder:7241-1751-742-359-3014-3567-1442-9244;pass:END;sub:END;*/

Shader "Shader Forge/Odin_liuguang" {
    Properties {
        _Color ("Color", Color) = (2,2,1,1)
        _odin_light_mask ("odin_light_mask", 2D) = "white" {}
        _idin_fog ("idin_fog", 2D) = "white" {}
        _odin_light_tex ("odin_light_tex", 2D) = "white" {}
        _raoluan_power ("raoluan_power", Range(0, 1)) = 0
        _liuguang_power ("liuguang_power", Range(0, 4)) = 0.6
        _liuguang_mask ("liuguang_mask", 2D) = "white" {}
        _liuguang_caizhi ("liuguang_caizhi", 2D) = "white" {}
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
            Blend One One
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma exclude_renderers gles2 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 2.0
            uniform float4 _TimeEditor;
            uniform float4 _Color;
            uniform sampler2D _odin_light_mask; uniform float4 _odin_light_mask_ST;
            uniform sampler2D _idin_fog; uniform float4 _idin_fog_ST;
            uniform sampler2D _odin_light_tex; uniform float4 _odin_light_tex_ST;
            uniform float _raoluan_power;
            uniform float _liuguang_power;
            uniform sampler2D _liuguang_mask; uniform float4 _liuguang_mask_ST;
            uniform sampler2D _liuguang_caizhi; uniform float4 _liuguang_caizhi_ST;
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
////// Lighting:
////// Emissive:
                float4 node_8925 = _Time + _TimeEditor;
                float2 node_9670 = (i.uv0+node_8925.g*float2(-0.2,0.1));
                float4 _idin_fog_var = tex2D(_idin_fog,TRANSFORM_TEX(node_9670, _idin_fog));
                float2 node_3945 = (i.uv0+node_8925.g*float2(0.02,0.1));
                float4 _odin_light_tex_var = tex2D(_odin_light_tex,TRANSFORM_TEX(node_3945, _odin_light_tex));
                float2 node_2651 = ((_odin_light_tex_var.r*_raoluan_power)+i.uv0);
                float4 _odin_light_mask_var = tex2D(_odin_light_mask,TRANSFORM_TEX(node_2651, _odin_light_mask));
                float4 _liuguang_mask_var = tex2D(_liuguang_mask,TRANSFORM_TEX(i.uv0, _liuguang_mask));
                float2 node_7801 = (i.uv0+node_8925.g*float2(0,-0.3));
                float4 _liuguang_caizhi_var = tex2D(_liuguang_caizhi,TRANSFORM_TEX(node_7801, _liuguang_caizhi));
                float3 emissive = ((_idin_fog_var.rgb*_odin_light_mask_var.rgb*_Color.rgb)+(_liuguang_power*_liuguang_mask_var.rgb*_liuguang_caizhi_var.rgb));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
