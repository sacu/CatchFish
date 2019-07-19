// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:3,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:True,hqlp:False,rprd:True,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:2865,x:33584,y:32754,varname:node_2865,prsc:2|emission-1360-OUT,clip-9146-OUT;n:type:ShaderForge.SFN_Tex2d,id:8537,x:32278,y:32825,ptovrint:False,ptlb:node_8537,ptin:_node_8537,varname:node_8537,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:e96852a38ffed6a4fa4a320d739e6f4e,ntxv:0,isnm:False|UVIN-1244-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:1244,x:31865,y:32953,varname:node_1244,prsc:2,uv:0;n:type:ShaderForge.SFN_Add,id:7254,x:32678,y:32956,varname:node_7254,prsc:2|A-1244-UVOUT,B-7943-OUT;n:type:ShaderForge.SFN_Slider,id:2070,x:32358,y:33112,ptovrint:False,ptlb:rao_luan_power,ptin:_rao_luan_power,varname:node_2070,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.1196581,max:1;n:type:ShaderForge.SFN_Multiply,id:7943,x:32515,y:32973,varname:node_7943,prsc:2|A-8537-R,B-2070-OUT;n:type:ShaderForge.SFN_Tex2d,id:3106,x:32848,y:32956,ptovrint:False,ptlb:node_8537_copy,ptin:_node_8537_copy,varname:_node_8537_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:a81469cec1e27a149bcf3c8a77a836d1,ntxv:0,isnm:False|UVIN-7254-OUT;n:type:ShaderForge.SFN_Add,id:8683,x:33059,y:32856,varname:node_8683,prsc:2|A-5704-OUT,B-3106-RGB;n:type:ShaderForge.SFN_Multiply,id:9146,x:33411,y:33039,varname:node_9146,prsc:2|A-8381-A,B-8537-R,C-2536-OUT;n:type:ShaderForge.SFN_Vector3,id:9981,x:32609,y:32804,varname:node_9981,prsc:2,v1:2,v2:1,v3:1;n:type:ShaderForge.SFN_Multiply,id:5704,x:32848,y:32804,varname:node_5704,prsc:2|A-9981-OUT,B-8537-RGB;n:type:ShaderForge.SFN_VertexColor,id:8381,x:33183,y:32930,varname:node_8381,prsc:2;n:type:ShaderForge.SFN_Multiply,id:1360,x:33411,y:32855,varname:node_1360,prsc:2|A-8683-OUT,B-8381-RGB;n:type:ShaderForge.SFN_Slider,id:2536,x:33254,y:33180,ptovrint:False,ptlb:alapha,ptin:_alapha,varname:node_2536,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.6242916,max:1;proporder:8537-2070-3106-2536;pass:END;sub:END;*/

Shader "Shader Forge/NewShader" {
    Properties {
        _node_8537 ("node_8537", 2D) = "white" {}
        _rao_luan_power ("rao_luan_power", Range(0, 1)) = 0.1196581
        _node_8537_copy ("node_8537_copy", 2D) = "white" {}
        _alapha ("alapha", Range(0, 1)) = 0.6242916
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="AlphaTest"
            "RenderType"="TransparentCutout"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Cull Off
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers gles2 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 2.0
            uniform sampler2D _node_8537; uniform float4 _node_8537_ST;
            uniform float _rao_luan_power;
            uniform sampler2D _node_8537_copy; uniform float4 _node_8537_copy_ST;
            uniform float _alapha;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float4 vertexColor : COLOR;
                UNITY_FOG_COORDS(3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
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
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float4 _node_8537_var = tex2D(_node_8537,TRANSFORM_TEX(i.uv0, _node_8537));
                clip((i.vertexColor.a*_node_8537_var.r*_alapha) - 0.5);
////// Lighting:
////// Emissive:
                float2 node_7254 = (i.uv0+(_node_8537_var.r*_rao_luan_power));
                float4 _node_8537_copy_var = tex2D(_node_8537_copy,TRANSFORM_TEX(node_7254, _node_8537_copy));
                float3 emissive = (((float3(2,1,1)*_node_8537_var.rgb)+_node_8537_copy_var.rgb)*i.vertexColor.rgb);
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma exclude_renderers gles2 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 2.0
            uniform sampler2D _node_8537; uniform float4 _node_8537_ST;
            uniform float _alapha;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.pos = UnityObjectToClipPos(v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float4 _node_8537_var = tex2D(_node_8537,TRANSFORM_TEX(i.uv0, _node_8537));
                clip((i.vertexColor.a*_node_8537_var.r*_alapha) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
        Pass {
            Name "Meta"
            Tags {
                "LightMode"="Meta"
            }
            Cull Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_META 1
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #include "UnityMetaPass.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma exclude_renderers gles2 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 2.0
            uniform sampler2D _node_8537; uniform float4 _node_8537_ST;
            uniform float _rao_luan_power;
            uniform sampler2D _node_8537_copy; uniform float4 _node_8537_copy_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
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
                o.pos = UnityMetaVertexPosition(v.vertex, v.texcoord1.xy, v.texcoord2.xy, unity_LightmapST, unity_DynamicLightmapST );
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : SV_Target {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                UnityMetaInput o;
                UNITY_INITIALIZE_OUTPUT( UnityMetaInput, o );
                
                float4 _node_8537_var = tex2D(_node_8537,TRANSFORM_TEX(i.uv0, _node_8537));
                float2 node_7254 = (i.uv0+(_node_8537_var.r*_rao_luan_power));
                float4 _node_8537_copy_var = tex2D(_node_8537_copy,TRANSFORM_TEX(node_7254, _node_8537_copy));
                o.Emission = (((float3(2,1,1)*_node_8537_var.rgb)+_node_8537_copy_var.rgb)*i.vertexColor.rgb);
                
                float3 diffColor = float3(0,0,0);
                float specularMonochrome;
                float3 specColor;
                diffColor = DiffuseAndSpecularFromMetallic( diffColor, 0, specColor, specularMonochrome );
                o.Albedo = diffColor;
                
                return UnityMetaFragment( o );
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
