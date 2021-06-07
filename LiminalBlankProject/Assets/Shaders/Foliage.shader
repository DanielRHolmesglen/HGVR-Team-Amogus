// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:0,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:False,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.1098039,fgcg:0.1137255,fgcb:0.2705882,fgca:1,fgde:0.0059,fgrn:0,fgrf:200,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:32983,y:32584,varname:node_4013,prsc:2|diff-9204-OUT,emission-5357-OUT,transm-2418-OUT,voffset-7106-OUT;n:type:ShaderForge.SFN_VertexColor,id:8431,x:31191,y:32327,varname:node_8431,prsc:2;n:type:ShaderForge.SFN_Power,id:9204,x:32107,y:32250,varname:node_9204,prsc:2|VAL-8431-RGB,EXP-6560-OUT;n:type:ShaderForge.SFN_Vector1,id:6560,x:31905,y:32331,varname:node_6560,prsc:2,v1:2.5;n:type:ShaderForge.SFN_Fresnel,id:6702,x:31665,y:32517,varname:node_6702,prsc:2|EXP-7360-OUT;n:type:ShaderForge.SFN_Multiply,id:5357,x:32303,y:32489,varname:node_5357,prsc:2|A-2010-OUT,B-9455-OUT;n:type:ShaderForge.SFN_Vector1,id:2010,x:32137,y:32445,varname:node_2010,prsc:2,v1:0.05;n:type:ShaderForge.SFN_Vector1,id:7360,x:31472,y:32551,varname:node_7360,prsc:2,v1:1;n:type:ShaderForge.SFN_Sin,id:8358,x:31980,y:32507,varname:node_8358,prsc:2|IN-6172-OUT;n:type:ShaderForge.SFN_Multiply,id:6172,x:31826,y:32507,varname:node_6172,prsc:2|A-3262-OUT,B-6702-OUT;n:type:ShaderForge.SFN_Pi,id:3262,x:31682,y:32402,varname:node_3262,prsc:2;n:type:ShaderForge.SFN_OneMinus,id:9455,x:32137,y:32507,varname:node_9455,prsc:2|IN-8358-OUT;n:type:ShaderForge.SFN_Vector1,id:4376,x:31828,y:33327,varname:node_4376,prsc:2,v1:0.75;n:type:ShaderForge.SFN_Sign,id:8101,x:32082,y:33447,varname:node_8101,prsc:2|IN-9647-OUT;n:type:ShaderForge.SFN_Subtract,id:9647,x:32053,y:33308,varname:node_9647,prsc:2|A-3291-OUT,B-4376-OUT;n:type:ShaderForge.SFN_OneMinus,id:7096,x:32312,y:33306,varname:node_7096,prsc:2|IN-8904-OUT;n:type:ShaderForge.SFN_Clamp01,id:8904,x:32249,y:33447,varname:node_8904,prsc:2|IN-8101-OUT;n:type:ShaderForge.SFN_Time,id:9253,x:31674,y:33128,varname:node_9253,prsc:2;n:type:ShaderForge.SFN_FragmentPosition,id:6200,x:31495,y:32894,varname:node_6200,prsc:2;n:type:ShaderForge.SFN_Add,id:8555,x:32135,y:33101,varname:node_8555,prsc:2|A-5371-OUT,B-1465-OUT;n:type:ShaderForge.SFN_Add,id:6203,x:32152,y:32963,varname:node_6203,prsc:2|A-5675-OUT,B-1465-OUT;n:type:ShaderForge.SFN_Sin,id:3892,x:32297,y:32940,varname:node_3892,prsc:2|IN-6203-OUT;n:type:ShaderForge.SFN_Cos,id:8,x:32297,y:33121,varname:node_8,prsc:2|IN-8555-OUT;n:type:ShaderForge.SFN_Vector3,id:9596,x:32447,y:32914,varname:node_9596,prsc:2,v1:0.1,v2:0.1,v3:0;n:type:ShaderForge.SFN_Vector3,id:5015,x:32426,y:33052,varname:node_5015,prsc:2,v1:0,v2:0.1,v3:0.1;n:type:ShaderForge.SFN_Multiply,id:8606,x:32646,y:33162,varname:node_8606,prsc:2|A-5015-OUT,B-8-OUT;n:type:ShaderForge.SFN_Multiply,id:9869,x:32625,y:32949,varname:node_9869,prsc:2|A-9596-OUT,B-3892-OUT;n:type:ShaderForge.SFN_Add,id:4179,x:32815,y:33139,varname:node_4179,prsc:2|A-9869-OUT,B-8606-OUT;n:type:ShaderForge.SFN_Multiply,id:7106,x:33023,y:33232,varname:node_7106,prsc:2|A-4179-OUT,B-7096-OUT;n:type:ShaderForge.SFN_Multiply,id:5675,x:31894,y:32857,varname:node_5675,prsc:2|A-6200-X,B-9539-OUT;n:type:ShaderForge.SFN_Vector1,id:9539,x:31717,y:32928,varname:node_9539,prsc:2,v1:0.2;n:type:ShaderForge.SFN_Multiply,id:5371,x:31877,y:32988,varname:node_5371,prsc:2|A-9539-OUT,B-6200-Y;n:type:ShaderForge.SFN_Relay,id:3291,x:31489,y:33256,varname:node_3291,prsc:2|IN-8431-R;n:type:ShaderForge.SFN_Relay,id:2418,x:32655,y:33094,varname:node_2418,prsc:2|IN-7096-OUT;n:type:ShaderForge.SFN_Multiply,id:1465,x:31892,y:33128,varname:node_1465,prsc:2|A-2486-OUT,B-9253-T;n:type:ShaderForge.SFN_Vector1,id:2486,x:31691,y:33076,varname:node_2486,prsc:2,v1:1.2;pass:END;sub:END;*/

Shader "Shader Forge/Foliage" {
    Properties {
    }
    SubShader {
        Tags {
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
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma target 3.0
            uniform float4 _LightColor0;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                float4 vertexColor : COLOR;
                LIGHTING_COORDS(2,3)
                UNITY_FOG_COORDS(4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                float node_9539 = 0.2;
                float4 node_9253 = _Time;
                float node_1465 = (1.2*node_9253.g);
                float node_7096 = (1.0 - saturate(sign((o.vertexColor.r-0.75))));
                v.vertex.xyz += (((float3(0.1,0.1,0)*sin(((mul(unity_ObjectToWorld, v.vertex).r*node_9539)+node_1465)))+(float3(0,0.1,0.1)*cos(((node_9539*mul(unity_ObjectToWorld, v.vertex).g)+node_1465))))*node_7096);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = dot( normalDirection, lightDirection );
                float3 forwardLight = max(0.0, NdotL );
                float node_7096 = (1.0 - saturate(sign((i.vertexColor.r-0.75))));
                float node_2418 = node_7096;
                float3 backLight = max(0.0, -NdotL ) * float3(node_2418,node_2418,node_2418);
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = (forwardLight+backLight) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                float3 diffuseColor = pow(i.vertexColor.rgb,2.5);
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
////// Emissive:
                float node_5357 = (0.05*(1.0 - sin((3.141592654*pow(1.0-max(0,dot(normalDirection, viewDirection)),1.0)))));
                float3 emissive = float3(node_5357,node_5357,node_5357);
/// Final Color:
                float3 finalColor = diffuse + emissive;
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
            Cull Back
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma target 3.0
            struct VertexInput {
                float4 vertex : POSITION;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float4 posWorld : TEXCOORD1;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.vertexColor = v.vertexColor;
                float node_9539 = 0.2;
                float4 node_9253 = _Time;
                float node_1465 = (1.2*node_9253.g);
                float node_7096 = (1.0 - saturate(sign((o.vertexColor.r-0.75))));
                v.vertex.xyz += (((float3(0.1,0.1,0)*sin(((mul(unity_ObjectToWorld, v.vertex).r*node_9539)+node_1465)))+(float3(0,0.1,0.1)*cos(((node_9539*mul(unity_ObjectToWorld, v.vertex).g)+node_1465))))*node_7096);
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
