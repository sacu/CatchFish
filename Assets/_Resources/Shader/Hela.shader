// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:32520,y:33312,varname:node_3138,prsc:2|emission-8585-OUT;n:type:ShaderForge.SFN_Panner,id:5341,x:29747,y:33492,varname:node_5341,prsc:2,spu:0.2,spv:-0.1|UVIN-8581-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:6258,x:30893,y:33243,ptovrint:False,ptlb:Hela_mask_1,ptin:_Hela_mask_1,varname:node_6258,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:85092a8030e559a45a23e5dd495ae271,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Panner,id:533,x:30727,y:32999,varname:node_533,prsc:2,spu:-0.5,spv:-0.1|UVIN-8581-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:8581,x:29660,y:33781,varname:node_8581,prsc:2,uv:0;n:type:ShaderForge.SFN_Tex2d,id:1992,x:30893,y:32999,ptovrint:False,ptlb:node_1992,ptin:_node_1992,varname:node_1992,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:474bbb53c85dc7e48ae334433d270a64,ntxv:0,isnm:False|UVIN-533-UVOUT;n:type:ShaderForge.SFN_Add,id:9201,x:31276,y:33133,varname:node_9201,prsc:2|A-8581-UVOUT,B-5942-OUT;n:type:ShaderForge.SFN_Multiply,id:5942,x:31070,y:33243,varname:node_5942,prsc:2|A-5489-OUT,B-6258-R;n:type:ShaderForge.SFN_Multiply,id:3509,x:31684,y:33223,varname:node_3509,prsc:2|A-811-RGB,B-6721-OUT;n:type:ShaderForge.SFN_Multiply,id:5489,x:31066,y:33116,varname:node_5489,prsc:2|A-1992-R,B-9223-OUT;n:type:ShaderForge.SFN_Vector1,id:9223,x:30893,y:33160,varname:node_9223,prsc:2,v1:0.8;n:type:ShaderForge.SFN_Tex2d,id:811,x:31494,y:33133,ptovrint:False,ptlb:Hela_mask_2,ptin:_Hela_mask_2,varname:node_811,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:85092a8030e559a45a23e5dd495ae271,ntxv:0,isnm:False|UVIN-9201-OUT;n:type:ShaderForge.SFN_Vector3,id:6721,x:31494,y:33291,varname:node_6721,prsc:2,v1:1.583066,v2:1.034872,v3:1.948529;n:type:ShaderForge.SFN_Tex2d,id:4595,x:31276,y:33303,ptovrint:False,ptlb:Hela_eye,ptin:_Hela_eye,varname:node_4595,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:af1402e75edb89643a166e39d97b25a9,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:7883,x:31494,y:33384,varname:node_7883,prsc:2|A-4595-RGB,B-3346-OUT;n:type:ShaderForge.SFN_Vector3,id:300,x:31066,y:33365,varname:node_300,prsc:2,v1:0.7870179,v2:0.4485294,v3:1;n:type:ShaderForge.SFN_Slider,id:9101,x:30913,y:33485,ptovrint:False,ptlb:Hela_eye_slider,ptin:_Hela_eye_slider,varname:node_9101,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:4.09109,max:5;n:type:ShaderForge.SFN_Multiply,id:3346,x:31276,y:33465,varname:node_3346,prsc:2|A-300-OUT,B-9101-OUT;n:type:ShaderForge.SFN_Add,id:5645,x:31944,y:33365,varname:node_5645,prsc:2|A-3509-OUT,B-7883-OUT,C-2317-OUT,D-6614-OUT,E-6233-OUT;n:type:ShaderForge.SFN_Tex2d,id:8528,x:29834,y:33176,ptovrint:False,ptlb:Hela_liuguang_mask,ptin:_Hela_liuguang_mask,varname:node_8528,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:ea0e3c5a40f7cb348aa5449def6ec791,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:868,x:30018,y:33264,varname:node_868,prsc:2|A-8528-RGB,B-4542-OUT;n:type:ShaderForge.SFN_Vector1,id:4542,x:29811,y:33384,varname:node_4542,prsc:2,v1:3;n:type:ShaderForge.SFN_Tex2d,id:3285,x:30003,y:33467,ptovrint:False,ptlb:Hela_liuguang_text,ptin:_Hela_liuguang_text,varname:node_3285,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:94a1414d81ebc8e40aa4c628ea02048a,ntxv:0,isnm:False|UVIN-5341-UVOUT;n:type:ShaderForge.SFN_Multiply,id:2317,x:30214,y:33387,varname:node_2317,prsc:2|A-868-OUT,B-3285-RGB;n:type:ShaderForge.SFN_Tex2d,id:7300,x:31070,y:33588,ptovrint:False,ptlb:Hela_eye_lizi_mask,ptin:_Hela_eye_lizi_mask,varname:node_7300,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:37431b0e9651c464d875a8d1d4aaab4f,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:1974,x:31298,y:33658,varname:node_1974,prsc:2|A-7300-RGB,B-5870-OUT;n:type:ShaderForge.SFN_Tex2d,id:9540,x:31070,y:33762,ptovrint:False,ptlb:Hela_eye_lizi_text_1,ptin:_Hela_eye_lizi_text_1,varname:node_9540,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:c9cf0f04b32393d46bbd6b24016bd4c1,ntxv:0,isnm:False|UVIN-9816-UVOUT;n:type:ShaderForge.SFN_Panner,id:9816,x:30904,y:33762,varname:node_9816,prsc:2,spu:-0.01,spv:-0.05|UVIN-8581-UVOUT;n:type:ShaderForge.SFN_Multiply,id:6614,x:31494,y:33538,varname:node_6614,prsc:2|A-3346-OUT,B-1974-OUT;n:type:ShaderForge.SFN_Tex2d,id:5296,x:31070,y:33946,ptovrint:False,ptlb:Hela_eye_lizi_text_2,ptin:_Hela_eye_lizi_text_2,varname:_node_9540_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:c9cf0f04b32393d46bbd6b24016bd4c1,ntxv:0,isnm:False|UVIN-1936-UVOUT;n:type:ShaderForge.SFN_Panner,id:1936,x:30904,y:33946,varname:node_1936,prsc:2,spu:-0.01,spv:-0.1|UVIN-8581-UVOUT;n:type:ShaderForge.SFN_Add,id:5870,x:31252,y:33845,varname:node_5870,prsc:2|A-9540-RGB,B-5296-RGB;n:type:ShaderForge.SFN_Panner,id:4923,x:32630,y:34759,varname:node_4923,prsc:2,spu:0.2,spv:0.2|UVIN-1312-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:1312,x:32436,y:34759,varname:node_1312,prsc:2,uv:0;n:type:ShaderForge.SFN_Tex2d,id:877,x:31691,y:33519,ptovrint:False,ptlb:hela_rump,ptin:_hela_rump,varname:node_877,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:14339020d3001ed4eb6328d0023c14a4,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:137,x:31070,y:34138,ptovrint:False,ptlb:node_137,ptin:_node_137,varname:node_137,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False|UVIN-7979-UVOUT;n:type:ShaderForge.SFN_Panner,id:7979,x:30868,y:34138,varname:node_7979,prsc:2,spu:-0.2,spv:-0.02|UVIN-8581-UVOUT;n:type:ShaderForge.SFN_Multiply,id:6233,x:31913,y:33643,varname:node_6233,prsc:2|A-877-RGB,B-137-RGB,C-4032-OUT,D-8446-OUT;n:type:ShaderForge.SFN_Tex2d,id:5976,x:31070,y:34310,ptovrint:False,ptlb:node_137_copy,ptin:_node_137_copy,varname:_node_137_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:2a27c1714fa376441804d58536200d67,ntxv:0,isnm:False|UVIN-4184-UVOUT;n:type:ShaderForge.SFN_Panner,id:4184,x:30868,y:34317,varname:node_4184,prsc:2,spu:-0.1,spv:-0.02|UVIN-8581-UVOUT;n:type:ShaderForge.SFN_Vector3,id:8446,x:31913,y:33809,varname:node_8446,prsc:2,v1:0.6183044,v2:0.4458261,v3:0.9779412;n:type:ShaderForge.SFN_Multiply,id:4032,x:31376,y:34188,varname:node_4032,prsc:2|A-137-RGB,B-5976-RGB,C-2415-OUT;n:type:ShaderForge.SFN_Vector1,id:2415,x:31336,y:34381,varname:node_2415,prsc:2,v1:5;n:type:ShaderForge.SFN_Add,id:8585,x:32167,y:33348,varname:node_8585,prsc:2|A-8431-OUT,B-5645-OUT;n:type:ShaderForge.SFN_Tex2d,id:3958,x:31876,y:33144,ptovrint:False,ptlb:Hela_buff,ptin:_Hela_buff,varname:node_3958,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:c88a497fe97ef964e86eb20dd9c66c5b,ntxv:0,isnm:False|UVIN-8581-UVOUT;n:type:ShaderForge.SFN_Multiply,id:8431,x:32167,y:33198,varname:node_8431,prsc:2|A-3958-RGB,B-8047-OUT;n:type:ShaderForge.SFN_Vector3,id:8047,x:31990,y:33281,varname:node_8047,prsc:2,v1:0.779311,v2:0.2,v3:1;proporder:6258-1992-811-4595-9101-8528-3285-7300-9540-5296-877-137-5976-3958;pass:END;sub:END;*/

Shader "Shader Forge/HelaShader" {
    Properties {
        _Hela_mask_1 ("Hela_mask_1", 2D) = "white" {}
        _node_1992 ("node_1992", 2D) = "white" {}
        _Hela_mask_2 ("Hela_mask_2", 2D) = "white" {}
        _Hela_eye ("Hela_eye", 2D) = "white" {}
        _Hela_eye_slider ("Hela_eye_slider", Range(0, 5)) = 4.09109
        _Hela_liuguang_mask ("Hela_liuguang_mask", 2D) = "white" {}
        _Hela_liuguang_text ("Hela_liuguang_text", 2D) = "white" {}
        _Hela_eye_lizi_mask ("Hela_eye_lizi_mask", 2D) = "white" {}
        _Hela_eye_lizi_text_1 ("Hela_eye_lizi_text_1", 2D) = "white" {}
        _Hela_eye_lizi_text_2 ("Hela_eye_lizi_text_2", 2D) = "white" {}
        _hela_rump ("hela_rump", 2D) = "white" {}
        _node_137 ("node_137", 2D) = "white" {}
        _node_137_copy ("node_137_copy", 2D) = "white" {}
        _Hela_buff ("Hela_buff", 2D) = "white" {}
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
            uniform sampler2D _Hela_mask_1; uniform float4 _Hela_mask_1_ST;
            uniform sampler2D _node_1992; uniform float4 _node_1992_ST;
            uniform sampler2D _Hela_mask_2; uniform float4 _Hela_mask_2_ST;
            uniform sampler2D _Hela_eye; uniform float4 _Hela_eye_ST;
            uniform float _Hela_eye_slider;
            uniform sampler2D _Hela_liuguang_mask; uniform float4 _Hela_liuguang_mask_ST;
            uniform sampler2D _Hela_liuguang_text; uniform float4 _Hela_liuguang_text_ST;
            uniform sampler2D _Hela_eye_lizi_mask; uniform float4 _Hela_eye_lizi_mask_ST;
            uniform sampler2D _Hela_eye_lizi_text_1; uniform float4 _Hela_eye_lizi_text_1_ST;
            uniform sampler2D _Hela_eye_lizi_text_2; uniform float4 _Hela_eye_lizi_text_2_ST;
            uniform sampler2D _hela_rump; uniform float4 _hela_rump_ST;
            uniform sampler2D _node_137; uniform float4 _node_137_ST;
            uniform sampler2D _node_137_copy; uniform float4 _node_137_copy_ST;
            uniform sampler2D _Hela_buff; uniform float4 _Hela_buff_ST;
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
                float4 _Hela_buff_var = tex2D(_Hela_buff,TRANSFORM_TEX(i.uv0, _Hela_buff));
                float4 node_2213 = _Time + _TimeEditor;
                float2 node_533 = (i.uv0+node_2213.g*float2(-0.5,-0.1));
                float4 _node_1992_var = tex2D(_node_1992,TRANSFORM_TEX(node_533, _node_1992));
                float4 _Hela_mask_1_var = tex2D(_Hela_mask_1,TRANSFORM_TEX(i.uv0, _Hela_mask_1));
                float2 node_9201 = (i.uv0+((_node_1992_var.r*0.8)*_Hela_mask_1_var.r));
                float4 _Hela_mask_2_var = tex2D(_Hela_mask_2,TRANSFORM_TEX(node_9201, _Hela_mask_2));
                float4 _Hela_eye_var = tex2D(_Hela_eye,TRANSFORM_TEX(i.uv0, _Hela_eye));
                float3 node_3346 = (float3(0.7870179,0.4485294,1)*_Hela_eye_slider);
                float4 _Hela_liuguang_mask_var = tex2D(_Hela_liuguang_mask,TRANSFORM_TEX(i.uv0, _Hela_liuguang_mask));
                float2 node_5341 = (i.uv0+node_2213.g*float2(0.2,-0.1));
                float4 _Hela_liuguang_text_var = tex2D(_Hela_liuguang_text,TRANSFORM_TEX(node_5341, _Hela_liuguang_text));
                float4 _Hela_eye_lizi_mask_var = tex2D(_Hela_eye_lizi_mask,TRANSFORM_TEX(i.uv0, _Hela_eye_lizi_mask));
                float2 node_9816 = (i.uv0+node_2213.g*float2(-0.01,-0.05));
                float4 _Hela_eye_lizi_text_1_var = tex2D(_Hela_eye_lizi_text_1,TRANSFORM_TEX(node_9816, _Hela_eye_lizi_text_1));
                float2 node_1936 = (i.uv0+node_2213.g*float2(-0.01,-0.1));
                float4 _Hela_eye_lizi_text_2_var = tex2D(_Hela_eye_lizi_text_2,TRANSFORM_TEX(node_1936, _Hela_eye_lizi_text_2));
                float4 _hela_rump_var = tex2D(_hela_rump,TRANSFORM_TEX(i.uv0, _hela_rump));
                float2 node_7979 = (i.uv0+node_2213.g*float2(-0.2,-0.02));
                float4 _node_137_var = tex2D(_node_137,TRANSFORM_TEX(node_7979, _node_137));
                float2 node_4184 = (i.uv0+node_2213.g*float2(-0.1,-0.02));
                float4 _node_137_copy_var = tex2D(_node_137_copy,TRANSFORM_TEX(node_4184, _node_137_copy));
                float3 emissive = ((_Hela_buff_var.rgb*float3(0.779311,0.2,1))+((_Hela_mask_2_var.rgb*float3(1.583066,1.034872,1.948529))+(_Hela_eye_var.rgb*node_3346)+((_Hela_liuguang_mask_var.rgb*3.0)*_Hela_liuguang_text_var.rgb)+(node_3346*(_Hela_eye_lizi_mask_var.rgb*(_Hela_eye_lizi_text_1_var.rgb+_Hela_eye_lizi_text_2_var.rgb)))+(_hela_rump_var.rgb*_node_137_var.rgb*(_node_137_var.rgb*_node_137_copy_var.rgb*5.0)*float3(0.6183044,0.4458261,0.9779412))));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
