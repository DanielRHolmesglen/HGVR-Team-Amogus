// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:0,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:False,rfrpn:Refraction,coma:15,ufog:False,aust:False,igpj:False,qofs:500,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:5,stps:4,stfa:1,stfz:1,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33820,y:32577,varname:node_9361,prsc:2|custl-1121-OUT,alpha-1121-OUT,voffset-7647-OUT;n:type:ShaderForge.SFN_Dot,id:4462,x:32858,y:32503,varname:node_4462,prsc:2,dt:4|A-9341-OUT,B-4763-OUT;n:type:ShaderForge.SFN_NormalVector,id:9341,x:32447,y:32494,prsc:2,pt:False;n:type:ShaderForge.SFN_ViewVector,id:4763,x:32447,y:32642,varname:node_4763,prsc:2;n:type:ShaderForge.SFN_FragmentPosition,id:6546,x:32252,y:33094,varname:node_6546,prsc:2;n:type:ShaderForge.SFN_ComponentMask,id:4355,x:33002,y:32934,varname:node_4355,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-1771-OUT;n:type:ShaderForge.SFN_Multiply,id:3324,x:32467,y:33094,varname:node_3324,prsc:2|A-5746-OUT,B-6546-Z;n:type:ShaderForge.SFN_Vector1,id:5746,x:32274,y:33026,varname:node_5746,prsc:2,v1:0.1;n:type:ShaderForge.SFN_NormalVector,id:9007,x:32824,y:32737,prsc:2,pt:False;n:type:ShaderForge.SFN_Multiply,id:207,x:33002,y:32764,varname:node_207,prsc:2|A-9007-OUT,B-907-OUT;n:type:ShaderForge.SFN_Add,id:7647,x:33214,y:32918,varname:node_7647,prsc:2|A-207-OUT,B-4355-OUT;n:type:ShaderForge.SFN_Cos,id:1416,x:32645,y:32921,varname:node_1416,prsc:2|IN-3324-OUT;n:type:ShaderForge.SFN_Sin,id:1771,x:32824,y:33033,varname:node_1771,prsc:2|IN-3324-OUT;n:type:ShaderForge.SFN_Multiply,id:7893,x:33064,y:32525,varname:node_7893,prsc:2|A-4462-OUT,B-4462-OUT,C-4462-OUT,D-4462-OUT,E-4462-OUT;n:type:ShaderForge.SFN_RemapRange,id:3345,x:33314,y:32622,varname:node_3345,prsc:2,frmn:0,frmx:1,tomn:0.5,tomx:1|IN-7893-OUT;n:type:ShaderForge.SFN_Multiply,id:907,x:32824,y:32902,varname:node_907,prsc:2|A-2746-OUT,B-1416-OUT;n:type:ShaderForge.SFN_Vector1,id:2746,x:32623,y:32823,varname:node_2746,prsc:2,v1:2;n:type:ShaderForge.SFN_ViewPosition,id:5014,x:32635,y:33764,varname:node_5014,prsc:2;n:type:ShaderForge.SFN_FragmentPosition,id:1710,x:32635,y:33586,varname:node_1710,prsc:2;n:type:ShaderForge.SFN_Distance,id:1616,x:32878,y:33661,varname:node_1616,prsc:2|A-1710-XYZ,B-5014-XYZ;n:type:ShaderForge.SFN_Sin,id:948,x:33128,y:33423,varname:node_948,prsc:2|IN-1616-OUT;n:type:ShaderForge.SFN_Multiply,id:8182,x:33580,y:33182,varname:node_8182,prsc:2|A-4607-OUT,B-2356-OUT;n:type:ShaderForge.SFN_Vector1,id:4607,x:33281,y:33174,varname:node_4607,prsc:2,v1:0.025;n:type:ShaderForge.SFN_Add,id:1121,x:33553,y:32740,varname:node_1121,prsc:2|A-3345-OUT,B-8182-OUT;n:type:ShaderForge.SFN_Add,id:2356,x:33350,y:33334,varname:node_2356,prsc:2|A-6387-OUT,B-948-OUT;n:type:ShaderForge.SFN_Vector1,id:9774,x:32343,y:33361,varname:node_9774,prsc:2,v1:32;n:type:ShaderForge.SFN_Multiply,id:9468,x:32510,y:33265,varname:node_9468,prsc:2|A-3352-OUT,B-9774-OUT;n:type:ShaderForge.SFN_Sin,id:7007,x:32645,y:33207,varname:node_7007,prsc:2|IN-9468-OUT;n:type:ShaderForge.SFN_Cos,id:783,x:32645,y:33387,varname:node_783,prsc:2|IN-6565-OUT;n:type:ShaderForge.SFN_Multiply,id:6387,x:32862,y:33281,varname:node_6387,prsc:2|A-7007-OUT,B-783-OUT;n:type:ShaderForge.SFN_Multiply,id:6565,x:32510,y:33454,varname:node_6565,prsc:2|A-9774-OUT,B-7354-OUT;n:type:ShaderForge.SFN_Relay,id:3352,x:32343,y:33265,varname:node_3352,prsc:2|IN-927-R;n:type:ShaderForge.SFN_Relay,id:7354,x:32357,y:33472,varname:node_7354,prsc:2|IN-927-G;n:type:ShaderForge.SFN_ComponentMask,id:927,x:32168,y:33303,varname:node_927,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-9338-OUT;n:type:ShaderForge.SFN_Cross,id:9338,x:31888,y:33292,varname:node_9338,prsc:2|A-2720-OUT,B-1232-OUT;n:type:ShaderForge.SFN_NormalVector,id:1232,x:31690,y:33350,prsc:2,pt:False;n:type:ShaderForge.SFN_ViewVector,id:2720,x:31690,y:33175,varname:node_2720,prsc:2;pass:END;sub:END;*/

Shader "Shader Forge/Cloud" {
    Properties {
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="Geometry+500"
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                float node_3324 = (0.1*mul(unity_ObjectToWorld, v.vertex).b);
                v.vertex.xyz += ((v.normal*(2.0*cos(node_3324)))+sin(node_3324).r);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
////// Lighting:
                float node_4462 = 0.5*dot(i.normalDir,viewDirection)+0.5;
                float2 node_927 = cross(viewDirection,i.normalDir).rg;
                float node_9774 = 32.0;
                float node_9468 = (node_927.r*node_9774);
                float node_1121 = (((node_4462*node_4462*node_4462*node_4462*node_4462)*0.5+0.5)+(0.025*((sin(node_9468)*cos((node_9774*node_927.g)))+sin(distance(i.posWorld.rgb,_WorldSpaceCameraPos)))));
                float3 finalColor = float3(node_1121,node_1121,node_1121);
                return fixed4(finalColor,node_1121);
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
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                float node_3324 = (0.1*mul(unity_ObjectToWorld, v.vertex).b);
                v.vertex.xyz += ((v.normal*(2.0*cos(node_3324)))+sin(node_3324).r);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
