// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:True,hqlp:False,rprd:True,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:2865,x:30906,y:32819,varname:node_2865,prsc:2|emission-3143-OUT;n:type:ShaderForge.SFN_Tex2d,id:1440,x:30319,y:32795,ptovrint:False,ptlb:node_1440,ptin:_node_1440,varname:node_1440,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:68675aeadd7cfa446b80c66ebdfb7fef,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:8595,x:29022,y:32924,ptovrint:False,ptlb:node_8595,ptin:_node_8595,varname:node_8595,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:012b369781b4e1c43a177a8f2098202b,ntxv:0,isnm:False|UVIN-7752-UVOUT;n:type:ShaderForge.SFN_Panner,id:7752,x:28816,y:32924,varname:node_7752,prsc:2,spu:0.2,spv:0|UVIN-9399-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:9399,x:28432,y:33241,varname:node_9399,prsc:2,uv:0;n:type:ShaderForge.SFN_Tex2d,id:1678,x:29020,y:33094,ptovrint:False,ptlb:node_1678,ptin:_node_1678,varname:node_1678,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:94a1414d81ebc8e40aa4c628ea02048a,ntxv:0,isnm:False|UVIN-9038-UVOUT;n:type:ShaderForge.SFN_Panner,id:9038,x:28816,y:33094,varname:node_9038,prsc:2,spu:-0.1,spv:-0.2|UVIN-9399-UVOUT;n:type:ShaderForge.SFN_Multiply,id:3143,x:30732,y:32921,varname:node_3143,prsc:2|A-1440-A,B-4885-OUT;n:type:ShaderForge.SFN_Add,id:9860,x:29617,y:33149,varname:node_9860,prsc:2|A-7716-OUT,B-78-OUT;n:type:ShaderForge.SFN_Multiply,id:3868,x:29013,y:33603,varname:node_3868,prsc:2|A-8595-R,B-1678-R;n:type:ShaderForge.SFN_Add,id:8430,x:29208,y:33580,varname:node_8430,prsc:2|A-9399-UVOUT,B-3868-OUT;n:type:ShaderForge.SFN_Tex2d,id:2916,x:29374,y:33580,ptovrint:False,ptlb:node_8595_copy,ptin:_node_8595_copy,varname:_node_8595_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:012b369781b4e1c43a177a8f2098202b,ntxv:0,isnm:False|UVIN-8430-OUT;n:type:ShaderForge.SFN_Multiply,id:3681,x:29484,y:32847,varname:node_3681,prsc:2|A-8595-RGB,B-1678-RGB;n:type:ShaderForge.SFN_Power,id:7716,x:29712,y:32847,varname:node_7716,prsc:2|VAL-3681-OUT,EXP-1369-OUT;n:type:ShaderForge.SFN_Power,id:78,x:29623,y:33641,varname:node_78,prsc:2|VAL-2916-RGB,EXP-5586-OUT;n:type:ShaderForge.SFN_Multiply,id:4885,x:29811,y:33149,varname:node_4885,prsc:2|A-9860-OUT,B-561-OUT;n:type:ShaderForge.SFN_Slider,id:561,x:29566,y:33330,ptovrint:False,ptlb:node_561,ptin:_node_561,varname:node_561,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.833249,max:2;n:type:ShaderForge.SFN_Slider,id:5586,x:29260,y:33883,ptovrint:False,ptlb:color,ptin:_color,varname:_node_561_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:10.8891,max:21;n:type:ShaderForge.SFN_Vector1,id:1369,x:29602,y:32762,varname:node_1369,prsc:2,v1:0.5;proporder:8595-1678-1440-2916-561-5586;pass:END;sub:END;*/

Shader "Shader Forge/jinshu" {
    Properties {
        _node_8595 ("node_8595", 2D) = "white" {}
        _node_1678 ("node_1678", 2D) = "white" {}
        _node_1440 ("node_1440", 2D) = "white" {}
        _node_8595_copy ("node_8595_copy", 2D) = "white" {}
        _node_561 ("node_561", Range(0, 2)) = 0.833249
        _color ("color", Range(0, 21)) = 10.8891
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
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog
            #pragma exclude_renderers gles2 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 2.0
            uniform float4 _TimeEditor;
            uniform sampler2D _node_1440; uniform float4 _node_1440_ST;
            uniform sampler2D _node_8595; uniform float4 _node_8595_ST;
            uniform sampler2D _node_1678; uniform float4 _node_1678_ST;
            uniform sampler2D _node_8595_copy; uniform float4 _node_8595_copy_ST;
            uniform float _node_561;
            uniform float _color;
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
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
////// Lighting:
////// Emissive:
                float4 _node_1440_var = tex2D(_node_1440,TRANSFORM_TEX(i.uv0, _node_1440));
                float4 node_4438 = _Time + _TimeEditor;
                float2 node_7752 = (i.uv0+node_4438.g*float2(0.2,0));
                float4 _node_8595_var = tex2D(_node_8595,TRANSFORM_TEX(node_7752, _node_8595));
                float2 node_9038 = (i.uv0+node_4438.g*float2(-0.1,-0.2));
                float4 _node_1678_var = tex2D(_node_1678,TRANSFORM_TEX(node_9038, _node_1678));
                float2 node_8430 = (i.uv0+(_node_8595_var.r*_node_1678_var.r));
                float4 _node_8595_copy_var = tex2D(_node_8595_copy,TRANSFORM_TEX(node_8430, _node_8595_copy));
                float3 emissive = (_node_1440_var.a*((pow((_node_8595_var.rgb*_node_1678_var.rgb),0.5)+pow(_node_8595_copy_var.rgb,_color))*_node_561));
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
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
            uniform float4 _TimeEditor;
            uniform sampler2D _node_1440; uniform float4 _node_1440_ST;
            uniform sampler2D _node_8595; uniform float4 _node_8595_ST;
            uniform sampler2D _node_1678; uniform float4 _node_1678_ST;
            uniform sampler2D _node_8595_copy; uniform float4 _node_8595_copy_ST;
            uniform float _node_561;
            uniform float _color;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityMetaVertexPosition(v.vertex, v.texcoord1.xy, v.texcoord2.xy, unity_LightmapST, unity_DynamicLightmapST );
                return o;
            }
            float4 frag(VertexOutput i) : SV_Target {
                UnityMetaInput o;
                UNITY_INITIALIZE_OUTPUT( UnityMetaInput, o );
                
                float4 _node_1440_var = tex2D(_node_1440,TRANSFORM_TEX(i.uv0, _node_1440));
                float4 node_1095 = _Time + _TimeEditor;
                float2 node_7752 = (i.uv0+node_1095.g*float2(0.2,0));
                float4 _node_8595_var = tex2D(_node_8595,TRANSFORM_TEX(node_7752, _node_8595));
                float2 node_9038 = (i.uv0+node_1095.g*float2(-0.1,-0.2));
                float4 _node_1678_var = tex2D(_node_1678,TRANSFORM_TEX(node_9038, _node_1678));
                float2 node_8430 = (i.uv0+(_node_8595_var.r*_node_1678_var.r));
                float4 _node_8595_copy_var = tex2D(_node_8595_copy,TRANSFORM_TEX(node_8430, _node_8595_copy));
                o.Emission = (_node_1440_var.a*((pow((_node_8595_var.rgb*_node_1678_var.rgb),0.5)+pow(_node_8595_copy_var.rgb,_color))*_node_561));
                
                float3 diffColor = float3(0,0,0);
                o.Albedo = diffColor;
                
                return UnityMetaFragment( o );
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
