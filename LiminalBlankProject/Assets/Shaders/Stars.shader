// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:0,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:False,rfrpn:Refraction,coma:15,ufog:False,aust:False,igpj:True,qofs:9000,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:32899,y:32724,varname:node_3138,prsc:2|emission-7241-RGB,alpha-7036-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:32282,y:32633,ptovrint:False,ptlb:Color,ptin:_Color,varname:_Color,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_FragmentPosition,id:6662,x:31852,y:32976,varname:node_6662,prsc:2;n:type:ShaderForge.SFN_ViewPosition,id:6154,x:31803,y:33239,varname:node_6154,prsc:2;n:type:ShaderForge.SFN_Subtract,id:3150,x:32051,y:33133,varname:node_3150,prsc:2|A-6662-XYZ,B-6154-XYZ;n:type:ShaderForge.SFN_ComponentMask,id:6309,x:32237,y:33167,varname:node_6309,prsc:2,cc1:1,cc2:-1,cc3:-1,cc4:-1|IN-3150-OUT;n:type:ShaderForge.SFN_Clamp01,id:4995,x:32453,y:33167,varname:node_4995,prsc:2|IN-6309-OUT;n:type:ShaderForge.SFN_TexCoord,id:3293,x:32051,y:32966,varname:node_3293,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Vector2,id:2336,x:32051,y:32801,varname:node_2336,prsc:2,v1:0.5,v2:0.5;n:type:ShaderForge.SFN_Smoothstep,id:9966,x:32431,y:32946,varname:node_9966,prsc:2|A-2223-OUT,B-4163-OUT,V-854-OUT;n:type:ShaderForge.SFN_Distance,id:854,x:32236,y:32966,varname:node_854,prsc:2|A-2336-OUT,B-3293-UVOUT;n:type:ShaderForge.SFN_Vector1,id:2223,x:32236,y:32833,varname:node_2223,prsc:2,v1:0.666;n:type:ShaderForge.SFN_Vector1,id:4163,x:32206,y:32892,varname:node_4163,prsc:2,v1:0.3;n:type:ShaderForge.SFN_Multiply,id:7036,x:32649,y:33000,varname:node_7036,prsc:2|A-9966-OUT,B-4995-OUT;proporder:7241;pass:END;sub:END;*/

Shader "Shader Forge/Stars" {
    Properties {
        _Color ("Color", Color) = (1,1,1,1)
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Geometry+9000"
            "RenderType"="Opaque"
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
            #pragma target 3.0
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _Color)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
////// Lighting:
////// Emissive:
                float4 _Color_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Color );
                float3 emissive = _Color_var.rgb;
                float3 finalColor = emissive;
                return fixed4(finalColor,(smoothstep( 0.666, 0.3, distance(float2(0.5,0.5),i.uv0) )*saturate((i.posWorld.rgb-_WorldSpaceCameraPos).g)));
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
