// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:0,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:False,rfrpn:Refraction,coma:15,ufog:False,aust:False,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33135,y:32758,varname:node_3138,prsc:2|emission-7241-RGB,alpha-8428-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:32321,y:32608,ptovrint:False,ptlb:Color,ptin:_Color,varname:_Color,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_TexCoord,id:1541,x:31297,y:32702,varname:node_1541,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Time,id:3473,x:31216,y:32977,varname:node_3473,prsc:2;n:type:ShaderForge.SFN_Add,id:6695,x:31534,y:32875,varname:node_6695,prsc:2|A-1541-V,B-3473-TSL;n:type:ShaderForge.SFN_Multiply,id:7435,x:31727,y:32926,varname:node_7435,prsc:2|A-6473-OUT,B-6695-OUT;n:type:ShaderForge.SFN_Vector1,id:6473,x:31565,y:32792,varname:node_6473,prsc:2,v1:16;n:type:ShaderForge.SFN_Sin,id:458,x:31889,y:32915,varname:node_458,prsc:2|IN-7435-OUT;n:type:ShaderForge.SFN_ViewPosition,id:7269,x:31385,y:33178,varname:node_7269,prsc:2;n:type:ShaderForge.SFN_Vector1,id:8070,x:32159,y:32822,varname:node_8070,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Clamp01,id:8503,x:32081,y:32915,varname:node_8503,prsc:2|IN-458-OUT;n:type:ShaderForge.SFN_Clamp01,id:8428,x:32856,y:32943,varname:node_8428,prsc:2|IN-8946-OUT;n:type:ShaderForge.SFN_Subtract,id:9409,x:32388,y:32911,varname:node_9409,prsc:2|A-8070-OUT,B-8503-OUT;n:type:ShaderForge.SFN_Divide,id:8946,x:32595,y:32911,varname:node_8946,prsc:2|A-9409-OUT,B-5891-OUT;n:type:ShaderForge.SFN_DDXY,id:5891,x:32403,y:33146,varname:node_5891,prsc:2|IN-8503-OUT;proporder:7241;pass:END;sub:END;*/

Shader "Shader Forge/IslandFoam" {
    Properties {
        _Color ("Color", Color) = (1,1,1,1)
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
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
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
                float node_8070 = 0.5;
                float4 node_3473 = _Time;
                float node_458 = sin((16.0*(i.uv0.g+node_3473.r)));
                float node_8503 = saturate(node_458);
                return fixed4(finalColor,saturate(((node_8070-node_8503)/fwidth(node_8503))));
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
