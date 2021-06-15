// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:False,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.1098039,fgcg:0.1137255,fgcb:0.2705882,fgca:1,fgde:0.0059,fgrn:0,fgrf:200,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:True,fnfb:True,fsmp:False;n:type:ShaderForge.SFN_Final,id:4795,x:32803,y:32602,varname:node_4795,prsc:2|emission-6774-OUT,alpha-6980-OUT,voffset-5531-OUT;n:type:ShaderForge.SFN_VertexColor,id:2053,x:31827,y:32436,varname:node_2053,prsc:2;n:type:ShaderForge.SFN_ValueProperty,id:9902,x:31685,y:32789,ptovrint:True,ptlb:Electricity,ptin:_Electricity,varname:_Electricity,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Lerp,id:6774,x:32427,y:32573,varname:node_6774,prsc:2|A-2053-R,B-4844-RGB,T-9902-OUT;n:type:ShaderForge.SFN_Color,id:4844,x:32076,y:32575,ptovrint:False,ptlb:Electric Color,ptin:_ElectricColor,varname:_ElectricColor,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:0,c4:1;n:type:ShaderForge.SFN_TexCoord,id:8273,x:31608,y:33009,varname:node_8273,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:4806,x:32086,y:32974,varname:node_4806,prsc:2|A-1588-OUT,B-8273-U,C-9470-OUT;n:type:ShaderForge.SFN_Relay,id:1232,x:32000,y:32750,varname:node_1232,prsc:2|IN-2053-B;n:type:ShaderForge.SFN_Sin,id:3693,x:32330,y:33112,varname:node_3693,prsc:2|IN-4806-OUT;n:type:ShaderForge.SFN_Multiply,id:5531,x:32616,y:33094,varname:node_5531,prsc:2|A-3102-OUT,B-3693-OUT,C-9299-OUT;n:type:ShaderForge.SFN_Vector1,id:9470,x:31894,y:33072,varname:node_9470,prsc:2,v1:1000;n:type:ShaderForge.SFN_Relay,id:9299,x:32252,y:33292,varname:node_9299,prsc:2|IN-8273-U;n:type:ShaderForge.SFN_Sqrt,id:1588,x:31894,y:32879,varname:node_1588,prsc:2|IN-9902-OUT;n:type:ShaderForge.SFN_Max,id:6980,x:32568,y:32749,varname:node_6980,prsc:2|A-1232-OUT,B-2840-OUT;n:type:ShaderForge.SFN_NormalVector,id:7215,x:32264,y:32914,prsc:2,pt:False;n:type:ShaderForge.SFN_Multiply,id:2840,x:32319,y:32749,varname:node_2840,prsc:2|A-9902-OUT,B-3716-OUT;n:type:ShaderForge.SFN_Vector1,id:3716,x:32120,y:32861,varname:node_3716,prsc:2,v1:0.33;n:type:ShaderForge.SFN_Multiply,id:3102,x:32431,y:32893,varname:node_3102,prsc:2|A-3716-OUT,B-7215-OUT;proporder:9902-4844;pass:END;sub:END;*/

Shader "Shader Forge/DartTrail" {
    Properties {
        _Electricity ("Electricity", Float ) = 0
        _ElectricColor ("Electric Color", Color) = (1,1,0,1)
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
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
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog
            #pragma target 3.0
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _Electricity)
                UNITY_DEFINE_INSTANCED_PROP( float4, _ElectricColor)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float2 uv0 : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                float4 vertexColor : COLOR;
                UNITY_FOG_COORDS(2)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                float node_3716 = 0.33;
                float _Electricity_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Electricity );
                v.vertex.xyz += ((node_3716*v.normal)*sin((sqrt(_Electricity_var)*o.uv0.r*1000.0))*o.uv0.r);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
////// Lighting:
////// Emissive:
                float4 _ElectricColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _ElectricColor );
                float _Electricity_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Electricity );
                float3 emissive = lerp(float3(i.vertexColor.r,i.vertexColor.r,i.vertexColor.r),_ElectricColor_var.rgb,_Electricity_var);
                float3 finalColor = emissive;
                float node_3716 = 0.33;
                fixed4 finalRGBA = fixed4(finalColor,max(i.vertexColor.b,(_Electricity_var*node_3716)));
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    CustomEditor "ShaderForgeMaterialInspector"
}
