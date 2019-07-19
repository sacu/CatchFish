// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:33530,y:33391,varname:node_3138,prsc:2|emission-5157-OUT;n:type:ShaderForge.SFN_Tex2d,id:2597,x:32420,y:32894,ptovrint:False,ptlb:hela_fazhen,ptin:_hela_fazhen,varname:node_2597,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:14f5741024efa134f9de3af90f4c1eb3,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Panner,id:4996,x:32694,y:34823,varname:node_4996,prsc:2,spu:0.2,spv:0.2|UVIN-4430-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:4430,x:32500,y:34823,varname:node_4430,prsc:2,uv:0;n:type:ShaderForge.SFN_TexCoord,id:3212,x:31135,y:32909,varname:node_3212,prsc:2,uv:0;n:type:ShaderForge.SFN_Subtract,id:1067,x:31642,y:32600,varname:node_1067,prsc:2|A-3212-UVOUT,B-9389-OUT;n:type:ShaderForge.SFN_Vector1,id:9389,x:31465,y:32745,varname:node_9389,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Divide,id:3865,x:31864,y:32600,varname:node_3865,prsc:2|A-1067-OUT,B-4364-OUT;n:type:ShaderForge.SFN_Add,id:5462,x:32056,y:32600,varname:node_5462,prsc:2|A-3865-OUT,B-3212-UVOUT;n:type:ShaderForge.SFN_Slider,id:4364,x:31867,y:32946,ptovrint:False,ptlb:node_4364,ptin:_node_4364,varname:node_4364,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.2,cur:0.7674661,max:0.8;n:type:ShaderForge.SFN_Lerp,id:7756,x:32246,y:32708,varname:node_7756,prsc:2|A-5462-OUT,B-9389-OUT,T-4364-OUT;n:type:ShaderForge.SFN_Tex2d,id:3364,x:32433,y:32707,ptovrint:False,ptlb:hela_fazhen_mash,ptin:_hela_fazhen_mash,varname:node_3364,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:da78b8b0dc40e8d41bbbc6793c22789e,ntxv:0,isnm:False|UVIN-7756-OUT;n:type:ShaderForge.SFN_Panner,id:3151,x:32758,y:34887,varname:node_3151,prsc:2,spu:0.2,spv:0.2|UVIN-2778-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:2778,x:32564,y:34887,varname:node_2778,prsc:2,uv:0;n:type:ShaderForge.SFN_Multiply,id:7590,x:32652,y:32829,varname:node_7590,prsc:2|A-3364-RGB,B-2597-RGB;n:type:ShaderForge.SFN_Color,id:7562,x:32796,y:33166,ptovrint:False,ptlb:node_7562,ptin:_node_7562,varname:node_7562,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.8831262,c2:0.3823529,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:324,x:32987,y:33050,varname:node_324,prsc:2|A-9881-OUT,B-7562-RGB;n:type:ShaderForge.SFN_Multiply,id:8593,x:32606,y:33024,varname:node_8593,prsc:2|A-2597-RGB,B-3303-RGB;n:type:ShaderForge.SFN_Tex2d,id:3303,x:32400,y:33118,ptovrint:False,ptlb:node_3303,ptin:_node_3303,varname:node_3303,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:8bee1c3ed5b27ea479c483d67f128d73,ntxv:0,isnm:False|UVIN-7717-UVOUT;n:type:ShaderForge.SFN_Panner,id:7717,x:32192,y:33094,varname:node_7717,prsc:2,spu:0.1,spv:0.1|UVIN-3212-UVOUT;n:type:ShaderForge.SFN_Add,id:9881,x:32806,y:32989,varname:node_9881,prsc:2|A-2239-OUT,B-8593-OUT;n:type:ShaderForge.SFN_Multiply,id:2239,x:32865,y:32829,varname:node_2239,prsc:2|A-4195-OUT,B-7590-OUT;n:type:ShaderForge.SFN_ValueProperty,id:4195,x:32663,y:32751,ptovrint:False,ptlb:Alpha,ptin:_Alpha,varname:node_4195,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Multiply,id:5157,x:33190,y:33164,varname:node_5157,prsc:2|A-324-OUT,B-7529-RGB;n:type:ShaderForge.SFN_Tex2d,id:7529,x:32991,y:33262,ptovrint:False,ptlb:Heal_fazhen_mask,ptin:_Heal_fazhen_mask,varname:node_7529,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:71921532e7297074aafca97e813d650a,ntxv:0,isnm:False;proporder:2597-4364-3364-7562-3303-4195-7529;pass:END;sub:END;*/

Shader "Shader Forge/Hela_fazhen" {
    Properties {
        _hela_fazhen ("hela_fazhen", 2D) = "white" {}
        _node_4364 ("node_4364", Range(0.2, 0.8)) = 0.7674661
        _hela_fazhen_mash ("hela_fazhen_mash", 2D) = "white" {}
        _node_7562 ("node_7562", Color) = (0.8831262,0.3823529,1,1)
        _node_3303 ("node_3303", 2D) = "white" {}
        _Alpha ("Alpha", Float ) = 0
        _Heal_fazhen_mask ("Heal_fazhen_mask", 2D) = "white" {}
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
            uniform sampler2D _hela_fazhen; uniform float4 _hela_fazhen_ST;
            uniform float _node_4364;
            uniform sampler2D _hela_fazhen_mash; uniform float4 _hela_fazhen_mash_ST;
            uniform float4 _node_7562;
            uniform sampler2D _node_3303; uniform float4 _node_3303_ST;
            uniform float _Alpha;
            uniform sampler2D _Heal_fazhen_mask; uniform float4 _Heal_fazhen_mask_ST;
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
                float node_9389 = 0.5;
                float2 node_7756 = lerp((((i.uv0-node_9389)/_node_4364)+i.uv0),float2(node_9389,node_9389),_node_4364);
                float4 _hela_fazhen_mash_var = tex2D(_hela_fazhen_mash,TRANSFORM_TEX(node_7756, _hela_fazhen_mash));
                float4 _hela_fazhen_var = tex2D(_hela_fazhen,TRANSFORM_TEX(i.uv0, _hela_fazhen));
                float4 node_9246 = _Time + _TimeEditor;
                float2 node_7717 = (i.uv0+node_9246.g*float2(0.1,0.1));
                float4 _node_3303_var = tex2D(_node_3303,TRANSFORM_TEX(node_7717, _node_3303));
                float4 _Heal_fazhen_mask_var = tex2D(_Heal_fazhen_mask,TRANSFORM_TEX(i.uv0, _Heal_fazhen_mask));
                float3 emissive = ((((_Alpha*(_hela_fazhen_mash_var.rgb*_hela_fazhen_var.rgb))+(_hela_fazhen_var.rgb*_node_3303_var.rgb))*_node_7562.rgb)*_Heal_fazhen_mask_var.rgb);
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
