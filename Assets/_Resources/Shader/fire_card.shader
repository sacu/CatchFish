// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:31961,y:33036,varname:node_3138,prsc:2|emission-1503-OUT,alpha-2858-OUT;n:type:ShaderForge.SFN_Tex2d,id:9554,x:31183,y:33000,ptovrint:False,ptlb:text,ptin:_text,varname:node_9554,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:6712dc0f195c1d64c87291f4de358c5e,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Step,id:8945,x:31330,y:33762,varname:node_8945,prsc:2|A-6261-R,B-8747-OUT;n:type:ShaderForge.SFN_Tex2d,id:6261,x:31100,y:33667,ptovrint:False,ptlb:noise,ptin:_noise,varname:node_6261,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Slider,id:8747,x:30913,y:33839,ptovrint:False,ptlb:rongjie,ptin:_rongjie,varname:node_8747,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Tex2d,id:5940,x:31330,y:33584,ptovrint:False,ptlb:mask,ptin:_mask,varname:node_5940,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:13a241394b748b648b05d927cabb95f6,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Add,id:4697,x:31549,y:33717,varname:node_4697,prsc:2|A-5940-A,B-8945-OUT;n:type:ShaderForge.SFN_VertexColor,id:6923,x:31523,y:33412,varname:node_6923,prsc:2;n:type:ShaderForge.SFN_Multiply,id:1503,x:31794,y:33134,varname:node_1503,prsc:2|A-7366-OUT,B-6923-RGB;n:type:ShaderForge.SFN_Multiply,id:2858,x:31727,y:33696,varname:node_2858,prsc:2|A-6923-A,B-4697-OUT,C-9762-OUT;n:type:ShaderForge.SFN_Tex2d,id:3944,x:30792,y:32824,ptovrint:False,ptlb:node_3944,ptin:_node_3944,varname:node_3944,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:97ff3b62642f462418e8b21c7a77681d,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:7226,x:31183,y:32838,varname:node_7226,prsc:2|A-3785-OUT,B-6895-OUT;n:type:ShaderForge.SFN_Tex2d,id:2927,x:30792,y:32648,ptovrint:False,ptlb:node_2927,ptin:_node_2927,varname:node_2927,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:37c446ad91e4ba14fbf10a0e28ad39ef,ntxv:0,isnm:False|UVIN-6230-UVOUT;n:type:ShaderForge.SFN_Panner,id:6230,x:30622,y:32648,varname:node_6230,prsc:2,spu:0.1,spv:0.1|UVIN-262-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:262,x:30458,y:32648,varname:node_262,prsc:2,uv:0;n:type:ShaderForge.SFN_Multiply,id:3785,x:30978,y:32755,varname:node_3785,prsc:2|A-7332-OUT,B-2927-RGB;n:type:ShaderForge.SFN_Vector1,id:7332,x:30978,y:32699,varname:node_7332,prsc:2,v1:2;n:type:ShaderForge.SFN_Add,id:7366,x:31421,y:32818,varname:node_7366,prsc:2|A-7226-OUT,B-9554-RGB;n:type:ShaderForge.SFN_Power,id:6895,x:30978,y:32878,varname:node_6895,prsc:2|VAL-3944-RGB,EXP-7473-OUT;n:type:ShaderForge.SFN_Slider,id:9762,x:31421,y:33906,ptovrint:False,ptlb:alpha,ptin:_alpha,varname:node_9762,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Vector1,id:7473,x:30792,y:32987,varname:node_7473,prsc:2,v1:3;proporder:9554-6261-8747-5940-3944-2927-9762;pass:END;sub:END;*/

Shader "Shader Forge/fire_card" {
    Properties {
        _text ("text", 2D) = "white" {}
        _noise ("noise", 2D) = "white" {}
        _rongjie ("rongjie", Range(0, 1)) = 1
        _mask ("mask", 2D) = "white" {}
        _node_3944 ("node_3944", 2D) = "white" {}
        _node_2927 ("node_2927", 2D) = "white" {}
        _alpha ("alpha", Range(0, 1)) = 0
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
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
            Blend SrcAlpha OneMinusSrcAlpha
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
            uniform sampler2D _text; uniform float4 _text_ST;
            uniform sampler2D _noise; uniform float4 _noise_ST;
            uniform float _rongjie;
            uniform sampler2D _mask; uniform float4 _mask_ST;
            uniform sampler2D _node_3944; uniform float4 _node_3944_ST;
            uniform sampler2D _node_2927; uniform float4 _node_2927_ST;
            uniform float _alpha;
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
                float4 node_7085 = _Time + _TimeEditor;
                float2 node_6230 = (i.uv0+node_7085.g*float2(0.1,0.1));
                float4 _node_2927_var = tex2D(_node_2927,TRANSFORM_TEX(node_6230, _node_2927));
                float4 _node_3944_var = tex2D(_node_3944,TRANSFORM_TEX(i.uv0, _node_3944));
                float3 node_7226 = ((2.0*_node_2927_var.rgb)*pow(_node_3944_var.rgb,3.0));
                float4 _text_var = tex2D(_text,TRANSFORM_TEX(i.uv0, _text));
                float3 emissive = ((node_7226+_text_var.rgb)*i.vertexColor.rgb);
                float3 finalColor = emissive;
                float4 _mask_var = tex2D(_mask,TRANSFORM_TEX(i.uv0, _mask));
                float4 _noise_var = tex2D(_noise,TRANSFORM_TEX(i.uv0, _noise));
                return fixed4(finalColor,(i.vertexColor.a*(_mask_var.a+step(_noise_var.r,_rongjie))*_alpha));
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
