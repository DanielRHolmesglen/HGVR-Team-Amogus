// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:False,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:32981,y:32719,varname:node_4013,prsc:2|diff-9626-RGB,voffset-8988-OUT;n:type:ShaderForge.SFN_Tex2d,id:9626,x:32476,y:32714,ptovrint:False,ptlb:Texture,ptin:_Texture,varname:_Texture,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:54ce3ce70f792a0438b440bbb91b3d2c,ntxv:0,isnm:False|UVIN-7413-OUT;n:type:ShaderForge.SFN_TexCoord,id:2200,x:31620,y:32720,varname:node_2200,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_FragmentPosition,id:9493,x:30760,y:32756,varname:node_9493,prsc:2;n:type:ShaderForge.SFN_Sin,id:7729,x:31599,y:32921,varname:node_7729,prsc:2|IN-624-OUT;n:type:ShaderForge.SFN_Cos,id:4342,x:31589,y:33134,varname:node_4342,prsc:2|IN-9836-OUT;n:type:ShaderForge.SFN_Add,id:7413,x:32275,y:32763,varname:node_7413,prsc:2|A-2200-UVOUT,B-9353-OUT,C-6066-OUT;n:type:ShaderForge.SFN_Vector2,id:5650,x:31808,y:32798,varname:node_5650,prsc:0,v1:0,v2:0.0025;n:type:ShaderForge.SFN_Multiply,id:9353,x:31989,y:32949,varname:node_9353,prsc:2|A-5650-OUT,B-7729-OUT;n:type:ShaderForge.SFN_Multiply,id:6066,x:32018,y:33124,varname:node_6066,prsc:2|A-4342-OUT,B-575-OUT;n:type:ShaderForge.SFN_Vector2,id:575,x:31834,y:33234,varname:node_575,prsc:0,v1:0,v2:0.0025;n:type:ShaderForge.SFN_Multiply,id:624,x:31397,y:32885,varname:node_624,prsc:2|A-9493-X,B-9648-OUT;n:type:ShaderForge.SFN_Multiply,id:9836,x:31353,y:33177,varname:node_9836,prsc:2|A-9648-OUT,B-9493-Z;n:type:ShaderForge.SFN_Add,id:2370,x:31075,y:32762,varname:node_2370,prsc:2|A-9493-X,B-9493-Y;n:type:ShaderForge.SFN_Add,id:9966,x:31104,y:33208,varname:node_9966,prsc:2|A-9493-Y,B-9493-Z;n:type:ShaderForge.SFN_ViewPosition,id:1622,x:29759,y:33220,varname:node_1622,prsc:2;n:type:ShaderForge.SFN_FragmentPosition,id:566,x:29692,y:32900,varname:node_566,prsc:2;n:type:ShaderForge.SFN_Distance,id:6234,x:29892,y:32957,varname:node_6234,prsc:2|A-566-XYZ,B-1622-XYZ;n:type:ShaderForge.SFN_Relay,id:9648,x:31070,y:33056,varname:node_9648,prsc:2|IN-4306-OUT;n:type:ShaderForge.SFN_Multiply,id:8739,x:30208,y:33101,varname:node_8739,prsc:2|A-6234-OUT,B-7937-OUT;n:type:ShaderForge.SFN_Vector1,id:7937,x:30026,y:33249,varname:node_7937,prsc:2,v1:0.001;n:type:ShaderForge.SFN_RemapRange,id:4306,x:30885,y:33091,varname:node_4306,prsc:2,frmn:0,frmx:1,tomn:0,tomx:6|IN-392-OUT;n:type:ShaderForge.SFN_Clamp01,id:7378,x:30389,y:33101,varname:node_7378,prsc:2|IN-8739-OUT;n:type:ShaderForge.SFN_OneMinus,id:3139,x:30521,y:32937,varname:node_3139,prsc:2|IN-7378-OUT;n:type:ShaderForge.SFN_Multiply,id:392,x:30714,y:33022,varname:node_392,prsc:2|A-3139-OUT,B-3139-OUT,C-3139-OUT,D-3139-OUT,E-3139-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:5263,x:31999,y:33586,varname:node_5263,prsc:2;n:type:ShaderForge.SFN_ViewPosition,id:6070,x:31980,y:33444,varname:node_6070,prsc:2;n:type:ShaderForge.SFN_Subtract,id:2851,x:32186,y:33488,varname:node_2851,prsc:2|A-6070-XYZ,B-5263-XYZ;n:type:ShaderForge.SFN_Transform,id:7015,x:32387,y:33488,varname:node_7015,prsc:2,tffrom:0,tfto:1|IN-2851-OUT;n:type:ShaderForge.SFN_Normalize,id:9091,x:32565,y:33488,varname:node_9091,prsc:2|IN-7015-XYZ;n:type:ShaderForge.SFN_Vector1,id:5060,x:32426,y:33176,varname:node_5060,prsc:2,v1:0.25;n:type:ShaderForge.SFN_Multiply,id:8988,x:32734,y:33186,varname:node_8988,prsc:2|A-5060-OUT,B-9091-OUT;proporder:9626;pass:END;sub:END;*/

Shader "Shader Forge/IslandTerrain" {
    Properties {
        _Texture ("Texture", 2D) = "white" {}
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
            uniform sampler2D _Texture; uniform float4 _Texture_ST;
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
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                v.vertex.xyz += (0.25*normalize(mul( unity_WorldToObject, float4((_WorldSpaceCameraPos-mul(unity_ObjectToWorld, v.vertex).rgb),0) ).xyz.rgb));
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                float node_3139 = (1.0 - saturate((distance(i.posWorld.rgb,_WorldSpaceCameraPos)*0.001)));
                float node_9648 = ((node_3139*node_3139*node_3139*node_3139*node_3139)*6.0+0.0);
                float2 node_7413 = (i.uv0+(fixed2(0,0.0025)*sin((i.posWorld.r*node_9648)))+(cos((node_9648*i.posWorld.b))*fixed2(0,0.0025)));
                float4 _Texture_var = tex2D(_Texture,TRANSFORM_TEX(node_7413, _Texture));
                float3 diffuseColor = _Texture_var.rgb;
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
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform sampler2D _Texture; uniform float4 _Texture_ST;
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
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                v.vertex.xyz += (0.25*normalize(mul( unity_WorldToObject, float4((_WorldSpaceCameraPos-mul(unity_ObjectToWorld, v.vertex).rgb),0) ).xyz.rgb));
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float node_3139 = (1.0 - saturate((distance(i.posWorld.rgb,_WorldSpaceCameraPos)*0.001)));
                float node_9648 = ((node_3139*node_3139*node_3139*node_3139*node_3139)*6.0+0.0);
                float2 node_7413 = (i.uv0+(fixed2(0,0.0025)*sin((i.posWorld.r*node_9648)))+(cos((node_9648*i.posWorld.b))*fixed2(0,0.0025)));
                float4 _Texture_var = tex2D(_Texture,TRANSFORM_TEX(node_7413, _Texture));
                float3 diffuseColor = _Texture_var.rgb;
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
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
                v.vertex.xyz += (0.25*normalize(mul( unity_WorldToObject, float4((_WorldSpaceCameraPos-mul(unity_ObjectToWorld, v.vertex).rgb),0) ).xyz.rgb));
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
