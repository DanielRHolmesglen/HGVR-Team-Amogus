// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:False,rfrpn:Refraction,coma:15,ufog:False,aust:False,igpj:True,qofs:600,qpre:1,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:32872,y:32669,varname:node_4013,prsc:2|diff-6751-OUT,spec-6538-OUT,gloss-8293-OUT,alpha-9846-OUT;n:type:ShaderForge.SFN_Color,id:2103,x:32020,y:32299,ptovrint:False,ptlb:Water,ptin:_Water,varname:_Water,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0.724144,c3:1,c4:1;n:type:ShaderForge.SFN_FragmentPosition,id:9405,x:30521,y:32923,varname:node_9405,prsc:2;n:type:ShaderForge.SFN_Lerp,id:6751,x:32199,y:32676,varname:node_6751,prsc:2|A-2103-RGB,B-4037-RGB,T-7915-OUT;n:type:ShaderForge.SFN_Noise,id:3425,x:32465,y:32439,varname:node_3425,prsc:2;n:type:ShaderForge.SFN_Color,id:4037,x:31957,y:32621,ptovrint:False,ptlb:Foam,ptin:_Foam,varname:_Foam,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Vector1,id:6538,x:32561,y:32742,varname:node_6538,prsc:1,v1:1;n:type:ShaderForge.SFN_Vector1,id:8293,x:32541,y:32791,varname:node_8293,prsc:1,v1:0.5;n:type:ShaderForge.SFN_ComponentMask,id:7149,x:30685,y:32976,varname:node_7149,prsc:2,cc1:0,cc2:2,cc3:-1,cc4:-1|IN-9405-XYZ;n:type:ShaderForge.SFN_Multiply,id:973,x:30849,y:32946,varname:node_973,prsc:2|A-7102-OUT,B-7149-OUT;n:type:ShaderForge.SFN_Vector1,id:7102,x:30669,y:32896,varname:node_7102,prsc:2,v1:0.002;n:type:ShaderForge.SFN_Vector2,id:7451,x:30442,y:32676,varname:node_7451,prsc:2,v1:0.001,v2:0.001;n:type:ShaderForge.SFN_Multiply,id:5278,x:30669,y:32756,varname:node_5278,prsc:2|A-7451-OUT,B-569-T;n:type:ShaderForge.SFN_Time,id:569,x:30255,y:32874,varname:node_569,prsc:2;n:type:ShaderForge.SFN_Add,id:5328,x:31073,y:32797,varname:node_5328,prsc:2|A-5278-OUT,B-973-OUT;n:type:ShaderForge.SFN_Relay,id:7915,x:32240,y:33026,varname:node_7915,prsc:2|IN-9292-OUT;n:type:ShaderForge.SFN_Tex2d,id:1557,x:31319,y:32586,varname:_NoiseTex,prsc:2,tex:3f500a2c37d5ff849bb23c1c7935d07e,ntxv:0,isnm:False|UVIN-9933-OUT,TEX-1219-TEX;n:type:ShaderForge.SFN_Tex2dAsset,id:1219,x:31023,y:32411,ptovrint:False,ptlb:Noise,ptin:_Noise,varname:_Noise,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:3f500a2c37d5ff849bb23c1c7935d07e,ntxv:3,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:1275,x:31370,y:32953,varname:_node_5435,prsc:2,tex:3f500a2c37d5ff849bb23c1c7935d07e,ntxv:0,isnm:False|UVIN-5328-OUT,TEX-1219-TEX;n:type:ShaderForge.SFN_Multiply,id:740,x:31561,y:33019,varname:node_740,prsc:2|A-1557-R,B-1275-R;n:type:ShaderForge.SFN_Vector1,id:5839,x:31526,y:32708,varname:node_5839,prsc:2,v1:0.01;n:type:ShaderForge.SFN_Vector1,id:1681,x:31526,y:32821,varname:node_1681,prsc:2,v1:0.04;n:type:ShaderForge.SFN_Smoothstep,id:9395,x:31810,y:32761,varname:node_9395,prsc:2|A-5839-OUT,B-1681-OUT,V-740-OUT;n:type:ShaderForge.SFN_Smoothstep,id:8400,x:31810,y:32916,varname:node_8400,prsc:2|A-3575-OUT,B-18-OUT,V-740-OUT;n:type:ShaderForge.SFN_Vector1,id:3575,x:31623,y:32882,varname:node_3575,prsc:2,v1:0.008;n:type:ShaderForge.SFN_Vector1,id:18,x:31623,y:32936,varname:node_18,prsc:2,v1:0.038;n:type:ShaderForge.SFN_Subtract,id:551,x:31986,y:32862,varname:node_551,prsc:2|A-8400-OUT,B-9395-OUT;n:type:ShaderForge.SFN_Add,id:9292,x:32024,y:33090,varname:node_9292,prsc:2|A-551-OUT,B-1847-OUT;n:type:ShaderForge.SFN_Vector1,id:7845,x:31687,y:33174,varname:node_7845,prsc:2,v1:0.15;n:type:ShaderForge.SFN_Multiply,id:1847,x:31868,y:33145,varname:node_1847,prsc:2|A-6680-OUT,B-7845-OUT;n:type:ShaderForge.SFN_OneMinus,id:6680,x:31717,y:33055,varname:node_6680,prsc:2|IN-740-OUT;n:type:ShaderForge.SFN_Multiply,id:534,x:32149,y:33540,varname:node_534,prsc:2|A-7697-OUT,B-7697-OUT;n:type:ShaderForge.SFN_ComponentMask,id:308,x:32309,y:33540,varname:node_308,prsc:2,cc1:0,cc2:1,cc3:2,cc4:-1|IN-534-OUT;n:type:ShaderForge.SFN_Add,id:9318,x:32483,y:33540,varname:node_9318,prsc:2|A-308-R,B-308-G,C-308-B;n:type:ShaderForge.SFN_Sqrt,id:5366,x:32647,y:33540,varname:node_5366,prsc:2|IN-9318-OUT;n:type:ShaderForge.SFN_Clamp01,id:8066,x:33114,y:33505,varname:node_8066,prsc:2|IN-4337-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:1823,x:31684,y:33537,varname:node_1823,prsc:2;n:type:ShaderForge.SFN_ViewPosition,id:9234,x:31730,y:33678,varname:node_9234,prsc:2;n:type:ShaderForge.SFN_Subtract,id:7697,x:31889,y:33509,varname:node_7697,prsc:2|A-1823-XYZ,B-9234-XYZ;n:type:ShaderForge.SFN_RemapRange,id:4337,x:32826,y:33504,varname:node_4337,prsc:2,frmn:0,frmx:3500,tomn:1.2,tomx:0|IN-5366-OUT;n:type:ShaderForge.SFN_Multiply,id:9846,x:33299,y:33487,varname:node_9846,prsc:2|A-8066-OUT,B-8066-OUT,C-8066-OUT,D-8066-OUT,E-8066-OUT;n:type:ShaderForge.SFN_Vector2,id:1408,x:30442,y:32537,varname:node_1408,prsc:2,v1:0.09231,v2:0.0231;n:type:ShaderForge.SFN_Multiply,id:8685,x:30669,y:32551,varname:node_8685,prsc:2|A-1408-OUT,B-569-T;n:type:ShaderForge.SFN_Add,id:7769,x:30894,y:32592,varname:node_7769,prsc:2|A-8685-OUT,B-973-OUT;n:type:ShaderForge.SFN_Multiply,id:9933,x:31121,y:32614,varname:node_9933,prsc:2|A-7769-OUT,B-6948-OUT;n:type:ShaderForge.SFN_Vector1,id:8062,x:32850,y:32845,varname:node_8062,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:6948,x:31000,y:32703,varname:node_6948,prsc:2,v1:1.76534;proporder:2103-4037-1219;pass:END;sub:END;*/

Shader "Shader Forge/Ocean" {
    Properties {
        _Water ("Water", Color) = (0,0.724144,1,1)
        _Foam ("Foam", Color) = (1,1,1,1)
        _Noise ("Noise", 2D) = "bump" {}
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Geometry+600"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform sampler2D _Noise; uniform float4 _Noise_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _Water)
                UNITY_DEFINE_INSTANCED_PROP( float4, _Foam)
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
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
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
                float attenuation = 1;
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
                float4 _Water_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Water );
                float4 _Foam_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Foam );
                float4 node_569 = _Time;
                float2 node_973 = (0.002*i.posWorld.rgb.rb);
                float2 node_9933 = (((float2(0.09231,0.0231)*node_569.g)+node_973)*1.76534);
                float4 _NoiseTex = tex2D(_Noise,TRANSFORM_TEX(node_9933, _Noise));
                float2 node_5328 = ((float2(0.001,0.001)*node_569.g)+node_973);
                float4 _node_5435 = tex2D(_Noise,TRANSFORM_TEX(node_5328, _Noise));
                float node_740 = (_NoiseTex.r*_node_5435.r);
                float3 diffuseColor = lerp(_Water_var.rgb,_Foam_var.rgb,((smoothstep( 0.008, 0.038, node_740 )-smoothstep( 0.01, 0.04, node_740 ))+((1.0 - node_740)*0.15)));
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse + specular;
                float3 node_7697 = (i.posWorld.rgb-_WorldSpaceCameraPos);
                float3 node_308 = (node_7697*node_7697).rgb;
                float node_8066 = saturate((sqrt((node_308.r+node_308.g+node_308.b))*-0.0003428572+1.2));
                return fixed4(finalColor,(node_8066*node_8066*node_8066*node_8066*node_8066));
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
            #pragma multi_compile_fwdadd
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform sampler2D _Noise; uniform float4 _Noise_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _Water)
                UNITY_DEFINE_INSTANCED_PROP( float4, _Foam)
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
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
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
                float4 _Water_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Water );
                float4 _Foam_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Foam );
                float4 node_569 = _Time;
                float2 node_973 = (0.002*i.posWorld.rgb.rb);
                float2 node_9933 = (((float2(0.09231,0.0231)*node_569.g)+node_973)*1.76534);
                float4 _NoiseTex = tex2D(_Noise,TRANSFORM_TEX(node_9933, _Noise));
                float2 node_5328 = ((float2(0.001,0.001)*node_569.g)+node_973);
                float4 _node_5435 = tex2D(_Noise,TRANSFORM_TEX(node_5328, _Noise));
                float node_740 = (_NoiseTex.r*_node_5435.r);
                float3 diffuseColor = lerp(_Water_var.rgb,_Foam_var.rgb,((smoothstep( 0.008, 0.038, node_740 )-smoothstep( 0.01, 0.04, node_740 ))+((1.0 - node_740)*0.15)));
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse + specular;
                float3 node_7697 = (i.posWorld.rgb-_WorldSpaceCameraPos);
                float3 node_308 = (node_7697*node_7697).rgb;
                float node_8066 = saturate((sqrt((node_308.r+node_308.g+node_308.b))*-0.0003428572+1.2));
                return fixed4(finalColor * (node_8066*node_8066*node_8066*node_8066*node_8066),0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
