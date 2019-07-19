// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:33427,y:32762,varname:node_3138,prsc:2|emission-4863-OUT;n:type:ShaderForge.SFN_Tex2d,id:9630,x:32254,y:33099,ptovrint:False,ptlb:sun1,ptin:_sun1,varname:node_9630,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:44e4cca5fe51a92449c639073cf07f38,ntxv:0,isnm:False|UVIN-818-UVOUT;n:type:ShaderForge.SFN_Rotator,id:818,x:32062,y:33099,varname:node_818,prsc:2|UVIN-386-UVOUT,ANG-518-OUT;n:type:ShaderForge.SFN_TexCoord,id:386,x:30310,y:33079,varname:node_386,prsc:2,uv:0;n:type:ShaderForge.SFN_Slider,id:518,x:31743,y:33137,ptovrint:False,ptlb:ang_1,ptin:_ang_1,varname:node_518,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-1,cur:-0.1031922,max:1;n:type:ShaderForge.SFN_Tex2d,id:9298,x:31792,y:32531,ptovrint:False,ptlb:lizi1,ptin:_lizi1,varname:node_9298,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:3c4e5d9e1d69ac049803c9f1b7a25142,ntxv:0,isnm:False|UVIN-6857-UVOUT;n:type:ShaderForge.SFN_Panner,id:6857,x:31495,y:32531,varname:node_6857,prsc:2,spu:0.03,spv:-0.02|UVIN-386-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:2332,x:31792,y:32726,ptovrint:False,ptlb:lizi2,ptin:_lizi2,varname:node_2332,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:1a10807a6549a484587ee0dd7c8829fc,ntxv:0,isnm:False|UVIN-779-UVOUT;n:type:ShaderForge.SFN_Panner,id:779,x:31495,y:32730,varname:node_779,prsc:2,spu:0.07,spv:-0.06|UVIN-386-UVOUT;n:type:ShaderForge.SFN_Multiply,id:9905,x:32066,y:32397,varname:node_9905,prsc:2|A-9930-RGB,B-9298-RGB;n:type:ShaderForge.SFN_Tex2d,id:9930,x:31792,y:32333,ptovrint:False,ptlb:Chris_lizi_mask,ptin:_Chris_lizi_mask,varname:node_9930,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:2aa1e1154a214a14c9d5c63e1376682e,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Add,id:1396,x:32314,y:32397,varname:node_1396,prsc:2|A-9905-OUT,B-2332-RGB;n:type:ShaderForge.SFN_Add,id:3716,x:33079,y:32900,varname:node_3716,prsc:2|A-223-OUT,B-1401-OUT,C-3908-OUT,D-4837-OUT,E-3355-OUT;n:type:ShaderForge.SFN_Multiply,id:223,x:32745,y:32587,varname:node_223,prsc:2|A-3030-RGB,B-1396-OUT;n:type:ShaderForge.SFN_Color,id:3030,x:32314,y:32771,ptovrint:False,ptlb:sun_color,ptin:_sun_color,varname:node_3030,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.9801217,c3:0.2794118,c4:1;n:type:ShaderForge.SFN_Multiply,id:1401,x:32745,y:32732,varname:node_1401,prsc:2|A-3882-RGB,B-6929-RGB,C-3030-RGB;n:type:ShaderForge.SFN_Slider,id:4713,x:31744,y:32998,ptovrint:False,ptlb:ang_2,ptin:_ang_2,varname:_ang_2,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-1,cur:-0.2912264,max:1;n:type:ShaderForge.SFN_Rotator,id:8598,x:32062,y:32956,varname:node_8598,prsc:2|UVIN-386-UVOUT,ANG-4713-OUT;n:type:ShaderForge.SFN_Tex2d,id:6929,x:32254,y:32956,ptovrint:False,ptlb:node_6929,ptin:_node_6929,varname:node_6929,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:a14462002e8c29941b1a75151c12c263,ntxv:0,isnm:False|UVIN-8598-UVOUT;n:type:ShaderForge.SFN_Multiply,id:3908,x:32745,y:32947,varname:node_3908,prsc:2|A-9630-RGB,B-8162-RGB,C-3030-RGB;n:type:ShaderForge.SFN_Color,id:8162,x:32528,y:33117,ptovrint:False,ptlb:sun1_alpha,ptin:_sun1_alpha,varname:node_8162,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Color,id:3882,x:32314,y:32554,ptovrint:False,ptlb:sun2_alpha,ptin:_sun2_alpha,varname:_sun1_alpha_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2d,id:9594,x:31822,y:33309,ptovrint:False,ptlb:glow,ptin:_glow,varname:node_9594,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:1289a8d510dd0894fa8c3e30833a945f,ntxv:0,isnm:False|UVIN-386-UVOUT;n:type:ShaderForge.SFN_Multiply,id:4837,x:32042,y:33374,varname:node_4837,prsc:2|A-9594-RGB,B-8833-RGB;n:type:ShaderForge.SFN_Color,id:8833,x:31794,y:33484,ptovrint:False,ptlb:sun3_alpha,ptin:_sun3_alpha,varname:node_8833,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Tex2d,id:6075,x:32020,y:34003,ptovrint:False,ptlb:liuguang_mask,ptin:_liuguang_mask,varname:node_6075,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:8b546993fcbcffb448c8f73e109dee2b,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Panner,id:4516,x:31667,y:33719,varname:node_4516,prsc:2,spu:0.2,spv:0.4|UVIN-386-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:3152,x:31853,y:33719,ptovrint:False,ptlb:liuguang,ptin:_liuguang,varname:node_3152,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:474bbb53c85dc7e48ae334433d270a64,ntxv:0,isnm:False|UVIN-4516-UVOUT;n:type:ShaderForge.SFN_Multiply,id:3355,x:32271,y:33948,varname:node_3355,prsc:2|A-736-OUT,B-6075-RGB;n:type:ShaderForge.SFN_Multiply,id:736,x:32147,y:33792,varname:node_736,prsc:2|A-3152-RGB,B-3030-RGB;n:type:ShaderForge.SFN_VertexColor,id:4539,x:33079,y:32775,varname:node_4539,prsc:2;n:type:ShaderForge.SFN_Multiply,id:4863,x:33253,y:32860,varname:node_4863,prsc:2|A-4539-RGB,B-7972-OUT,C-3716-OUT;n:type:ShaderForge.SFN_ValueProperty,id:7972,x:33253,y:32996,ptovrint:False,ptlb:alpha_sun,ptin:_alpha_sun,varname:node_7972,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;proporder:9298-2332-9930-9630-518-3030-4713-6929-3882-8162-9594-8833-6075-3152-7972;pass:END;sub:END;*/

Shader "Shader Forge/Chris_sun" {
    Properties {
        _lizi1 ("lizi1", 2D) = "white" {}
        _lizi2 ("lizi2", 2D) = "white" {}
        _Chris_lizi_mask ("Chris_lizi_mask", 2D) = "white" {}
        _sun1 ("sun1", 2D) = "white" {}
        _ang_1 ("ang_1", Range(-1, 1)) = -0.1031922
        _sun_color ("sun_color", Color) = (1,0.9801217,0.2794118,1)
        _ang_2 ("ang_2", Range(-1, 1)) = -0.2912264
        _node_6929 ("node_6929", 2D) = "white" {}
        _sun2_alpha ("sun2_alpha", Color) = (1,1,1,1)
        _sun1_alpha ("sun1_alpha", Color) = (1,1,1,1)
        _glow ("glow", 2D) = "white" {}
        _sun3_alpha ("sun3_alpha", Color) = (0.5,0.5,0.5,1)
        _liuguang_mask ("liuguang_mask", 2D) = "white" {}
        _liuguang ("liuguang", 2D) = "white" {}
        _alpha_sun ("alpha_sun", Float ) = 1
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
            uniform sampler2D _sun1; uniform float4 _sun1_ST;
            uniform float _ang_1;
            uniform sampler2D _lizi1; uniform float4 _lizi1_ST;
            uniform sampler2D _lizi2; uniform float4 _lizi2_ST;
            uniform sampler2D _Chris_lizi_mask; uniform float4 _Chris_lizi_mask_ST;
            uniform float4 _sun_color;
            uniform float _ang_2;
            uniform sampler2D _node_6929; uniform float4 _node_6929_ST;
            uniform float4 _sun1_alpha;
            uniform float4 _sun2_alpha;
            uniform sampler2D _glow; uniform float4 _glow_ST;
            uniform float4 _sun3_alpha;
            uniform sampler2D _liuguang_mask; uniform float4 _liuguang_mask_ST;
            uniform sampler2D _liuguang; uniform float4 _liuguang_ST;
            uniform float _alpha_sun;
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
                float4 _Chris_lizi_mask_var = tex2D(_Chris_lizi_mask,TRANSFORM_TEX(i.uv0, _Chris_lizi_mask));
                float4 node_416 = _Time + _TimeEditor;
                float2 node_6857 = (i.uv0+node_416.g*float2(0.03,-0.02));
                float4 _lizi1_var = tex2D(_lizi1,TRANSFORM_TEX(node_6857, _lizi1));
                float2 node_779 = (i.uv0+node_416.g*float2(0.07,-0.06));
                float4 _lizi2_var = tex2D(_lizi2,TRANSFORM_TEX(node_779, _lizi2));
                float node_8598_ang = _ang_2;
                float node_8598_spd = 1.0;
                float node_8598_cos = cos(node_8598_spd*node_8598_ang);
                float node_8598_sin = sin(node_8598_spd*node_8598_ang);
                float2 node_8598_piv = float2(0.5,0.5);
                float2 node_8598 = (mul(i.uv0-node_8598_piv,float2x2( node_8598_cos, -node_8598_sin, node_8598_sin, node_8598_cos))+node_8598_piv);
                float4 _node_6929_var = tex2D(_node_6929,TRANSFORM_TEX(node_8598, _node_6929));
                float node_818_ang = _ang_1;
                float node_818_spd = 1.0;
                float node_818_cos = cos(node_818_spd*node_818_ang);
                float node_818_sin = sin(node_818_spd*node_818_ang);
                float2 node_818_piv = float2(0.5,0.5);
                float2 node_818 = (mul(i.uv0-node_818_piv,float2x2( node_818_cos, -node_818_sin, node_818_sin, node_818_cos))+node_818_piv);
                float4 _sun1_var = tex2D(_sun1,TRANSFORM_TEX(node_818, _sun1));
                float4 _glow_var = tex2D(_glow,TRANSFORM_TEX(i.uv0, _glow));
                float2 node_4516 = (i.uv0+node_416.g*float2(0.2,0.4));
                float4 _liuguang_var = tex2D(_liuguang,TRANSFORM_TEX(node_4516, _liuguang));
                float4 _liuguang_mask_var = tex2D(_liuguang_mask,TRANSFORM_TEX(i.uv0, _liuguang_mask));
                float3 emissive = (i.vertexColor.rgb*_alpha_sun*((_sun_color.rgb*((_Chris_lizi_mask_var.rgb*_lizi1_var.rgb)+_lizi2_var.rgb))+(_sun2_alpha.rgb*_node_6929_var.rgb*_sun_color.rgb)+(_sun1_var.rgb*_sun1_alpha.rgb*_sun_color.rgb)+(_glow_var.rgb*_sun3_alpha.rgb)+((_liuguang_var.rgb*_sun_color.rgb)*_liuguang_mask_var.rgb)));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
