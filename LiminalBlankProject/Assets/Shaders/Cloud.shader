// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:500,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:5,stps:4,stfa:1,stfz:1,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33427,y:32697,varname:node_9361,prsc:2|custl-8383-OUT,voffset-7647-OUT;n:type:ShaderForge.SFN_Dot,id:4462,x:32686,y:32792,varname:node_4462,prsc:2,dt:0|A-9341-OUT,B-4763-OUT;n:type:ShaderForge.SFN_NormalVector,id:9341,x:32466,y:32727,prsc:2,pt:False;n:type:ShaderForge.SFN_ViewVector,id:4763,x:32441,y:32919,varname:node_4763,prsc:2;n:type:ShaderForge.SFN_RemapRange,id:8383,x:32929,y:32734,varname:node_8383,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-4462-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:6546,x:32460,y:33036,varname:node_6546,prsc:2;n:type:ShaderForge.SFN_ComponentMask,id:4355,x:32996,y:33118,varname:node_4355,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-1771-OUT;n:type:ShaderForge.SFN_Multiply,id:3324,x:32646,y:33073,varname:node_3324,prsc:2|A-5746-OUT,B-6546-Z;n:type:ShaderForge.SFN_Vector1,id:5746,x:32538,y:32969,varname:node_5746,prsc:2,v1:0.2;n:type:ShaderForge.SFN_NormalVector,id:9007,x:32803,y:32892,prsc:2,pt:False;n:type:ShaderForge.SFN_Multiply,id:207,x:33006,y:32915,varname:node_207,prsc:2|A-9007-OUT,B-1416-OUT;n:type:ShaderForge.SFN_Add,id:7647,x:33189,y:33037,varname:node_7647,prsc:2|A-207-OUT,B-4355-OUT;n:type:ShaderForge.SFN_Cos,id:1416,x:32836,y:33041,varname:node_1416,prsc:2|IN-3324-OUT;n:type:ShaderForge.SFN_Sin,id:1771,x:32803,y:33155,varname:node_1771,prsc:2|IN-3324-OUT;pass:END;sub:END;*/

Shader "Shader Forge/Cloud" {
    Properties {
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
                float node_3324 = (0.2*mul(unity_ObjectToWorld, v.vertex).b);
                v.vertex.xyz += ((v.normal*cos(node_3324))+sin(node_3324).r);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
////// Lighting:
                float node_8383 = (dot(i.normalDir,viewDirection)*0.5+0.5);
                float3 finalColor = float3(node_8383,node_8383,node_8383);
                return fixed4(finalColor,1);
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
                float node_3324 = (0.2*mul(unity_ObjectToWorld, v.vertex).b);
                v.vertex.xyz += ((v.normal*cos(node_3324))+sin(node_3324).r);
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
