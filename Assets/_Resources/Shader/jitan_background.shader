// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:33299,y:32655,varname:node_3138,prsc:2|emission-2930-OUT;n:type:ShaderForge.SFN_Multiply,id:606,x:32219,y:32833,varname:node_606,prsc:2|A-7708-RGB,B-6080-RGB,C-9652-OUT;n:type:ShaderForge.SFN_Tex2d,id:7708,x:31948,y:32737,ptovrint:False,ptlb:noise,ptin:_noise,varname:_noice,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:0df7a0b61c9dfa6408ae01459c10ffec,ntxv:0,isnm:False|UVIN-6139-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:6080,x:31948,y:32962,ptovrint:False,ptlb:ground,ptin:_ground,varname:_ground,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:6f94da4c92721ec45a24e94df1fda630,ntxv:0,isnm:False|UVIN-6139-UVOUT;n:type:ShaderForge.SFN_Multiply,id:553,x:32690,y:32834,varname:node_553,prsc:2|A-606-OUT,B-2070-RGB,C-3743-OUT;n:type:ShaderForge.SFN_Tex2d,id:1630,x:31814,y:33164,ptovrint:False,ptlb:wenli,ptin:_wenli,varname:_wenli,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:0df7a0b61c9dfa6408ae01459c10ffec,ntxv:0,isnm:False|UVIN-884-UVOUT;n:type:ShaderForge.SFN_Vector1,id:3743,x:32422,y:32900,varname:node_3743,prsc:2,v1:0.8;n:type:ShaderForge.SFN_Panner,id:884,x:31658,y:33164,varname:node_884,prsc:2,spu:0.02,spv:0.01|UVIN-6139-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:6139,x:31482,y:33118,varname:node_6139,prsc:2,uv:0;n:type:ShaderForge.SFN_Color,id:4362,x:32690,y:32968,ptovrint:False,ptlb:color,ptin:_color,varname:node_4362,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0.5716828,c3:0.6586207,c4:1;n:type:ShaderForge.SFN_Vector1,id:9652,x:31758,y:32916,varname:node_9652,prsc:2,v1:1.5;n:type:ShaderForge.SFN_Multiply,id:2930,x:32867,y:32883,varname:node_2930,prsc:2|A-553-OUT,B-4362-RGB;n:type:ShaderForge.SFN_Tex2d,id:2070,x:32363,y:33111,ptovrint:False,ptlb:node_2070,ptin:_node_2070,varname:node_2070,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:94a1414d81ebc8e40aa4c628ea02048a,ntxv:0,isnm:False|UVIN-3841-OUT;n:type:ShaderForge.SFN_Add,id:3841,x:32184,y:33111,varname:node_3841,prsc:2|A-6139-UVOUT,B-8650-OUT;n:type:ShaderForge.SFN_Multiply,id:8650,x:32018,y:33242,varname:node_8650,prsc:2|A-1630-R,B-4367-OUT;n:type:ShaderForge.SFN_Vector1,id:4367,x:31835,y:33333,varname:node_4367,prsc:2,v1:0.5;proporder:7708-6080-1630-4362-2070;pass:END;sub:END;*/

Shader "Shader Forge/jitan_background" {
    Properties {
        _noise ("noise", 2D) = "white" {}
        _ground ("ground", 2D) = "white" {}
        _wenli ("wenli", 2D) = "white" {}
        _color ("color", Color) = (0,0.5716828,0.6586207,1)
        _node_2070 ("node_2070", 2D) = "white" {}
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
            uniform sampler2D _noise; uniform float4 _noise_ST;
            uniform sampler2D _ground; uniform float4 _ground_ST;
            uniform sampler2D _wenli; uniform float4 _wenli_ST;
            uniform float4 _color;
            uniform sampler2D _node_2070; uniform float4 _node_2070_ST;
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
                float4 _noise_var = tex2D(_noise,TRANSFORM_TEX(i.uv0, _noise));
                float4 _ground_var = tex2D(_ground,TRANSFORM_TEX(i.uv0, _ground));
                float4 node_1779 = _Time + _TimeEditor;
                float2 node_884 = (i.uv0+node_1779.g*float2(0.02,0.01));
                float4 _wenli_var = tex2D(_wenli,TRANSFORM_TEX(node_884, _wenli));
                float2 node_3841 = (i.uv0+(_wenli_var.r*0.5));
                float4 _node_2070_var = tex2D(_node_2070,TRANSFORM_TEX(node_3841, _node_2070));
                float3 node_2930 = (((_noise_var.rgb*_ground_var.rgb*1.5)*_node_2070_var.rgb*0.8)*_color.rgb);
                float3 emissive = node_2930;
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
