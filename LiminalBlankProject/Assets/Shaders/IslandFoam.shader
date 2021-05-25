// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:0,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:True,rfrpo:False,rfrpn:Refraction,coma:15,ufog:False,aust:False,igpj:True,qofs:0,qpre:3,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33135,y:32758,varname:node_3138,prsc:2|emission-7241-RGB,alpha-458-OUT,voffset-8907-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:32168,y:32565,ptovrint:False,ptlb:Color,ptin:_Color,varname:_Color,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_TexCoord,id:1541,x:31781,y:32693,varname:node_1541,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Time,id:3473,x:31700,y:32968,varname:node_3473,prsc:2;n:type:ShaderForge.SFN_Add,id:6695,x:32018,y:32866,varname:node_6695,prsc:2|A-1541-V,B-3473-TSL;n:type:ShaderForge.SFN_Multiply,id:7435,x:32211,y:32917,varname:node_7435,prsc:2|A-6473-OUT,B-6695-OUT;n:type:ShaderForge.SFN_Vector1,id:6473,x:32049,y:32783,varname:node_6473,prsc:2,v1:16;n:type:ShaderForge.SFN_Sin,id:458,x:32483,y:32924,varname:node_458,prsc:2|IN-7435-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:5246,x:32120,y:33239,varname:node_5246,prsc:2;n:type:ShaderForge.SFN_ViewPosition,id:7269,x:31385,y:33178,varname:node_7269,prsc:2;n:type:ShaderForge.SFN_Vector1,id:3053,x:32611,y:33126,varname:node_3053,prsc:2,v1:-0.5;n:type:ShaderForge.SFN_ViewPosition,id:2733,x:32120,y:33381,varname:node_2733,prsc:2;n:type:ShaderForge.SFN_Subtract,id:965,x:32342,y:33326,varname:node_965,prsc:2|A-5246-XYZ,B-2733-XYZ;n:type:ShaderForge.SFN_Transform,id:7719,x:32537,y:33326,varname:node_7719,prsc:2,tffrom:0,tfto:1|IN-965-OUT;n:type:ShaderForge.SFN_Normalize,id:9957,x:32808,y:33280,varname:node_9957,prsc:2|IN-7719-XYZ;n:type:ShaderForge.SFN_Multiply,id:8907,x:32844,y:33126,varname:node_8907,prsc:2|A-3053-OUT,B-9957-OUT;proporder:7241;pass:END;sub:END;*/

Shader "Shader Forge/IslandFoam" {
    Properties {
        _Color ("Color", Color) = (1,1,1,1)
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            AlphaToMask On
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma target 3.0
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _Color)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                v.vertex.xyz += ((-0.5)*normalize(mul( unity_WorldToObject, float4((mul(unity_ObjectToWorld, v.vertex).rgb-_WorldSpaceCameraPos),0) ).xyz.rgb));
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
////// Lighting:
////// Emissive:
                float4 _Color_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Color );
                float3 emissive = _Color_var.rgb;
                float3 finalColor = emissive;
                float4 node_3473 = _Time;
                return fixed4(finalColor,sin((16.0*(i.uv0.g+node_3473.r))));
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            Cull Back
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma target 3.0
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float4 posWorld : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                v.vertex.xyz += ((-0.5)*normalize(mul( unity_WorldToObject, float4((mul(unity_ObjectToWorld, v.vertex).rgb-_WorldSpaceCameraPos),0) ).xyz.rgb));
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
