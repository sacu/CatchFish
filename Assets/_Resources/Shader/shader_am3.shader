// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:6728,x:34331,y:33060,varname:node_6728,prsc:2|emission-5124-OUT;n:type:ShaderForge.SFN_Tex2d,id:7260,x:32515,y:32543,ptovrint:False,ptlb:node_7260,ptin:_node_7260,varname:node_7260,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:ca2b5f0d84019fb409387ae0c392c05f,ntxv:0,isnm:False|UVIN-4013-UVOUT;n:type:ShaderForge.SFN_Step,id:6813,x:32713,y:32560,varname:node_6813,prsc:2|A-5845-OUT,B-7260-R;n:type:ShaderForge.SFN_Vector1,id:9611,x:32328,y:32465,varname:node_9611,prsc:2,v1:0.35;n:type:ShaderForge.SFN_Multiply,id:1701,x:32911,y:32846,varname:node_1701,prsc:2|A-6813-OUT,B-1569-OUT;n:type:ShaderForge.SFN_Tex2d,id:4501,x:32512,y:33006,ptovrint:False,ptlb:node_4501,ptin:_node_4501,varname:node_4501,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:ab7a44434b27f334fb25a4bd3f8cf512,ntxv:0,isnm:False|UVIN-3555-UVOUT;n:type:ShaderForge.SFN_Step,id:1569,x:32713,y:32846,varname:node_1569,prsc:2|A-2302-OUT,B-4501-R;n:type:ShaderForge.SFN_Vector1,id:2239,x:32325,y:32826,varname:node_2239,prsc:2,v1:0.3;n:type:ShaderForge.SFN_Panner,id:4013,x:32328,y:32574,varname:node_4013,prsc:2,spu:0,spv:-0.1|UVIN-9096-UVOUT,DIST-3273-R;n:type:ShaderForge.SFN_Panner,id:3555,x:32325,y:32905,varname:node_3555,prsc:2,spu:0,spv:0.1|UVIN-6145-UVOUT,DIST-3273-R;n:type:ShaderForge.SFN_TexCoord,id:1295,x:31716,y:32727,varname:node_1295,prsc:2,uv:0;n:type:ShaderForge.SFN_Step,id:4634,x:32713,y:32697,varname:node_4634,prsc:2|A-9195-OUT,B-7260-R;n:type:ShaderForge.SFN_Step,id:6982,x:32713,y:32984,varname:node_6982,prsc:2|A-8741-OUT,B-4501-R;n:type:ShaderForge.SFN_Vector1,id:5099,x:32325,y:32746,varname:node_5099,prsc:2,v1:0.3;n:type:ShaderForge.SFN_Vector1,id:9451,x:32293,y:33149,varname:node_9451,prsc:2,v1:0.25;n:type:ShaderForge.SFN_Multiply,id:3723,x:32911,y:32697,varname:node_3723,prsc:2|A-4634-OUT,B-6982-OUT;n:type:ShaderForge.SFN_Subtract,id:8868,x:33095,y:32697,varname:node_8868,prsc:2|A-3723-OUT,B-1701-OUT;n:type:ShaderForge.SFN_Add,id:5571,x:33094,y:32846,varname:node_5571,prsc:2|A-3723-OUT,B-1701-OUT;n:type:ShaderForge.SFN_Add,id:3727,x:33547,y:32753,varname:node_3727,prsc:2|A-182-OUT,B-9358-OUT;n:type:ShaderForge.SFN_Multiply,id:9358,x:33311,y:32938,varname:node_9358,prsc:2|A-5571-OUT,B-8479-OUT,C-2500-RGB;n:type:ShaderForge.SFN_Vector1,id:8479,x:33095,y:32972,varname:node_8479,prsc:2,v1:0.25;n:type:ShaderForge.SFN_Tex2d,id:3273,x:32138,y:32746,ptovrint:False,ptlb:node_3273,ptin:_node_3273,varname:node_3273,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:ab7a44434b27f334fb25a4bd3f8cf512,ntxv:0,isnm:False|UVIN-8677-UVOUT;n:type:ShaderForge.SFN_Panner,id:8677,x:31968,y:32727,varname:node_8677,prsc:2,spu:0,spv:0.2|UVIN-1295-UVOUT;n:type:ShaderForge.SFN_Panner,id:9096,x:32138,y:32574,varname:node_9096,prsc:2,spu:0.05,spv:-0.1|UVIN-1295-UVOUT;n:type:ShaderForge.SFN_Panner,id:6145,x:32138,y:32905,varname:node_6145,prsc:2,spu:-0.05,spv:0.1|UVIN-1295-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:2538,x:33534,y:33244,ptovrint:False,ptlb:node_2538,ptin:_node_2538,varname:node_2538,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:5c260df5b2ffb8f4e9c0753db7cf25f3,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:216,x:33929,y:33163,varname:node_216,prsc:2|A-3727-OUT,B-1392-OUT;n:type:ShaderForge.SFN_Power,id:1392,x:33740,y:33280,varname:node_1392,prsc:2|VAL-2538-R,EXP-1534-OUT;n:type:ShaderForge.SFN_Vector1,id:1534,x:33534,y:33419,varname:node_1534,prsc:2,v1:1.5;n:type:ShaderForge.SFN_Tex2d,id:4993,x:33095,y:32507,ptovrint:False,ptlb:node_4993,ptin:_node_4993,varname:node_4993,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:9f4bf2b2448f2ae419545b3ab1757349,ntxv:0,isnm:False|UVIN-4983-UVOUT;n:type:ShaderForge.SFN_Multiply,id:182,x:33308,y:32604,varname:node_182,prsc:2|A-4993-RGB,B-8868-OUT;n:type:ShaderForge.SFN_Tex2d,id:2500,x:33095,y:33125,ptovrint:False,ptlb:node_2500,ptin:_node_2500,varname:node_2500,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:bf7517d3639a03740afa5dbeb96e59d2,ntxv:0,isnm:False|UVIN-4983-UVOUT;n:type:ShaderForge.SFN_Panner,id:4983,x:32713,y:33124,varname:node_4983,prsc:2,spu:0.2,spv:0|UVIN-1295-UVOUT;n:type:ShaderForge.SFN_ValueProperty,id:596,x:33929,y:33336,ptovrint:False,ptlb:alpha,ptin:_alpha,varname:node_596,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:5124,x:34112,y:33163,varname:node_5124,prsc:2|A-216-OUT,B-596-OUT;n:type:ShaderForge.SFN_Slider,id:2145,x:31837,y:33095,ptovrint:False,ptlb:fanwei,ptin:_fanwei,varname:node_2145,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Add,id:8741,x:32512,y:33187,varname:node_8741,prsc:2|A-9451-OUT,B-2145-OUT;n:type:ShaderForge.SFN_Add,id:2302,x:32512,y:32826,varname:node_2302,prsc:2|A-2239-OUT,B-2145-OUT;n:type:ShaderForge.SFN_Add,id:9195,x:32512,y:32712,varname:node_9195,prsc:2|A-5099-OUT,B-2145-OUT;n:type:ShaderForge.SFN_Add,id:5845,x:32515,y:32392,varname:node_5845,prsc:2|A-9611-OUT,B-2145-OUT;proporder:7260-4501-3273-2538-4993-2500-596-2145;pass:END;sub:END;*/

Shader "Custom/shader_am3" {
    Properties {
        _node_7260 ("node_7260", 2D) = "white" {}
        _node_4501 ("node_4501", 2D) = "white" {}
        _node_3273 ("node_3273", 2D) = "white" {}
        _node_2538 ("node_2538", 2D) = "white" {}
        _node_4993 ("node_4993", 2D) = "white" {}
        _node_2500 ("node_2500", 2D) = "white" {}
        _alpha ("alpha", Float ) = 1
        _fanwei ("fanwei", Range(0, 1)) = 0
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
            uniform sampler2D _node_7260; uniform float4 _node_7260_ST;
            uniform sampler2D _node_4501; uniform float4 _node_4501_ST;
            uniform sampler2D _node_3273; uniform float4 _node_3273_ST;
            uniform sampler2D _node_2538; uniform float4 _node_2538_ST;
            uniform sampler2D _node_4993; uniform float4 _node_4993_ST;
            uniform sampler2D _node_2500; uniform float4 _node_2500_ST;
            uniform float _alpha;
            uniform float _fanwei;
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
                float4 node_3464 = _Time + _TimeEditor;
                float2 node_4983 = (i.uv0+node_3464.g*float2(0.2,0));
                float4 _node_4993_var = tex2D(_node_4993,TRANSFORM_TEX(node_4983, _node_4993));
                float2 node_8677 = (i.uv0+node_3464.g*float2(0,0.2));
                float4 _node_3273_var = tex2D(_node_3273,TRANSFORM_TEX(node_8677, _node_3273));
                float2 node_4013 = ((i.uv0+node_3464.g*float2(0.05,-0.1))+_node_3273_var.r*float2(0,-0.1));
                float4 _node_7260_var = tex2D(_node_7260,TRANSFORM_TEX(node_4013, _node_7260));
                float2 node_3555 = ((i.uv0+node_3464.g*float2(-0.05,0.1))+_node_3273_var.r*float2(0,0.1));
                float4 _node_4501_var = tex2D(_node_4501,TRANSFORM_TEX(node_3555, _node_4501));
                float node_3723 = (step((0.3+_fanwei),_node_7260_var.r)*step((0.25+_fanwei),_node_4501_var.r));
                float node_1701 = (step((0.35+_fanwei),_node_7260_var.r)*step((0.3+_fanwei),_node_4501_var.r));
                float4 _node_2500_var = tex2D(_node_2500,TRANSFORM_TEX(node_4983, _node_2500));
                float4 _node_2538_var = tex2D(_node_2538,TRANSFORM_TEX(i.uv0, _node_2538));
                float3 emissive = ((((_node_4993_var.rgb*(node_3723-node_1701))+((node_3723+node_1701)*0.25*_node_2500_var.rgb))*pow(_node_2538_var.r,1.5))*_alpha);
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
