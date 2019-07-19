// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:2,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:33626,y:33756,varname:node_3138,prsc:2|emission-2977-OUT;n:type:ShaderForge.SFN_Tex2d,id:6020,x:32288,y:33128,ptovrint:False,ptlb:eye_fire_mask2,ptin:_eye_fire_mask2,varname:node_6020,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:323881aed7d272641a5deafee87c29f3,ntxv:0,isnm:False|UVIN-1022-OUT;n:type:ShaderForge.SFN_Tex2d,id:2268,x:31662,y:33215,ptovrint:False,ptlb:node_2268,ptin:_node_2268,varname:node_2268,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:94a1414d81ebc8e40aa4c628ea02048a,ntxv:0,isnm:False|UVIN-2492-UVOUT;n:type:ShaderForge.SFN_Panner,id:2492,x:31477,y:33215,varname:node_2492,prsc:2,spu:-0.3,spv:-0.3|UVIN-2804-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:2804,x:30670,y:33820,varname:node_2804,prsc:2,uv:0;n:type:ShaderForge.SFN_Multiply,id:3085,x:32455,y:33254,varname:node_3085,prsc:2|A-6020-RGB,B-118-OUT;n:type:ShaderForge.SFN_Add,id:1022,x:32120,y:33128,varname:node_1022,prsc:2|A-2804-UVOUT,B-8984-OUT;n:type:ShaderForge.SFN_Tex2d,id:8353,x:31939,y:33376,ptovrint:False,ptlb:eye_fire_mask1,ptin:_eye_fire_mask1,varname:node_8353,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:323881aed7d272641a5deafee87c29f3,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Vector1,id:4275,x:31662,y:33389,varname:node_4275,prsc:2,v1:4;n:type:ShaderForge.SFN_Multiply,id:8984,x:31939,y:33223,varname:node_8984,prsc:2|A-2268-R,B-8353-R,C-4275-OUT;n:type:ShaderForge.SFN_Tex2d,id:7362,x:32137,y:33396,ptovrint:False,ptlb:eye_mask,ptin:_eye_mask,varname:node_7362,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:badaa3334ead53b4f90126476a039d0e,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:5232,x:32455,y:33404,varname:node_5232,prsc:2|A-7362-RGB,B-118-OUT;n:type:ShaderForge.SFN_Vector3,id:118,x:31788,y:33984,varname:node_118,prsc:2,v1:1.6,v2:1,v3:2;n:type:ShaderForge.SFN_Add,id:7257,x:32655,y:33254,varname:node_7257,prsc:2|A-3085-OUT,B-5232-OUT;n:type:ShaderForge.SFN_Tex2d,id:7747,x:32291,y:33694,ptovrint:False,ptlb:glow_dark,ptin:_glow_dark,varname:node_7747,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:1289a8d510dd0894fa8c3e30833a945f,ntxv:0,isnm:False|UVIN-2804-UVOUT;n:type:ShaderForge.SFN_Add,id:3585,x:32940,y:33885,varname:node_3585,prsc:2|A-8868-OUT,B-2375-OUT;n:type:ShaderForge.SFN_Tex2d,id:7144,x:32291,y:34064,ptovrint:False,ptlb:xian,ptin:_xian,varname:node_7144,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:77a7dfdec01d1b24fa95a5bf73d6466e,ntxv:0,isnm:False|UVIN-2804-UVOUT;n:type:ShaderForge.SFN_Multiply,id:2375,x:32640,y:34063,varname:node_2375,prsc:2|A-7144-RGB,B-2409-RGB;n:type:ShaderForge.SFN_Color,id:2409,x:32291,y:33884,ptovrint:False,ptlb:color2,ptin:_color2,varname:node_2409,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.6284992,c2:0.2720588,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:8868,x:32651,y:33676,varname:node_8868,prsc:2|A-2409-RGB,B-7747-RGB;n:type:ShaderForge.SFN_Add,id:742,x:33193,y:33866,varname:node_742,prsc:2|A-7257-OUT,B-3585-OUT,C-6985-OUT;n:type:ShaderForge.SFN_Tex2d,id:1500,x:32599,y:34408,ptovrint:False,ptlb:lizi3,ptin:_lizi3,varname:node_1500,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:474bbb53c85dc7e48ae334433d270a64,ntxv:0,isnm:False|UVIN-4712-OUT;n:type:ShaderForge.SFN_Panner,id:9473,x:31807,y:34630,varname:node_9473,prsc:2,spu:0.1,spv:-0.1|UVIN-2804-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:2788,x:32599,y:34630,ptovrint:False,ptlb:lizi_mask,ptin:_lizi_mask,varname:node_2788,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:14339020d3001ed4eb6328d0023c14a4,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:8107,x:31996,y:34630,ptovrint:False,ptlb:raoluan2,ptin:_raoluan2,varname:node_8107,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:94a1414d81ebc8e40aa4c628ea02048a,ntxv:0,isnm:False|UVIN-9473-UVOUT;n:type:ShaderForge.SFN_Add,id:4588,x:32181,y:34630,varname:node_4588,prsc:2|A-2804-UVOUT,B-8107-B;n:type:ShaderForge.SFN_Vector1,id:2608,x:32419,y:34547,varname:node_2608,prsc:2,v1:0.3;n:type:ShaderForge.SFN_Panner,id:138,x:32214,y:34408,varname:node_138,prsc:2,spu:0.2,spv:-0.1|UVIN-2804-UVOUT;n:type:ShaderForge.SFN_Multiply,id:6985,x:32793,y:34527,varname:node_6985,prsc:2|A-1500-R,B-2788-RGB,C-118-OUT;n:type:ShaderForge.SFN_Add,id:4712,x:32419,y:34408,varname:node_4712,prsc:2|A-138-UVOUT,B-4588-OUT,C-2608-OUT;n:type:ShaderForge.SFN_Multiply,id:2977,x:33425,y:33911,varname:node_2977,prsc:2|A-742-OUT,B-441-RGB,C-4772-OUT;n:type:ShaderForge.SFN_VertexColor,id:441,x:33000,y:34072,varname:node_441,prsc:2;n:type:ShaderForge.SFN_ValueProperty,id:4772,x:33193,y:34177,ptovrint:False,ptlb:alpha_dark,ptin:_alpha_dark,varname:node_4772,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;proporder:6020-2268-8353-7362-7747-7144-2409-1500-2788-8107-4772;pass:END;sub:END;*/

Shader "Shader Forge/Chris_dark" {
    Properties {
        _eye_fire_mask2 ("eye_fire_mask2", 2D) = "white" {}
        _node_2268 ("node_2268", 2D) = "white" {}
        _eye_fire_mask1 ("eye_fire_mask1", 2D) = "white" {}
        _eye_mask ("eye_mask", 2D) = "white" {}
        _glow_dark ("glow_dark", 2D) = "white" {}
        _xian ("xian", 2D) = "white" {}
        _color2 ("color2", Color) = (0.6284992,0.2720588,1,1)
        _lizi3 ("lizi3", 2D) = "white" {}
        _lizi_mask ("lizi_mask", 2D) = "white" {}
        _raoluan2 ("raoluan2", 2D) = "white" {}
        _alpha_dark ("alpha_dark", Float ) = 1
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
            uniform sampler2D _eye_fire_mask2; uniform float4 _eye_fire_mask2_ST;
            uniform sampler2D _node_2268; uniform float4 _node_2268_ST;
            uniform sampler2D _eye_fire_mask1; uniform float4 _eye_fire_mask1_ST;
            uniform sampler2D _eye_mask; uniform float4 _eye_mask_ST;
            uniform sampler2D _glow_dark; uniform float4 _glow_dark_ST;
            uniform sampler2D _xian; uniform float4 _xian_ST;
            uniform float4 _color2;
            uniform sampler2D _lizi3; uniform float4 _lizi3_ST;
            uniform sampler2D _lizi_mask; uniform float4 _lizi_mask_ST;
            uniform sampler2D _raoluan2; uniform float4 _raoluan2_ST;
            uniform float _alpha_dark;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.pos = UnityObjectToClipPos(v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float4 node_320 = _Time + _TimeEditor;
                float2 node_2492 = (i.uv0+node_320.g*float2(-0.3,-0.3));
                float4 _node_2268_var = tex2D(_node_2268,TRANSFORM_TEX(node_2492, _node_2268));
                float4 _eye_fire_mask1_var = tex2D(_eye_fire_mask1,TRANSFORM_TEX(i.uv0, _eye_fire_mask1));
                float2 node_1022 = (i.uv0+(_node_2268_var.r*_eye_fire_mask1_var.r*4.0));
                float4 _eye_fire_mask2_var = tex2D(_eye_fire_mask2,TRANSFORM_TEX(node_1022, _eye_fire_mask2));
                float3 node_118 = float3(1.6,1,2);
                float4 _eye_mask_var = tex2D(_eye_mask,TRANSFORM_TEX(i.uv0, _eye_mask));
                float4 _glow_dark_var = tex2D(_glow_dark,TRANSFORM_TEX(i.uv0, _glow_dark));
                float4 _xian_var = tex2D(_xian,TRANSFORM_TEX(i.uv0, _xian));
                float2 node_9473 = (i.uv0+node_320.g*float2(0.1,-0.1));
                float4 _raoluan2_var = tex2D(_raoluan2,TRANSFORM_TEX(node_9473, _raoluan2));
                float2 node_4712 = ((i.uv0+node_320.g*float2(0.2,-0.1))+(i.uv0+_raoluan2_var.b)+0.3);
                float4 _lizi3_var = tex2D(_lizi3,TRANSFORM_TEX(node_4712, _lizi3));
                float4 _lizi_mask_var = tex2D(_lizi_mask,TRANSFORM_TEX(i.uv0, _lizi_mask));
                float3 emissive = ((((_eye_fire_mask2_var.rgb*node_118)+(_eye_mask_var.rgb*node_118))+((_color2.rgb*_glow_dark_var.rgb)+(_xian_var.rgb*_color2.rgb))+(_lizi3_var.r*_lizi_mask_var.rgb*node_118))*i.vertexColor.rgb*_alpha_dark);
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
