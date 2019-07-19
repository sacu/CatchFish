// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:4210,x:33253,y:33154,varname:node_4210,prsc:2|emission-1859-OUT;n:type:ShaderForge.SFN_Tex2d,id:9250,x:32192,y:32737,ptovrint:False,ptlb:node_9250,ptin:_node_9250,varname:node_9250,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:04446c227c4629d4c9b4a6080f0546c9,ntxv:0,isnm:False|UVIN-300-UVOUT;n:type:ShaderForge.SFN_Multiply,id:3784,x:32407,y:32951,varname:node_3784,prsc:2|A-9250-R,B-1112-OUT;n:type:ShaderForge.SFN_Tex2d,id:342,x:31989,y:32934,ptovrint:False,ptlb:node_342,ptin:_node_342,varname:node_342,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:c80d2242d22fa34418cfa998c7b5b066,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Power,id:1112,x:32192,y:32951,varname:node_1112,prsc:2|VAL-342-R,EXP-9044-OUT;n:type:ShaderForge.SFN_Vector1,id:9044,x:31989,y:33092,varname:node_9044,prsc:2,v1:2;n:type:ShaderForge.SFN_Panner,id:300,x:31989,y:32737,varname:node_300,prsc:2,spu:-0.8,spv:-0.8|UVIN-4028-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:4028,x:31794,y:32737,varname:node_4028,prsc:2,uv:0;n:type:ShaderForge.SFN_Fresnel,id:9537,x:32192,y:33178,varname:node_9537,prsc:2|NRM-3450-OUT;n:type:ShaderForge.SFN_NormalVector,id:3450,x:31989,y:33178,prsc:2,pt:False;n:type:ShaderForge.SFN_Multiply,id:5045,x:32761,y:33184,varname:node_5045,prsc:2|A-3784-OUT,B-3270-OUT,C-400-OUT,D-9520-OUT;n:type:ShaderForge.SFN_OneMinus,id:3270,x:32407,y:33178,varname:node_3270,prsc:2|IN-9537-OUT;n:type:ShaderForge.SFN_Vector3,id:400,x:32407,y:33342,varname:node_400,prsc:2,v1:0.5,v2:1.2,v3:1;n:type:ShaderForge.SFN_Vector1,id:9520,x:32407,y:33446,varname:node_9520,prsc:2,v1:0.3;n:type:ShaderForge.SFN_Slider,id:8247,x:32682,y:33395,ptovrint:False,ptlb:liangdu,ptin:_liangdu,varname:node_8247,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:6;n:type:ShaderForge.SFN_Multiply,id:1859,x:33017,y:33278,varname:node_1859,prsc:2|A-5045-OUT,B-8247-OUT;proporder:9250-342-8247;pass:END;sub:END;*/

Shader "Custom/2005_feng" {
    Properties {
        _node_9250 ("node_9250", 2D) = "white" {}
        _node_342 ("node_342", 2D) = "white" {}
        _liangdu ("liangdu", Range(0, 6)) = 0
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
            Cull Off
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
            uniform sampler2D _node_9250; uniform float4 _node_9250_ST;
            uniform sampler2D _node_342; uniform float4 _node_342_ST;
            uniform float _liangdu;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                UNITY_FOG_COORDS(3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos(v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
////// Lighting:
////// Emissive:
                float4 node_5960 = _Time + _TimeEditor;
                float2 node_300 = (i.uv0+node_5960.g*float2(-0.8,-0.8));
                float4 _node_9250_var = tex2D(_node_9250,TRANSFORM_TEX(node_300, _node_9250));
                float4 _node_342_var = tex2D(_node_342,TRANSFORM_TEX(i.uv0, _node_342));
                float3 emissive = (((_node_9250_var.r*pow(_node_342_var.r,2.0))*(1.0 - (1.0-max(0,dot(i.normalDir, viewDirection))))*float3(0.5,1.2,1)*0.3)*_liangdu);
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
