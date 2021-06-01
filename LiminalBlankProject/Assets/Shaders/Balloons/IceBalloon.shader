// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:False,igpj:True,qofs:500,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.1098039,fgcg:0.1137255,fgcb:0.2705882,fgca:1,fgde:0.0059,fgrn:0,fgrf:200,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33023,y:32743,varname:node_4013,prsc:2|diff-3639-OUT,spec-6591-OUT,gloss-5250-OUT,emission-3630-OUT,alpha-3703-OUT;n:type:ShaderForge.SFN_Vector1,id:6591,x:32841,y:32762,varname:node_6591,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Multiply,id:9828,x:32213,y:33604,varname:node_9828,prsc:2;n:type:ShaderForge.SFN_Vector1,id:5250,x:32841,y:32816,varname:node_5250,prsc:2,v1:0;n:type:ShaderForge.SFN_ObjectPosition,id:7200,x:32110,y:33217,varname:node_7200,prsc:2;n:type:ShaderForge.SFN_FragmentPosition,id:94,x:32110,y:33075,varname:node_94,prsc:2;n:type:ShaderForge.SFN_Subtract,id:8516,x:32400,y:33052,varname:node_8516,prsc:2|A-94-Y,B-7200-Y;n:type:ShaderForge.SFN_Sin,id:3703,x:32730,y:33052,varname:node_3703,prsc:2|IN-4079-OUT;n:type:ShaderForge.SFN_RemapRange,id:4079,x:32561,y:33052,varname:node_4079,prsc:2,frmn:-1,frmx:1,tomn:0.8,tomx:1|IN-8516-OUT;n:type:ShaderForge.SFN_Vector3,id:3051,x:32346,y:32644,varname:node_3051,prsc:0,v1:0.1,v2:0.5,v3:1;n:type:ShaderForge.SFN_NormalVector,id:8573,x:31865,y:32760,prsc:2,pt:False;n:type:ShaderForge.SFN_Lerp,id:3639,x:32654,y:32637,varname:node_3639,prsc:2|A-374-OUT,B-3051-OUT,T-5654-OUT;n:type:ShaderForge.SFN_Vector3,id:374,x:32346,y:32533,varname:node_374,prsc:0,v1:0.9,v2:0.9,v3:1;n:type:ShaderForge.SFN_Smoothstep,id:5654,x:32561,y:32896,varname:node_5654,prsc:2|A-6658-OUT,B-9929-OUT,V-3502-OUT;n:type:ShaderForge.SFN_Vector1,id:6658,x:32409,y:32772,varname:node_6658,prsc:2,v1:0.8;n:type:ShaderForge.SFN_Dot,id:773,x:32144,y:32863,varname:node_773,prsc:2,dt:1|A-8573-OUT,B-1074-OUT;n:type:ShaderForge.SFN_ViewVector,id:1074,x:31898,y:32943,varname:node_1074,prsc:2;n:type:ShaderForge.SFN_Vector1,id:9929,x:32409,y:32832,varname:node_9929,prsc:2,v1:0.4;n:type:ShaderForge.SFN_Multiply,id:3502,x:32367,y:32896,varname:node_3502,prsc:2|A-5927-OUT,B-773-OUT;n:type:ShaderForge.SFN_TexCoord,id:3865,x:31614,y:32541,varname:node_3865,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Sin,id:6808,x:32047,y:32631,varname:node_6808,prsc:2|IN-3253-OUT;n:type:ShaderForge.SFN_Multiply,id:3253,x:31849,y:32583,varname:node_3253,prsc:2|A-3865-U,B-3273-OUT;n:type:ShaderForge.SFN_RemapRange,id:5927,x:32191,y:32705,varname:node_5927,prsc:2,frmn:-1,frmx:1,tomn:0.8,tomx:1|IN-6808-OUT;n:type:ShaderForge.SFN_Pi,id:2730,x:31521,y:32743,varname:node_2730,prsc:2;n:type:ShaderForge.SFN_Multiply,id:3273,x:31659,y:32704,varname:node_3273,prsc:2|A-2730-OUT,B-4913-OUT;n:type:ShaderForge.SFN_Vector1,id:4913,x:31593,y:32948,varname:node_4913,prsc:2,v1:24;n:type:ShaderForge.SFN_Multiply,id:3630,x:32841,y:32883,varname:node_3630,prsc:2|A-3639-OUT,B-3911-OUT;n:type:ShaderForge.SFN_Vector1,id:3911,x:32681,y:32930,varname:node_3911,prsc:2,v1:0.25;pass:END;sub:END;*/

Shader "Shader Forge/Ice Balloon" {
    Properties {
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent+500"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma target 3.0
            uniform float4 _LightColor0;
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
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = 1;
                float3 attenColor = attenuation * _LightColor0.xyz;
///////// Gloss:
                float gloss = 0.0;
                float specPow = exp2( gloss * 10.0 + 1.0 );
////// Specular:
                float NdotL = saturate(dot( normalDirection, lightDirection ));
                float node_6591 = 0.5;
                float3 specularColor = float3(node_6591,node_6591,node_6591);
                float3 directSpecular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow)*specularColor;
                float3 specular = directSpecular;
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                float3 node_3639 = lerp(fixed3(0.9,0.9,1),fixed3(0.1,0.5,1),smoothstep( 0.8, 0.4, ((sin((i.uv0.r*(3.141592654*24.0)))*0.09999999+0.9)*max(0,dot(i.normalDir,viewDirection))) ));
                float3 diffuseColor = node_3639;
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
////// Emissive:
                float3 emissive = (node_3639*0.25);
/// Final Color:
                float3 finalColor = diffuse + specular + emissive;
                return fixed4(finalColor,sin(((i.posWorld.g-objPos.g)*0.09999999+0.9)));
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd
            #pragma target 3.0
            uniform float4 _LightColor0;
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
                LIGHTING_COORDS(3,4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
///////// Gloss:
                float gloss = 0.0;
                float specPow = exp2( gloss * 10.0 + 1.0 );
////// Specular:
                float NdotL = saturate(dot( normalDirection, lightDirection ));
                float node_6591 = 0.5;
                float3 specularColor = float3(node_6591,node_6591,node_6591);
                float3 directSpecular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow)*specularColor;
                float3 specular = directSpecular;
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 node_3639 = lerp(fixed3(0.9,0.9,1),fixed3(0.1,0.5,1),smoothstep( 0.8, 0.4, ((sin((i.uv0.r*(3.141592654*24.0)))*0.09999999+0.9)*max(0,dot(i.normalDir,viewDirection))) ));
                float3 diffuseColor = node_3639;
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse + specular;
                return fixed4(finalColor * sin(((i.posWorld.g-objPos.g)*0.09999999+0.9)),0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
