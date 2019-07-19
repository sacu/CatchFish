// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:32719,y:32712,varname:node_3138,prsc:2|emission-9854-OUT;n:type:ShaderForge.SFN_Add,id:9854,x:32538,y:32934,varname:node_9854,prsc:2|A-1353-OUT,B-1200-OUT;n:type:ShaderForge.SFN_Multiply,id:1353,x:32291,y:32827,varname:node_1353,prsc:2|A-9110-OUT,B-3352-RGB,C-7087-RGB;n:type:ShaderForge.SFN_Power,id:9110,x:31973,y:32552,varname:node_9110,prsc:2|VAL-1783-R,EXP-6181-OUT;n:type:ShaderForge.SFN_Tex2d,id:1783,x:31754,y:32462,ptovrint:False,ptlb:rump2,ptin:_rump2,varname:node_1783,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:d7ef4328f0aca0942919bafaa7fec67a,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Vector1,id:6181,x:31724,y:32677,varname:node_6181,prsc:2,v1:0.2;n:type:ShaderForge.SFN_Tex2d,id:3352,x:32049,y:32857,ptovrint:False,ptlb:node_3352,ptin:_node_3352,varname:node_3352,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:032ec69f16e9eec46b72a29e4963ce2b,ntxv:0,isnm:False|UVIN-9374-OUT;n:type:ShaderForge.SFN_Add,id:2040,x:31690,y:32862,varname:node_2040,prsc:2|A-5506-R,B-8621-UVOUT;n:type:ShaderForge.SFN_Panner,id:419,x:31187,y:32923,varname:node_419,prsc:2,spu:0.1,spv:-0.2|UVIN-8621-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:8621,x:30668,y:33139,varname:node_8621,prsc:2,uv:0;n:type:ShaderForge.SFN_Tex2d,id:5506,x:31388,y:32791,ptovrint:False,ptlb:node_5506,ptin:_node_5506,varname:node_5506,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:9eec6572589a1b34cb9826d28de7dea3,ntxv:0,isnm:False|UVIN-419-UVOUT;n:type:ShaderForge.SFN_Add,id:9374,x:31816,y:32991,varname:node_9374,prsc:2|A-2040-OUT,B-419-UVOUT;n:type:ShaderForge.SFN_Color,id:7087,x:32069,y:33066,ptovrint:False,ptlb:color,ptin:_color,varname:node_7087,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.9,c3:0.3,c4:1;n:type:ShaderForge.SFN_Multiply,id:8382,x:32327,y:33225,varname:node_8382,prsc:2|A-7087-RGB,B-4271-RGB;n:type:ShaderForge.SFN_Tex2d,id:4271,x:31996,y:33276,ptovrint:False,ptlb:raoluan,ptin:_raoluan,varname:node_4271,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:e2a1dab6360d7db4e80b93b808b35cb2,ntxv:0,isnm:False|UVIN-9608-OUT;n:type:ShaderForge.SFN_Add,id:9608,x:31667,y:33338,varname:node_9608,prsc:2|A-5353-OUT,B-4338-UVOUT;n:type:ShaderForge.SFN_Panner,id:4338,x:31131,y:33530,varname:node_4338,prsc:2,spu:0.1,spv:0|UVIN-8621-UVOUT;n:type:ShaderForge.SFN_Power,id:5353,x:31488,y:33203,varname:node_5353,prsc:2|VAL-1428-R,EXP-1384-OUT;n:type:ShaderForge.SFN_Tex2d,id:1428,x:31249,y:33186,ptovrint:False,ptlb:node_1428,ptin:_node_1428,varname:node_1428,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False|UVIN-6030-UVOUT;n:type:ShaderForge.SFN_Vector1,id:1384,x:31131,y:33410,varname:node_1384,prsc:2,v1:5;n:type:ShaderForge.SFN_Panner,id:6030,x:30950,y:33243,varname:node_6030,prsc:2,spu:0.03,spv:0|UVIN-8621-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:8595,x:32152,y:33568,ptovrint:False,ptlb:rump,ptin:_rump,varname:node_8595,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:afbcb908769798443a4dfdad59744346,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:7955,x:32357,y:33631,varname:node_7955,prsc:2|A-8595-RGB,B-2035-OUT;n:type:ShaderForge.SFN_Vector1,id:2035,x:32160,y:33783,varname:node_2035,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Multiply,id:3962,x:32556,y:33749,varname:node_3962,prsc:2|A-7484-OUT,B-7955-OUT;n:type:ShaderForge.SFN_Multiply,id:7484,x:32348,y:33932,varname:node_7484,prsc:2|A-4176-RGB,B-9849-OUT;n:type:ShaderForge.SFN_Tex2d,id:4176,x:32146,y:33909,ptovrint:False,ptlb:mask,ptin:_mask,varname:node_4176,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:3099d11cf09532149b1fa064e479ac77,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Slider,id:9849,x:31893,y:34113,ptovrint:False,ptlb:node_9849,ptin:_node_9849,varname:node_9849,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:2,max:4;n:type:ShaderForge.SFN_Multiply,id:1200,x:32630,y:33427,varname:node_1200,prsc:2|A-8382-OUT,B-3962-OUT;proporder:1783-3352-5506-7087-4271-1428-8595-4176-9849;pass:END;sub:END;*/

Shader "Shader Forge/sixing" {
    Properties {
        _rump2 ("rump2", 2D) = "white" {}
        _node_3352 ("node_3352", 2D) = "white" {}
        _node_5506 ("node_5506", 2D) = "white" {}
        _color ("color", Color) = (1,0.9,0.3,1)
        _raoluan ("raoluan", 2D) = "white" {}
        _node_1428 ("node_1428", 2D) = "white" {}
        _rump ("rump", 2D) = "white" {}
        _mask ("mask", 2D) = "white" {}
        _node_9849 ("node_9849", Range(0, 4)) = 2
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
            #pragma exclude_renderers gles2 metal d3d11_9x
            #pragma target 2.0
            uniform float4 _TimeEditor;
            uniform sampler2D _rump2; uniform float4 _rump2_ST;
            uniform sampler2D _node_3352; uniform float4 _node_3352_ST;
            uniform sampler2D _node_5506; uniform float4 _node_5506_ST;
            uniform float4 _color;
            uniform sampler2D _raoluan; uniform float4 _raoluan_ST;
            uniform sampler2D _node_1428; uniform float4 _node_1428_ST;
            uniform sampler2D _rump; uniform float4 _rump_ST;
            uniform sampler2D _mask; uniform float4 _mask_ST;
            uniform float _node_9849;
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
                float4 _rump2_var = tex2D(_rump2,TRANSFORM_TEX(i.uv0, _rump2));
                float4 node_7721 = _Time + _TimeEditor;
                float2 node_419 = (i.uv0+node_7721.g*float2(0.1,-0.2));
                float4 _node_5506_var = tex2D(_node_5506,TRANSFORM_TEX(node_419, _node_5506));
                float2 node_9374 = ((_node_5506_var.r+i.uv0)+node_419);
                float4 _node_3352_var = tex2D(_node_3352,TRANSFORM_TEX(node_9374, _node_3352));
                float2 node_6030 = (i.uv0+node_7721.g*float2(0.03,0));
                float4 _node_1428_var = tex2D(_node_1428,TRANSFORM_TEX(node_6030, _node_1428));
                float2 node_9608 = (pow(_node_1428_var.r,5.0)+(i.uv0+node_7721.g*float2(0.1,0)));
                float4 _raoluan_var = tex2D(_raoluan,TRANSFORM_TEX(node_9608, _raoluan));
                float4 _mask_var = tex2D(_mask,TRANSFORM_TEX(i.uv0, _mask));
                float4 _rump_var = tex2D(_rump,TRANSFORM_TEX(i.uv0, _rump));
                float3 emissive = ((pow(_rump2_var.r,0.2)*_node_3352_var.rgb*_color.rgb)+((_color.rgb*_raoluan_var.rgb)*((_mask_var.rgb*_node_9849)*(_rump_var.rgb*0.5))));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
