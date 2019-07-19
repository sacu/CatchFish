// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:0,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:True,fgod:False,fgor:False,fgmd:0,fgcr:0,fgcg:0,fgcb:0,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:4795,x:32956,y:32543,varname:node_4795,prsc:2|emission-2393-OUT;n:type:ShaderForge.SFN_Tex2d,id:6074,x:31998,y:32239,ptovrint:False,ptlb:DiffiuseTex,ptin:_DiffiuseTex,varname:_MainTex,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:2,isnm:False|UVIN-2205-UVOUT;n:type:ShaderForge.SFN_Multiply,id:2393,x:32676,y:32639,varname:node_2393,prsc:2|A-5575-OUT,B-5899-RGB,C-4416-OUT,D-5899-A;n:type:ShaderForge.SFN_TexCoord,id:4092,x:29498,y:31727,varname:node_4092,prsc:2,uv:0;n:type:ShaderForge.SFN_Tex2d,id:6765,x:31651,y:32701,ptovrint:False,ptlb:AlphaTex,ptin:_AlphaTex,varname:_DiffiuseTex_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:2,isnm:False|UVIN-7634-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:8924,x:31131,y:32657,varname:node_8924,prsc:2,uv:0;n:type:ShaderForge.SFN_Multiply,id:5575,x:32351,y:32534,varname:node_5575,prsc:2|A-6074-RGB,B-6765-A,C-6074-A;n:type:ShaderForge.SFN_Slider,id:4416,x:32407,y:32853,ptovrint:False,ptlb:Bright,ptin:_Bright,varname:node_4416,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:10;n:type:ShaderForge.SFN_Rotator,id:7634,x:31332,y:32759,varname:node_7634,prsc:2|UVIN-8924-UVOUT,ANG-7415-OUT;n:type:ShaderForge.SFN_ValueProperty,id:3475,x:30983,y:32838,ptovrint:False,ptlb:Alpha_Ang,ptin:_Alpha_Ang,varname:node_3475,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Multiply,id:7415,x:31144,y:32882,varname:node_7415,prsc:2|A-3475-OUT,B-8679-OUT;n:type:ShaderForge.SFN_Rotator,id:2205,x:31755,y:32256,varname:node_2205,prsc:2|UVIN-7513-OUT,ANG-8037-OUT;n:type:ShaderForge.SFN_Multiply,id:8037,x:31432,y:32345,varname:node_8037,prsc:2|A-1200-OUT,B-8679-OUT;n:type:ShaderForge.SFN_ValueProperty,id:1200,x:31253,y:32359,ptovrint:False,ptlb:Diffiuse_Ang,ptin:_Diffiuse_Ang,varname:_Alpha_Ang_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:8055,x:30650,y:32151,ptovrint:False,ptlb:U_speed,ptin:_U_speed,varname:node_8055,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:6706,x:30650,y:32227,ptovrint:False,ptlb:V_speed,ptin:_V_speed,varname:_U_speed_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Append,id:261,x:30853,y:32151,varname:node_261,prsc:2|A-8055-OUT,B-6706-OUT;n:type:ShaderForge.SFN_Multiply,id:6270,x:31076,y:32161,varname:node_6270,prsc:2|A-261-OUT,B-8641-OUT;n:type:ShaderForge.SFN_Add,id:7513,x:31418,y:32145,varname:node_7513,prsc:2|A-4092-UVOUT,B-6270-OUT,C-6722-OUT;n:type:ShaderForge.SFN_Vector1,id:8679,x:30732,y:32813,varname:node_8679,prsc:2,v1:0.01745329;n:type:ShaderForge.SFN_Tex2d,id:1217,x:30413,y:32494,ptovrint:False,ptlb:WLTex,ptin:_WLTex,varname:node_1217,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:a4bc6634fdeb0734cb5e8b939fc050e1,ntxv:0,isnm:False|UVIN-7083-OUT;n:type:ShaderForge.SFN_ValueProperty,id:3982,x:29611,y:32620,ptovrint:False,ptlb:WL_U_speed,ptin:_WL_U_speed,varname:node_3982,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.1;n:type:ShaderForge.SFN_ValueProperty,id:7234,x:29611,y:32721,ptovrint:False,ptlb:WL_V_speed,ptin:_WL_V_speed,varname:node_7234,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:-0.5;n:type:ShaderForge.SFN_Append,id:1512,x:29829,y:32620,varname:node_1512,prsc:2|A-3982-OUT,B-7234-OUT;n:type:ShaderForge.SFN_Multiply,id:3567,x:30011,y:32564,varname:node_3567,prsc:2|A-8641-OUT,B-1512-OUT;n:type:ShaderForge.SFN_Add,id:7083,x:30193,y:32494,varname:node_7083,prsc:2|A-4092-UVOUT,B-3567-OUT;n:type:ShaderForge.SFN_Slider,id:7533,x:30629,y:32600,ptovrint:False,ptlb:WL_Strength,ptin:_WL_Strength,varname:node_7533,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:10;n:type:ShaderForge.SFN_Multiply,id:6722,x:30933,y:32421,varname:node_6722,prsc:2|A-1217-R,B-7533-OUT;n:type:ShaderForge.SFN_Color,id:5899,x:32261,y:32695,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_5899,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_ValueProperty,id:1784,x:29159,y:32210,ptovrint:False,ptlb:UnScaledTime,ptin:_UnScaledTime,varname:node_1784,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Time,id:5460,x:29018,y:32276,varname:node_5460,prsc:2;n:type:ShaderForge.SFN_Add,id:8641,x:29425,y:32343,varname:node_8641,prsc:2|A-5460-T,B-1784-OUT;proporder:6074-1200-8055-6706-1217-7234-3982-7533-6765-3475-4416-5899-1784;pass:END;sub:END;*/

Shader "Fx_Shader/Mesh_UVDistortion_add" {
    Properties {
        _DiffiuseTex ("DiffiuseTex", 2D) = "black" {}
        _Diffiuse_Ang ("Diffiuse_Ang", Float ) = 0
        _U_speed ("U_speed", Float ) = 0
        _V_speed ("V_speed", Float ) = 0
        _WLTex ("WLTex", 2D) = "white" {}
        _WL_V_speed ("WL_V_speed", Float ) = -0.5
        _WL_U_speed ("WL_U_speed", Float ) = 0.1
        _WL_Strength ("WL_Strength", Range(0, 10)) = 0.5
        _AlphaTex ("AlphaTex", 2D) = "black" {}
        _Alpha_Ang ("Alpha_Ang", Float ) = 0
        _Bright ("Bright", Range(0, 10)) = 1
        _Color ("Color", Color) = (0.5,0.5,0.5,1)
        _UnScaledTime ("UnScaledTime", Float ) = 0
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
            #pragma multi_compile_fog
            #pragma exclude_renderers gles2 d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 2.0
            uniform float4 _TimeEditor;
            uniform sampler2D _DiffiuseTex; uniform float4 _DiffiuseTex_ST;
            uniform sampler2D _AlphaTex; uniform float4 _AlphaTex_ST;
            uniform float _Bright;
            uniform float _Alpha_Ang;
            uniform float _Diffiuse_Ang;
            uniform float _U_speed;
            uniform float _V_speed;
            uniform sampler2D _WLTex; uniform float4 _WLTex_ST;
            uniform float _WL_U_speed;
            uniform float _WL_V_speed;
            uniform float _WL_Strength;
            uniform float4 _Color;
            uniform float _UnScaledTime;
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
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
////// Lighting:
////// Emissive:
                float node_8679 = 0.01745329;
                float node_2205_ang = (_Diffiuse_Ang*node_8679);
                float node_2205_spd = 1.0;
                float node_2205_cos = cos(node_2205_spd*node_2205_ang);
                float node_2205_sin = sin(node_2205_spd*node_2205_ang);
                float2 node_2205_piv = float2(0.5,0.5);
                float4 node_5460 = _Time + _TimeEditor;
                float node_8641 = (node_5460.g+_UnScaledTime);
                float2 node_7083 = (i.uv0+(node_8641*float2(_WL_U_speed,_WL_V_speed)));
                float4 _WLTex_var = tex2D(_WLTex,TRANSFORM_TEX(node_7083, _WLTex));
                float2 node_2205 = (mul((i.uv0+(float2(_U_speed,_V_speed)*node_8641)+(_WLTex_var.r*_WL_Strength))-node_2205_piv,float2x2( node_2205_cos, -node_2205_sin, node_2205_sin, node_2205_cos))+node_2205_piv);
                float4 _DiffiuseTex_var = tex2D(_DiffiuseTex,TRANSFORM_TEX(node_2205, _DiffiuseTex));
                float node_7634_ang = (_Alpha_Ang*node_8679);
                float node_7634_spd = 1.0;
                float node_7634_cos = cos(node_7634_spd*node_7634_ang);
                float node_7634_sin = sin(node_7634_spd*node_7634_ang);
                float2 node_7634_piv = float2(0.5,0.5);
                float2 node_7634 = (mul(i.uv0-node_7634_piv,float2x2( node_7634_cos, -node_7634_sin, node_7634_sin, node_7634_cos))+node_7634_piv);
                float4 _AlphaTex_var = tex2D(_AlphaTex,TRANSFORM_TEX(node_7634, _AlphaTex));
                float3 emissive = ((_DiffiuseTex_var.rgb*_AlphaTex_var.a*_DiffiuseTex_var.a)*_Color.rgb*_Bright*_Color.a);
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG_COLOR(i.fogCoord, finalRGBA, fixed4(0,0,0,1));
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
