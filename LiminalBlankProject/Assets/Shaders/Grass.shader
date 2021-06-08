// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:0,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:False,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.1098039,fgcg:0.1137255,fgcb:0.2705882,fgca:1,fgde:0.0059,fgrn:0,fgrf:200,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:32981,y:32544,varname:node_4013,prsc:2|diff-9204-OUT,transm-709-OUT,lwrap-709-OUT,voffset-7106-OUT;n:type:ShaderForge.SFN_VertexColor,id:8431,x:31935,y:32604,varname:node_8431,prsc:2;n:type:ShaderForge.SFN_Power,id:9204,x:32296,y:32600,varname:node_9204,prsc:2|VAL-8431-RGB,EXP-6560-OUT;n:type:ShaderForge.SFN_Vector1,id:6560,x:32115,y:32673,varname:node_6560,prsc:2,v1:2.2;n:type:ShaderForge.SFN_Time,id:9253,x:31483,y:33054,varname:node_9253,prsc:2;n:type:ShaderForge.SFN_FragmentPosition,id:6200,x:31313,y:32820,varname:node_6200,prsc:2;n:type:ShaderForge.SFN_Add,id:8555,x:31945,y:33032,varname:node_8555,prsc:2|A-5371-OUT,B-1465-OUT;n:type:ShaderForge.SFN_Add,id:6203,x:31970,y:32889,varname:node_6203,prsc:2|A-5675-OUT,B-1465-OUT;n:type:ShaderForge.SFN_Sin,id:3892,x:32152,y:32897,varname:node_3892,prsc:2|IN-6203-OUT;n:type:ShaderForge.SFN_Cos,id:8,x:32137,y:33092,varname:node_8,prsc:2|IN-8555-OUT;n:type:ShaderForge.SFN_Vector3,id:9596,x:32137,y:32740,varname:node_9596,prsc:1,v1:0.17,v2:0.125,v3:0;n:type:ShaderForge.SFN_Vector3,id:5015,x:32137,y:33229,varname:node_5015,prsc:1,v1:0,v2:0.125,v3:0.17;n:type:ShaderForge.SFN_Multiply,id:8606,x:32346,y:33038,varname:node_8606,prsc:2|A-8-OUT,B-5015-OUT;n:type:ShaderForge.SFN_Multiply,id:9869,x:32346,y:32897,varname:node_9869,prsc:2|A-9596-OUT,B-3892-OUT;n:type:ShaderForge.SFN_Add,id:4179,x:32529,y:33002,varname:node_4179,prsc:2|A-9869-OUT,B-8606-OUT;n:type:ShaderForge.SFN_Multiply,id:7106,x:32746,y:33002,varname:node_7106,prsc:2|A-4179-OUT,B-9388-V;n:type:ShaderForge.SFN_Multiply,id:5675,x:31712,y:32783,varname:node_5675,prsc:2|A-6200-X,B-9539-OUT;n:type:ShaderForge.SFN_Vector1,id:9539,x:31535,y:32854,varname:node_9539,prsc:2,v1:3;n:type:ShaderForge.SFN_Multiply,id:5371,x:31695,y:32914,varname:node_5371,prsc:2|A-9539-OUT,B-6200-Y;n:type:ShaderForge.SFN_Multiply,id:1465,x:31710,y:33054,varname:node_1465,prsc:2|A-2486-OUT,B-9253-T;n:type:ShaderForge.SFN_Vector1,id:2486,x:31509,y:33002,varname:node_2486,prsc:2,v1:1;n:type:ShaderForge.SFN_TexCoord,id:9388,x:32529,y:33124,varname:node_9388,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Vector1,id:709,x:32808,y:32675,varname:node_709,prsc:0,v1:0.9;pass:END;sub:END;*/

Shader "Shader Forge/Grass" {
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
            Cull Off
            
            
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
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float4 vertexColor : COLOR;
                LIGHTING_COORDS(3,4)
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                float node_9539 = 3.0;
                float4 node_9253 = _Time;
                float node_1465 = (1.0*node_9253.g);
                v.vertex.xyz += (((half3(0.17,0.125,0)*sin(((mul(unity_ObjectToWorld, v.vertex).r*node_9539)+node_1465)))+(cos(((node_9539*mul(unity_ObjectToWorld, v.vertex).g)+node_1465))*half3(0,0.125,0.17)))*o.uv0.g);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = dot( normalDirection, lightDirection );
                fixed node_709 = 0.9;
                float3 w = float3(node_709,node_709,node_709)*0.5; // Light wrapping
                float3 NdotLWrap = NdotL * ( 1.0 - w );
                float3 forwardLight = max(float3(0.0,0.0,0.0), NdotLWrap + w );
                float3 backLight = max(float3(0.0,0.0,0.0), -NdotLWrap + w ) * float3(node_709,node_709,node_709);
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = (forwardLight+backLight) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                float3 diffuseColor = pow(i.vertexColor.rgb,2.2);
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
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
            Cull Off
            
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
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
                float4 posWorld : TEXCOORD2;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                float node_9539 = 3.0;
                float4 node_9253 = _Time;
                float node_1465 = (1.0*node_9253.g);
                v.vertex.xyz += (((half3(0.17,0.125,0)*sin(((mul(unity_ObjectToWorld, v.vertex).r*node_9539)+node_1465)))+(cos(((node_9539*mul(unity_ObjectToWorld, v.vertex).g)+node_1465))*half3(0,0.125,0.17)))*o.uv0.g);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
