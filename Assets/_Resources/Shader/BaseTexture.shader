// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "SA/BaseTexture"
{
	Properties{
		_MainTex("Base (RGB)", 2D) = "white" {}
		_Shine("Shine", float) = 0.4
	}
	SubShader{
		Tags{ "RenderType" = "Overlay" "IgnoreProjector" = "True" "RenderType" = "TransparentCutout" }
		LOD 10

		Pass{
			Blend SrcAlpha OneMinusSrcAlpha
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag

			#include "UnityCG.cginc"


			sampler2D _MainTex;
			float4 _MainTex_ST;
			float _Shine;
			//输入结构体
			struct vertexInput {
				float4 vertex:POSITION;
				float4 texcoord:TEXCOORD0;
			};

			//输出结构体
			struct vertexOutput {
				float4 pos:SV_POSITION;
				float4 tex:TEXCOORD0;
			};

			vertexOutput vert(vertexInput v)
			{
				vertexOutput o;

				o.pos = UnityObjectToClipPos(v.vertex);
				o.tex = v.texcoord;

				return o;
			}

			fixed4 frag(vertexOutput i) : COLOR
			{
				fixed4 col = tex2D(_MainTex, i.tex.xy * _MainTex_ST.xy + _MainTex_ST.zw) * _Shine;
				return col;
			}
			ENDCG
		}
	}
	FallBack Off
}