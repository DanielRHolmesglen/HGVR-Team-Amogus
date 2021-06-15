// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:0,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:False,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:32981,y:32719,varname:node_4013,prsc:2|diff-6290-OUT,voffset-8988-OUT;n:type:ShaderForge.SFN_Tex2d,id:9626,x:32448,y:32574,varname:_Texture,prsc:2,tex:54ce3ce70f792a0438b440bbb91b3d2c,ntxv:0,isnm:False|UVIN-7413-OUT,TEX-1853-TEX;n:type:ShaderForge.SFN_TexCoord,id:2200,x:31615,y:32610,varname:node_2200,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_FragmentPosition,id:9493,x:30334,y:32634,varname:node_9493,prsc:2;n:type:ShaderForge.SFN_Sin,id:7729,x:31537,y:32933,varname:node_7729,prsc:2|IN-5442-OUT;n:type:ShaderForge.SFN_Cos,id:4342,x:31556,y:33136,varname:node_4342,prsc:2|IN-3742-OUT;n:type:ShaderForge.SFN_Add,id:7413,x:31909,y:32637,varname:node_7413,prsc:2|A-2200-UVOUT,B-9353-OUT,C-6066-OUT;n:type:ShaderForge.SFN_Vector2,id:5650,x:31513,y:32795,varname:node_5650,prsc:0,v1:0,v2:0.0025;n:type:ShaderForge.SFN_Multiply,id:9353,x:31725,y:32968,varname:node_9353,prsc:2|A-5650-OUT,B-7729-OUT;n:type:ShaderForge.SFN_Multiply,id:6066,x:32018,y:33124,varname:node_6066,prsc:2|A-4342-OUT,B-575-OUT;n:type:ShaderForge.SFN_Vector2,id:575,x:31834,y:33234,varname:node_575,prsc:0,v1:0,v2:0.0025;n:type:ShaderForge.SFN_ViewPosition,id:1622,x:30283,y:33104,varname:node_1622,prsc:2;n:type:ShaderForge.SFN_FragmentPosition,id:566,x:30267,y:32966,varname:node_566,prsc:2;n:type:ShaderForge.SFN_Relay,id:9648,x:31162,y:32985,varname:node_9648,prsc:2|IN-1122-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:5263,x:31999,y:33586,varname:node_5263,prsc:2;n:type:ShaderForge.SFN_ViewPosition,id:6070,x:31980,y:33444,varname:node_6070,prsc:2;n:type:ShaderForge.SFN_Subtract,id:2851,x:32186,y:33488,varname:node_2851,prsc:2|A-6070-XYZ,B-5263-XYZ;n:type:ShaderForge.SFN_Transform,id:7015,x:32387,y:33488,varname:node_7015,prsc:2,tffrom:0,tfto:1|IN-2851-OUT;n:type:ShaderForge.SFN_Normalize,id:9091,x:32565,y:33488,varname:node_9091,prsc:2|IN-7015-XYZ;n:type:ShaderForge.SFN_Vector1,id:5060,x:32424,y:33246,varname:node_5060,prsc:2,v1:0.25;n:type:ShaderForge.SFN_Multiply,id:8988,x:32734,y:33186,varname:node_8988,prsc:2|A-5060-OUT,B-9091-OUT;n:type:ShaderForge.SFN_Add,id:8735,x:32316,y:32909,varname:node_8735,prsc:2|A-7413-OUT,B-3144-OUT;n:type:ShaderForge.SFN_Tex2d,id:6222,x:32494,y:32865,varname:_Texture_copy,prsc:2,tex:54ce3ce70f792a0438b440bbb91b3d2c,ntxv:0,isnm:False|UVIN-8735-OUT,TEX-1853-TEX;n:type:ShaderForge.SFN_Lerp,id:6290,x:32762,y:32719,varname:node_6290,prsc:2|A-9626-RGB,B-6222-RGB,T-4590-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:1853,x:32254,y:32703,ptovrint:False,ptlb:node_1853,ptin:_node_1853,varname:_node_1853,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:54ce3ce70f792a0438b440bbb91b3d2c,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Vector1,id:4590,x:32562,y:32822,varname:node_4590,prsc:2,v1:0.5;n:type:ShaderForge.SFN_DDXY,id:3144,x:32048,y:32915,varname:node_3144,prsc:2|IN-2200-V;n:type:ShaderForge.SFN_Distance,id:3183,x:30481,y:33104,varname:node_3183,prsc:2|A-3987-OUT,B-1622-XYZ;n:type:ShaderForge.SFN_Subtract,id:3987,x:30671,y:32750,varname:node_3987,prsc:2|A-9493-XYZ,B-1605-OUT;n:type:ShaderForge.SFN_ComponentMask,id:6765,x:30968,y:32731,varname:node_6765,prsc:2,cc1:0,cc2:2,cc3:-1,cc4:-1|IN-3987-OUT;n:type:ShaderForge.SFN_Multiply,id:5442,x:31318,y:32885,varname:node_5442,prsc:2|A-6765-R,B-9648-OUT;n:type:ShaderForge.SFN_Multiply,id:3742,x:31305,y:33158,varname:node_3742,prsc:2|A-9648-OUT,B-6765-G;n:type:ShaderForge.SFN_RemapRange,id:6910,x:30743,y:33091,varname:node_6910,prsc:2,frmn:0,frmx:1000,tomn:4,tomx:0|IN-3183-OUT;n:type:ShaderForge.SFN_ConstantClamp,id:1122,x:30965,y:33091,varname:node_1122,prsc:2,min:0,max:4|IN-6910-OUT;n:type:ShaderForge.SFN_Multiply,id:1605,x:30510,y:32899,varname:node_1605,prsc:2|A-1210-OUT,B-1622-XYZ;n:type:ShaderForge.SFN_Vector1,id:1210,x:30317,y:32840,varname:node_1210,prsc:2,v1:0.25;proporder:1853;pass:END;sub:END;*/

Shader "Shader Forge/IslandTerrain" {
    Properties {
        _node_1853 ("node_1853", 2D) = "white" {}
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
            uniform sampler2D _node_1853; uniform float4 _node_1853_ST;
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
                float3 node_3987 = (i.posWorld.rgb-(0.25*_WorldSpaceCameraPos));
                float2 node_6765 = node_3987.rb;
                float node_9648 = clamp((distance(node_3987,_WorldSpaceCameraPos)*-0.004+4.0),0,4);
                float2 node_7413 = (i.uv0+(fixed2(0,0.0025)*sin((node_6765.r*node_9648)))+(cos((node_9648*node_6765.g))*fixed2(0,0.0025)));
                float4 _Texture = tex2D(_node_1853,TRANSFORM_TEX(node_7413, _node_1853));
                float2 node_8735 = (node_7413+fwidth(i.uv0.g));
                float4 _Texture_copy = tex2D(_node_1853,TRANSFORM_TEX(node_8735, _node_1853));
                float3 diffuseColor = lerp(_Texture.rgb,_Texture_copy.rgb,0.5);
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
