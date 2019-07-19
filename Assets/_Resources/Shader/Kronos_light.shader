// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:32985,y:32973,varname:node_3138,prsc:2|emission-6925-OUT;n:type:ShaderForge.SFN_Tex2d,id:332,x:31773,y:32793,ptovrint:False,ptlb:tex_1,ptin:_tex_1,varname:node_332,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:7529c17be8c9b5641b8336802370246d,ntxv:0,isnm:False|UVIN-3644-UVOUT;n:type:ShaderForge.SFN_Add,id:9407,x:32547,y:32946,varname:node_9407,prsc:2|A-4005-OUT,B-7631-RGB,C-728-OUT;n:type:ShaderForge.SFN_Tex2d,id:7631,x:31773,y:32971,ptovrint:False,ptlb:tex_2,ptin:_tex_2,varname:node_7631,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:9e2f6bda8ca0c4542b78666961ce1672,ntxv:0,isnm:False|UVIN-2488-UVOUT;n:type:ShaderForge.SFN_Panner,id:3644,x:31536,y:32800,varname:node_3644,prsc:2,spu:-0.2,spv:0|UVIN-359-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:359,x:31234,y:32966,varname:node_359,prsc:2,uv:0;n:type:ShaderForge.SFN_Panner,id:2488,x:31545,y:32971,varname:node_2488,prsc:2,spu:0.1,spv:0|UVIN-359-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:6024,x:31785,y:33335,ptovrint:False,ptlb:tex_3,ptin:_tex_3,varname:node_6024,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:70d40687d5935a34f9dc9e885a46b782,ntxv:0,isnm:False|UVIN-2711-UVOUT;n:type:ShaderForge.SFN_Panner,id:2711,x:31548,y:33335,varname:node_2711,prsc:2,spu:0.2,spv:0|UVIN-359-UVOUT;n:type:ShaderForge.SFN_Multiply,id:728,x:32197,y:33268,varname:node_728,prsc:2|A-595-OUT,B-3789-OUT;n:type:ShaderForge.SFN_Power,id:3789,x:31973,y:33335,varname:node_3789,prsc:2|VAL-6024-RGB,EXP-2210-OUT;n:type:ShaderForge.SFN_Vector1,id:2210,x:31508,y:33500,varname:node_2210,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:4005,x:32191,y:32765,varname:node_4005,prsc:2|A-1010-OUT,B-9737-OUT;n:type:ShaderForge.SFN_Vector1,id:660,x:31769,y:32707,varname:node_660,prsc:2,v1:0.8;n:type:ShaderForge.SFN_Multiply,id:9737,x:31963,y:32783,varname:node_9737,prsc:2|A-660-OUT,B-332-RGB;n:type:ShaderForge.SFN_VertexColor,id:6335,x:32612,y:33243,varname:node_6335,prsc:2;n:type:ShaderForge.SFN_Multiply,id:6925,x:32780,y:33074,varname:node_6925,prsc:2|A-9407-OUT,B-196-OUT,C-6335-RGB;n:type:ShaderForge.SFN_Slider,id:196,x:32420,y:33135,ptovrint:False,ptlb:Alpha,ptin:_Alpha,varname:node_196,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5919836,max:1;n:type:ShaderForge.SFN_Panner,id:8605,x:33078,y:35207,varname:node_8605,prsc:2,spu:0.2,spv:0.2|UVIN-659-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:659,x:32884,y:35207,varname:node_659,prsc:2,uv:0;n:type:ShaderForge.SFN_Panner,id:8562,x:33142,y:35271,varname:node_8562,prsc:2,spu:0.2,spv:0.2|UVIN-8132-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:8132,x:32948,y:35271,varname:node_8132,prsc:2,uv:0;n:type:ShaderForge.SFN_Panner,id:4073,x:33206,y:35335,varname:node_4073,prsc:2,spu:0.2,spv:0.2|UVIN-9480-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:9480,x:33012,y:35335,varname:node_9480,prsc:2,uv:0;n:type:ShaderForge.SFN_Vector3,id:595,x:31973,y:33225,varname:node_595,prsc:2,v1:1,v2:0.8,v3:0;n:type:ShaderForge.SFN_Vector3,id:1010,x:31963,y:32691,varname:node_1010,prsc:2,v1:0.7,v2:0,v3:0;proporder:332-7631-6024-196;pass:END;sub:END;*/

Shader "Shader Forge/Amon_light" {
    Properties {
        _tex_1 ("tex_1", 2D) = "white" {}
        _tex_2 ("tex_2", 2D) = "white" {}
        _tex_3 ("tex_3", 2D) = "white" {}
        _Alpha ("Alpha", Range(0, 1)) = 0.5919836
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
            Cull Off
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
            uniform sampler2D _tex_1; uniform float4 _tex_1_ST;
            uniform sampler2D _tex_2; uniform float4 _tex_2_ST;
            uniform sampler2D _tex_3; uniform float4 _tex_3_ST;
            uniform float _Alpha;
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
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
////// Lighting:
////// Emissive:
                float node_660 = 0.8;
                float4 node_5853 = _Time + _TimeEditor;
                float2 node_3644 = (i.uv0+node_5853.g*float2(-0.2,0));
                float4 _tex_1_var = tex2D(_tex_1,TRANSFORM_TEX(node_3644, _tex_1));
                float2 node_2488 = (i.uv0+node_5853.g*float2(0.1,0));
                float4 _tex_2_var = tex2D(_tex_2,TRANSFORM_TEX(node_2488, _tex_2));
                float2 node_2711 = (i.uv0+node_5853.g*float2(0.2,0));
                float4 _tex_3_var = tex2D(_tex_3,TRANSFORM_TEX(node_2711, _tex_3));
                float3 emissive = (((float3(0.7,0,0)*(node_660*_tex_1_var.rgb))+_tex_2_var.rgb+(float3(1,0.8,0)*pow(_tex_3_var.rgb,2.0)))*_Alpha*i.vertexColor.rgb);
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
