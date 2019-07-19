// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:0,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:0,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:1,x:33572,y:32693,varname:node_1,prsc:2|emission-7-OUT,alpha-2668-OUT;n:type:ShaderForge.SFN_Tex2d,id:2,x:32936,y:32971,ptovrint:False,ptlb:Diffuse,ptin:_Diffuse,varname:_Diffuse,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-18-UVOUT;n:type:ShaderForge.SFN_Multiply,id:7,x:33373,y:32670,varname:node_7,prsc:2|A-5807-RGB,B-2-RGB,C-7035-OUT,D-2089-RGB;n:type:ShaderForge.SFN_Multiply,id:8,x:33152,y:33030,varname:node_8,prsc:2|A-5807-A,B-2-A;n:type:ShaderForge.SFN_Rotator,id:18,x:32762,y:32971,varname:node_18,prsc:2|UVIN-30-UVOUT,ANG-31-OUT;n:type:ShaderForge.SFN_ValueProperty,id:29,x:32391,y:33035,ptovrint:False,ptlb:Tex_Ang,ptin:_Tex_Ang,varname:_Tex_Ang,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_TexCoord,id:30,x:32581,y:32863,varname:node_30,prsc:2,uv:0;n:type:ShaderForge.SFN_Multiply,id:31,x:32564,y:33035,varname:node_31,prsc:2|A-29-OUT,B-309-OUT;n:type:ShaderForge.SFN_Vector1,id:32,x:32170,y:33373,varname:node_32,prsc:2,v1:180;n:type:ShaderForge.SFN_Pi,id:3219,x:32203,y:33219,varname:node_3219,prsc:2;n:type:ShaderForge.SFN_Divide,id:309,x:32367,y:33219,varname:node_309,prsc:2|A-3219-OUT,B-32-OUT;n:type:ShaderForge.SFN_Slider,id:7035,x:32995,y:32815,ptovrint:False,ptlb:Bright,ptin:_Bright,varname:_Bright,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:10;n:type:ShaderForge.SFN_VertexColor,id:5807,x:32744,y:32739,varname:node_5807,prsc:2;n:type:ShaderForge.SFN_Multiply,id:2668,x:33392,y:33030,varname:node_2668,prsc:2|A-8-OUT,B-3798-OUT;n:type:ShaderForge.SFN_Slider,id:3798,x:32995,y:33225,ptovrint:False,ptlb:Alpha_Strength,ptin:_Alpha_Strength,varname:_Alpha_Strength,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:10;n:type:ShaderForge.SFN_Color,id:2089,x:32999,y:32530,ptovrint:False,ptlb:node_2089,ptin:_node_2089,varname:_node_2089,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;proporder:2-29-7035-3798-2089;pass:END;sub:END;*/

Shader "Fx_Shader/particle_blend" {
    Properties {
        _Diffuse ("Diffuse", 2D) = "white" {}
        _Tex_Ang ("Tex_Ang", Float ) = 0
        _Bright ("Bright", Range(0, 10)) = 1
        _Alpha_Strength ("Alpha_Strength", Range(0, 10)) = 1
        _node_2089 ("node_2089", Color) = (0.5,0.5,0.5,1)
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
            Cull Off
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma exclude_renderers gles2 d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 2.0
            uniform sampler2D _Diffuse; uniform float4 _Diffuse_ST;
            uniform float _Tex_Ang;
            uniform float _Bright;
            uniform float _Alpha_Strength;
            uniform float4 _node_2089;
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
                float node_18_ang = (_Tex_Ang*(3.141592654/180.0));
                float node_18_spd = 1.0;
                float node_18_cos = cos(node_18_spd*node_18_ang);
                float node_18_sin = sin(node_18_spd*node_18_ang);
                float2 node_18_piv = float2(0.5,0.5);
                float2 node_18 = (mul(i.uv0-node_18_piv,float2x2( node_18_cos, -node_18_sin, node_18_sin, node_18_cos))+node_18_piv);
                float4 _Diffuse_var = tex2D(_Diffuse,TRANSFORM_TEX(node_18, _Diffuse));
                float3 emissive = (i.vertexColor.rgb*_Diffuse_var.rgb*_Bright*_node_2089.rgb);
                float3 finalColor = emissive;
                return fixed4(finalColor,((i.vertexColor.a*_Diffuse_var.a)*_Alpha_Strength));
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
