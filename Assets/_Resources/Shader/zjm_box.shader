// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:4787,x:33585,y:33041,varname:node_4787,prsc:2|emission-2133-OUT,alpha-9121-OUT;n:type:ShaderForge.SFN_Tex2d,id:199,x:32440,y:33190,ptovrint:False,ptlb:node_199,ptin:_node_199,varname:node_199,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:6ae0246a006586e4aa665fc90b6b5deb,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:2262,x:32183,y:32963,ptovrint:False,ptlb:node_2262,ptin:_node_2262,varname:node_2262,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:8b0725f7ced2bbe4c8a5a3344865eca9,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Add,id:5600,x:33007,y:33154,varname:node_5600,prsc:2|A-9922-OUT,B-199-RGB,C-5332-OUT,D-8546-OUT;n:type:ShaderForge.SFN_Lerp,id:9692,x:31990,y:32775,varname:node_9692,prsc:2|A-1594-OUT,B-4154-OUT,T-9392-OUT;n:type:ShaderForge.SFN_Add,id:1594,x:31794,y:32775,varname:node_1594,prsc:2|A-1396-UVOUT,B-6665-OUT;n:type:ShaderForge.SFN_Divide,id:6665,x:31575,y:32788,varname:node_6665,prsc:2|A-5879-OUT,B-9392-OUT;n:type:ShaderForge.SFN_Subtract,id:5879,x:31372,y:32788,varname:node_5879,prsc:2|A-1396-UVOUT,B-4154-OUT;n:type:ShaderForge.SFN_Vector1,id:4154,x:31151,y:32888,varname:node_4154,prsc:2,v1:0.5;n:type:ShaderForge.SFN_TexCoord,id:1396,x:31151,y:32711,varname:node_1396,prsc:2,uv:0;n:type:ShaderForge.SFN_Slider,id:9392,x:30994,y:32991,ptovrint:False,ptlb:saoguang,ptin:_saoguang,varname:node_9392,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.1,cur:1,max:1;n:type:ShaderForge.SFN_Tex2d,id:3284,x:32183,y:32775,ptovrint:False,ptlb:huan,ptin:_huan,varname:node_3284,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:82cef53e471eb994097922d58fbe3abc,ntxv:0,isnm:False|UVIN-9692-OUT;n:type:ShaderForge.SFN_Multiply,id:9922,x:32429,y:32886,varname:node_9922,prsc:2|A-3284-R,B-2262-R,C-433-RGB;n:type:ShaderForge.SFN_Multiply,id:2133,x:33227,y:33154,varname:node_2133,prsc:2|A-5600-OUT,B-8414-RGB;n:type:ShaderForge.SFN_VertexColor,id:8414,x:33007,y:33307,varname:node_8414,prsc:2;n:type:ShaderForge.SFN_Multiply,id:9121,x:33227,y:33291,varname:node_9121,prsc:2|A-8414-A,B-199-A;n:type:ShaderForge.SFN_Color,id:433,x:32183,y:33154,ptovrint:False,ptlb:node_433,ptin:_node_433,varname:node_433,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2d,id:1330,x:32178,y:33360,ptovrint:False,ptlb:node_1330,ptin:_node_1330,varname:node_1330,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:65ccad8decabbfe47819eb3c8f3d9538,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:5332,x:32417,y:33497,varname:node_5332,prsc:2|A-1330-A,B-2899-OUT,C-1250-OUT;n:type:ShaderForge.SFN_Slider,id:2899,x:32021,y:33547,ptovrint:False,ptlb:liangdu,ptin:_liangdu,varname:node_2899,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Vector3,id:1250,x:32178,y:33629,varname:node_1250,prsc:2,v1:0.8,v2:0.5,v3:0.1;n:type:ShaderForge.SFN_Tex2d,id:4233,x:32178,y:33761,ptovrint:False,ptlb:node_4233,ptin:_node_4233,varname:node_4233,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:2ea5f1c8e157ae84aa939010df9e0c8b,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:8546,x:32412,y:33841,varname:node_8546,prsc:2|A-4233-R,B-5321-RGB,C-3667-OUT;n:type:ShaderForge.SFN_Tex2d,id:5321,x:32178,y:33954,ptovrint:False,ptlb:node_5321,ptin:_node_5321,varname:node_5321,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:ebbdc475303062c4ba3fbe1e4faa9e5b,ntxv:0,isnm:False|UVIN-871-UVOUT;n:type:ShaderForge.SFN_Panner,id:871,x:31980,y:33954,varname:node_871,prsc:2,spu:0,spv:-0.1|UVIN-8631-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:8631,x:31783,y:33954,varname:node_8631,prsc:2,uv:0;n:type:ShaderForge.SFN_Vector1,id:3667,x:32178,y:34121,varname:node_3667,prsc:2,v1:0.5;proporder:199-2262-9392-3284-433-1330-2899-4233-5321;pass:END;sub:END;*/

Shader "Custom/zjm_box" {
    Properties {
        _node_199 ("node_199", 2D) = "white" {}
        _node_2262 ("node_2262", 2D) = "white" {}
        _saoguang ("saoguang", Range(0.1, 1)) = 1
        _huan ("huan", 2D) = "white" {}
        _node_433 ("node_433", Color) = (1,1,1,1)
        _node_1330 ("node_1330", 2D) = "white" {}
        _liangdu ("liangdu", Range(0, 1)) = 0
        _node_4233 ("node_4233", 2D) = "white" {}
        _node_5321 ("node_5321", 2D) = "white" {}
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
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
            Blend SrcAlpha OneMinusSrcAlpha
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
            uniform sampler2D _node_199; uniform float4 _node_199_ST;
            uniform sampler2D _node_2262; uniform float4 _node_2262_ST;
            uniform float _saoguang;
            uniform sampler2D _huan; uniform float4 _huan_ST;
            uniform float4 _node_433;
            uniform sampler2D _node_1330; uniform float4 _node_1330_ST;
            uniform float _liangdu;
            uniform sampler2D _node_4233; uniform float4 _node_4233_ST;
            uniform sampler2D _node_5321; uniform float4 _node_5321_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 vertexColor : COLOR;
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.pos = UnityObjectToClipPos(v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float node_4154 = 0.5;
                float2 node_9692 = lerp((i.uv0+((i.uv0-node_4154)/_saoguang)),float2(node_4154,node_4154),_saoguang);
                float4 _huan_var = tex2D(_huan,TRANSFORM_TEX(node_9692, _huan));
                float4 _node_2262_var = tex2D(_node_2262,TRANSFORM_TEX(i.uv0, _node_2262));
                float4 _node_199_var = tex2D(_node_199,TRANSFORM_TEX(i.uv0, _node_199));
                float4 _node_1330_var = tex2D(_node_1330,TRANSFORM_TEX(i.uv0, _node_1330));
                float4 _node_4233_var = tex2D(_node_4233,TRANSFORM_TEX(i.uv0, _node_4233));
                float4 node_1790 = _Time + _TimeEditor;
                float2 node_871 = (i.uv0+node_1790.g*float2(0,-0.1));
                float4 _node_5321_var = tex2D(_node_5321,TRANSFORM_TEX(node_871, _node_5321));
                float3 emissive = (((_huan_var.r*_node_2262_var.r*_node_433.rgb)+_node_199_var.rgb+(_node_1330_var.a*_liangdu*float3(0.8,0.5,0.1))+(_node_4233_var.r*_node_5321_var.rgb*0.5))*i.vertexColor.rgb);
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,(i.vertexColor.a*_node_199_var.a));
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
