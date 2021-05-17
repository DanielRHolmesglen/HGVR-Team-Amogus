// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:32754,y:32713,varname:node_4013,prsc:2|diff-6751-OUT,spec-6538-OUT,gloss-8293-OUT,voffset-3038-OUT;n:type:ShaderForge.SFN_Color,id:2103,x:31876,y:32390,ptovrint:False,ptlb:node_2103,ptin:_node_2103,varname:_node_2103,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0.724144,c3:1,c4:1;n:type:ShaderForge.SFN_Time,id:6936,x:31031,y:33109,varname:node_6936,prsc:2;n:type:ShaderForge.SFN_Sin,id:5909,x:31645,y:33187,varname:node_5909,prsc:1|IN-3738-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:9405,x:31026,y:32695,varname:node_9405,prsc:2;n:type:ShaderForge.SFN_Vector3,id:3288,x:32071,y:33099,varname:node_3288,prsc:1,v1:0,v2:0.5,v3:0;n:type:ShaderForge.SFN_Multiply,id:3038,x:32303,y:33158,varname:node_3038,prsc:2|A-3288-OUT,B-5656-OUT;n:type:ShaderForge.SFN_Multiply,id:9659,x:31302,y:32883,varname:node_9659,prsc:2|A-9405-X,B-8213-OUT;n:type:ShaderForge.SFN_Vector1,id:8213,x:30969,y:32879,varname:node_8213,prsc:2,v1:0.1;n:type:ShaderForge.SFN_Multiply,id:8598,x:31302,y:33057,varname:node_8598,prsc:2|A-9405-Z,B-3134-OUT;n:type:ShaderForge.SFN_Vector1,id:3134,x:30957,y:32966,varname:node_3134,prsc:2,v1:0.1;n:type:ShaderForge.SFN_Lerp,id:6751,x:32244,y:32713,varname:node_6751,prsc:2|A-2103-RGB,B-4037-RGB,T-668-OUT;n:type:ShaderForge.SFN_RemapRangeAdvanced,id:668,x:32035,y:32880,varname:node_668,prsc:1|IN-5656-OUT,IMIN-1850-OUT,IMAX-5600-OUT,OMIN-3225-OUT,OMAX-5600-OUT;n:type:ShaderForge.SFN_Vector1,id:1850,x:31796,y:32846,varname:node_1850,prsc:1,v1:-1;n:type:ShaderForge.SFN_Vector1,id:5600,x:31796,y:33013,varname:node_5600,prsc:1,v1:1;n:type:ShaderForge.SFN_Vector1,id:3225,x:31796,y:32942,varname:node_3225,prsc:1,v1:0;n:type:ShaderForge.SFN_Noise,id:3425,x:32465,y:32439,varname:node_3425,prsc:2;n:type:ShaderForge.SFN_Sin,id:5400,x:31645,y:33037,varname:node_5400,prsc:1|IN-6184-OUT;n:type:ShaderForge.SFN_Add,id:6184,x:31469,y:32995,varname:node_6184,prsc:2|A-9659-OUT,B-6936-T;n:type:ShaderForge.SFN_Add,id:5656,x:31815,y:33240,varname:node_5656,prsc:2|A-5400-OUT,B-5909-OUT;n:type:ShaderForge.SFN_Add,id:3738,x:31469,y:33214,varname:node_3738,prsc:2|A-8598-OUT,B-6936-T;n:type:ShaderForge.SFN_Color,id:4037,x:31876,y:32643,ptovrint:False,ptlb:node_2103_copy,ptin:_node_2103_copy,varname:_node_2103_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Vector1,id:6538,x:32561,y:32742,varname:node_6538,prsc:1,v1:1;n:type:ShaderForge.SFN_Vector1,id:298,x:31924,y:32974,varname:node_298,prsc:1,v1:-1;n:type:ShaderForge.SFN_Vector1,id:8293,x:32541,y:32791,varname:node_8293,prsc:1,v1:0.5;proporder:2103-4037;pass:END;sub:END;*/

Shader "Shader Forge/Ocean" {
    Properties {
        _node_2103 ("node_2103", Color) = (0,0.724144,1,1)
        _node_2103_copy ("node_2103_copy", Color) = (1,1,1,1)
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
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma target 3.0
            uniform float4 _LightColor0;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _node_2103)
                UNITY_DEFINE_INSTANCED_PROP( float4, _node_2103_copy)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                LIGHTING_COORDS(2,3)
                UNITY_FOG_COORDS(4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                float4 node_6936 = _Time;
                float node_5656 = (sin(((mul(unity_ObjectToWorld, v.vertex).r*0.1)+node_6936.g))+sin(((mul(unity_ObjectToWorld, v.vertex).b*0.1)+node_6936.g)));
                v.vertex.xyz += (half3(0,0.5,0)*node_5656);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
///////// Gloss:
                float gloss = 0.5;
                float specPow = exp2( gloss * 10.0 + 1.0 );
////// Specular:
                float NdotL = saturate(dot( normalDirection, lightDirection ));
                half node_6538 = 1.0;
                float3 specularColor = float3(node_6538,node_6538,node_6538);
                float3 directSpecular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow)*specularColor;
                float3 specular = directSpecular;
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                float4 _node_2103_var = UNITY_ACCESS_INSTANCED_PROP( Props, _node_2103 );
                float4 _node_2103_copy_var = UNITY_ACCESS_INSTANCED_PROP( Props, _node_2103_copy );
                float4 node_6936 = _Time;
                float node_5656 = (sin(((i.posWorld.r*0.1)+node_6936.g))+sin(((i.posWorld.b*0.1)+node_6936.g)));
                half node_1850 = (-1.0);
                half node_5600 = 1.0;
                half node_3225 = 0.0;
                float3 diffuseColor = lerp(_node_2103_var.rgb,_node_2103_copy_var.rgb,(node_3225 + ( (node_5656 - node_1850) * (node_5600 - node_3225) ) / (node_5600 - node_1850)));
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse + specular;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma target 3.0
            uniform float4 _LightColor0;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _node_2103)
                UNITY_DEFINE_INSTANCED_PROP( float4, _node_2103_copy)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                LIGHTING_COORDS(2,3)
                UNITY_FOG_COORDS(4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                float4 node_6936 = _Time;
                float node_5656 = (sin(((mul(unity_ObjectToWorld, v.vertex).r*0.1)+node_6936.g))+sin(((mul(unity_ObjectToWorld, v.vertex).b*0.1)+node_6936.g)));
                v.vertex.xyz += (half3(0,0.5,0)*node_5656);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
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
                float gloss = 0.5;
                float specPow = exp2( gloss * 10.0 + 1.0 );
////// Specular:
                float NdotL = saturate(dot( normalDirection, lightDirection ));
                half node_6538 = 1.0;
                float3 specularColor = float3(node_6538,node_6538,node_6538);
                float3 directSpecular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow)*specularColor;
                float3 specular = directSpecular;
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float4 _node_2103_var = UNITY_ACCESS_INSTANCED_PROP( Props, _node_2103 );
                float4 _node_2103_copy_var = UNITY_ACCESS_INSTANCED_PROP( Props, _node_2103_copy );
                float4 node_6936 = _Time;
                float node_5656 = (sin(((i.posWorld.r*0.1)+node_6936.g))+sin(((i.posWorld.b*0.1)+node_6936.g)));
                half node_1850 = (-1.0);
                half node_5600 = 1.0;
                half node_3225 = 0.0;
                float3 diffuseColor = lerp(_node_2103_var.rgb,_node_2103_copy_var.rgb,(node_3225 + ( (node_5656 - node_1850) * (node_5600 - node_3225) ) / (node_5600 - node_1850)));
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse + specular;
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
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
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float4 posWorld : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                float4 node_6936 = _Time;
                float node_5656 = (sin(((mul(unity_ObjectToWorld, v.vertex).r*0.1)+node_6936.g))+sin(((mul(unity_ObjectToWorld, v.vertex).b*0.1)+node_6936.g)));
                v.vertex.xyz += (half3(0,0.5,0)*node_5656);
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
