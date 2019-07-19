// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:33031,y:32729,varname:node_3138,prsc:2|emission-1163-OUT,alpha-1156-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:31812,y:33179,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_7241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0.6911764,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2d,id:9882,x:32103,y:32742,ptovrint:False,ptlb:texture,ptin:_texture,varname:node_9882,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:91d9a31c3f414624b9da70f1e57103bf,ntxv:0,isnm:False|UVIN-4853-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:7450,x:31842,y:32805,ptovrint:False,ptlb:mask,ptin:_mask,varname:node_7450,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:17594b2684f77c04987d7e5c327f5e8a,ntxv:0,isnm:False|UVIN-4853-UVOUT;n:type:ShaderForge.SFN_Add,id:326,x:32336,y:32773,varname:node_326,prsc:2|A-9882-RGB,B-9842-OUT;n:type:ShaderForge.SFN_Tex2d,id:4571,x:31812,y:33004,ptovrint:False,ptlb:noice,ptin:_noice,varname:node_4571,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:0df7a0b61c9dfa6408ae01459c10ffec,ntxv:0,isnm:False|UVIN-6385-UVOUT;n:type:ShaderForge.SFN_Panner,id:6385,x:31590,y:32975,varname:node_6385,prsc:2,spu:0.3,spv:0.2|UVIN-4853-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:4853,x:31366,y:32742,varname:node_4853,prsc:2,uv:0;n:type:ShaderForge.SFN_Add,id:6269,x:32016,y:33102,varname:node_6269,prsc:2|A-4571-RGB,B-7241-RGB;n:type:ShaderForge.SFN_Multiply,id:9842,x:32172,y:32947,varname:node_9842,prsc:2|A-7450-RGB,B-6269-OUT,C-8094-OUT;n:type:ShaderForge.SFN_ValueProperty,id:8094,x:31983,y:32993,ptovrint:False,ptlb:power,ptin:_power,varname:node_8094,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.3;n:type:ShaderForge.SFN_Color,id:3932,x:32336,y:32923,ptovrint:False,ptlb:color,ptin:_color,varname:node_3932,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Add,id:7574,x:32548,y:32876,varname:node_7574,prsc:2|A-326-OUT,B-3932-RGB;n:type:ShaderForge.SFN_VertexColor,id:6587,x:32548,y:32678,varname:node_6587,prsc:2;n:type:ShaderForge.SFN_Multiply,id:1163,x:32808,y:32725,varname:node_1163,prsc:2|A-7574-OUT,B-6587-RGB;n:type:ShaderForge.SFN_Multiply,id:1156,x:32808,y:32969,varname:node_1156,prsc:2|A-6587-A,B-9882-A,C-1106-OUT;n:type:ShaderForge.SFN_ValueProperty,id:1106,x:32467,y:33103,ptovrint:False,ptlb:alpha,ptin:_alpha,varname:node_1106,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;proporder:9882-7450-4571-8094-7241-3932-1106;pass:END;sub:END;*/

Shader "Shader Forge/jitan_shander" {
    Properties {
        _texture ("texture", 2D) = "white" {}
        _mask ("mask", 2D) = "white" {}
        _noice ("noice", 2D) = "white" {}
        _power ("power", Float ) = 0.3
        _Color ("Color", Color) = (0,0.6911764,1,1)
        _color ("color", Color) = (0,0,0,1)
        _alpha ("alpha", Float ) = 1
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
            uniform float4 _Color;
            uniform sampler2D _texture; uniform float4 _texture_ST;
            uniform sampler2D _mask; uniform float4 _mask_ST;
            uniform sampler2D _noice; uniform float4 _noice_ST;
            uniform float _power;
            uniform float4 _color;
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
                float4 _texture_var = tex2D(_texture,TRANSFORM_TEX(i.uv0, _texture));
                float4 _mask_var = tex2D(_mask,TRANSFORM_TEX(i.uv0, _mask));
                float4 node_7985 = _Time + _TimeEditor;
                float2 node_6385 = (i.uv0+node_7985.g*float2(0.3,0.2));
                float4 _noice_var = tex2D(_noice,TRANSFORM_TEX(node_6385, _noice));
                float3 emissive = (((_texture_var.rgb+(_mask_var.rgb*(_noice_var.rgb+_Color.rgb)*_power))+_color.rgb)*i.vertexColor.rgb);
                float3 finalColor = emissive;
                return fixed4(finalColor,(i.vertexColor.a*_texture_var.a*_alpha));
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
