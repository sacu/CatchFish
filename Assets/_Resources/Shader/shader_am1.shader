// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:9497,x:33271,y:32296,varname:node_9497,prsc:2|emission-224-OUT,alpha-163-OUT;n:type:ShaderForge.SFN_Tex2d,id:2637,x:32124,y:32633,ptovrint:False,ptlb:node_2637,ptin:_node_2637,varname:node_2637,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:20108d2409b0ae3439020212eae4b1f9,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:7160,x:32124,y:32824,ptovrint:False,ptlb:node_7160,ptin:_node_7160,varname:node_7160,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:e6375a7ea822f8a4fbfbe2e3aab50f83,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:1552,x:32624,y:32500,varname:node_1552,prsc:2|A-1244-OUT,B-2637-RGB;n:type:ShaderForge.SFN_Step,id:1244,x:32124,y:32287,varname:node_1244,prsc:2|A-1168-OUT,B-3946-R;n:type:ShaderForge.SFN_Tex2d,id:3946,x:31905,y:32287,ptovrint:False,ptlb:node_3946,ptin:_node_3946,varname:node_3946,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:2,isnm:False;n:type:ShaderForge.SFN_Slider,id:1168,x:31541,y:32190,ptovrint:False,ptlb:node_1168,ptin:_node_1168,varname:node_1168,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.37197,max:1.1;n:type:ShaderForge.SFN_OneMinus,id:3255,x:32363,y:32223,varname:node_3255,prsc:2|IN-1244-OUT;n:type:ShaderForge.SFN_Multiply,id:8182,x:32624,y:32363,varname:node_8182,prsc:2|A-3255-OUT,B-4641-OUT;n:type:ShaderForge.SFN_Add,id:4641,x:32363,y:32474,varname:node_4641,prsc:2|A-7442-OUT,B-2637-RGB;n:type:ShaderForge.SFN_Tex2d,id:7309,x:31905,y:32474,ptovrint:False,ptlb:node_7309,ptin:_node_7309,varname:node_7309,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:6af412fa8dde31a41ac52e51261c970f,ntxv:2,isnm:False|UVIN-749-UVOUT;n:type:ShaderForge.SFN_Add,id:2101,x:32845,y:32419,varname:node_2101,prsc:2|A-8182-OUT,B-1552-OUT;n:type:ShaderForge.SFN_Power,id:7442,x:32124,y:32474,varname:node_7442,prsc:2|VAL-7309-RGB,EXP-5240-OUT;n:type:ShaderForge.SFN_Vector1,id:5240,x:31905,y:32636,varname:node_5240,prsc:2,v1:1;n:type:ShaderForge.SFN_Multiply,id:224,x:33042,y:32397,varname:node_224,prsc:2|A-1061-OUT,B-2101-OUT;n:type:ShaderForge.SFN_Step,id:1061,x:32124,y:32135,varname:node_1061,prsc:2|A-6243-OUT,B-3946-R;n:type:ShaderForge.SFN_Panner,id:749,x:31704,y:32474,varname:node_749,prsc:2,spu:0,spv:0.1|UVIN-3734-UVOUT,DIST-8520-R;n:type:ShaderForge.SFN_Tex2d,id:8520,x:31507,y:32562,ptovrint:False,ptlb:node_8520,ptin:_node_8520,varname:node_8520,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False|UVIN-6051-UVOUT;n:type:ShaderForge.SFN_Panner,id:3734,x:31507,y:32381,varname:node_3734,prsc:2,spu:0,spv:-0.05|UVIN-920-UVOUT;n:type:ShaderForge.SFN_Panner,id:6051,x:31335,y:32562,varname:node_6051,prsc:2,spu:0,spv:-0.2|UVIN-920-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:920,x:31114,y:32465,varname:node_920,prsc:2,uv:0;n:type:ShaderForge.SFN_Add,id:6243,x:31905,y:32104,varname:node_6243,prsc:2|A-4392-OUT,B-1168-OUT;n:type:ShaderForge.SFN_Vector1,id:4392,x:31720,y:32104,varname:node_4392,prsc:2,v1:-0.08;n:type:ShaderForge.SFN_Multiply,id:163,x:32624,y:32662,varname:node_163,prsc:2|A-1061-OUT,B-9192-OUT;n:type:ShaderForge.SFN_Subtract,id:9192,x:32380,y:32753,varname:node_9192,prsc:2|A-2637-A,B-7160-R;proporder:2637-7160-3946-1168-7309-8520;pass:END;sub:END;*/

Shader "Custom/2005" {
    Properties {
        _node_2637 ("node_2637", 2D) = "white" {}
        _node_7160 ("node_7160", 2D) = "white" {}
        _node_3946 ("node_3946", 2D) = "black" {}
        _node_1168 ("node_1168", Range(0, 1.1)) = 0.37197
        _node_7309 ("node_7309", 2D) = "black" {}
        _node_8520 ("node_8520", 2D) = "white" {}
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
            uniform sampler2D _node_2637; uniform float4 _node_2637_ST;
            uniform sampler2D _node_7160; uniform float4 _node_7160_ST;
            uniform sampler2D _node_3946; uniform float4 _node_3946_ST;
            uniform float _node_1168;
            uniform sampler2D _node_7309; uniform float4 _node_7309_ST;
            uniform sampler2D _node_8520; uniform float4 _node_8520_ST;
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
                float4 _node_3946_var = tex2D(_node_3946,TRANSFORM_TEX(i.uv0, _node_3946));
                float node_1061 = step(((-0.08)+_node_1168),_node_3946_var.r);
                float node_1244 = step(_node_1168,_node_3946_var.r);
                float4 node_186 = _Time + _TimeEditor;
                float2 node_6051 = (i.uv0+node_186.g*float2(0,-0.2));
                float4 _node_8520_var = tex2D(_node_8520,TRANSFORM_TEX(node_6051, _node_8520));
                float2 node_749 = ((i.uv0+node_186.g*float2(0,-0.05))+_node_8520_var.r*float2(0,0.1));
                float4 _node_7309_var = tex2D(_node_7309,TRANSFORM_TEX(node_749, _node_7309));
                float4 _node_2637_var = tex2D(_node_2637,TRANSFORM_TEX(i.uv0, _node_2637));
                float3 emissive = (node_1061*(((1.0 - node_1244)*(pow(_node_7309_var.rgb,1.0)+_node_2637_var.rgb))+(node_1244*_node_2637_var.rgb)));
                float3 finalColor = emissive;
                float4 _node_7160_var = tex2D(_node_7160,TRANSFORM_TEX(i.uv0, _node_7160));
                fixed4 finalRGBA = fixed4(finalColor,(node_1061*(_node_2637_var.a-_node_7160_var.r)));
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
