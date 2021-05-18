// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:0,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:1,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:6,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:False,igpj:True,qofs:1,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:True,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:32917,y:32708,varname:node_3138,prsc:2|emission-4021-OUT,alpha-6224-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:32230,y:32570,ptovrint:False,ptlb:Base Color,ptin:_BaseColor,varname:_BaseColor,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.3764706,c2:0.4941177,c3:0.6784314,c4:1;n:type:ShaderForge.SFN_Color,id:7711,x:32078,y:32689,ptovrint:False,ptlb:Dense Color,ptin:_DenseColor,varname:_DenseColor,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1137255,c2:0.1490196,c3:0.2941177,c4:1;n:type:ShaderForge.SFN_FragmentPosition,id:570,x:32190,y:32344,varname:node_570,prsc:2;n:type:ShaderForge.SFN_Distance,id:4908,x:32497,y:32346,varname:node_4908,prsc:2|A-570-XYZ,B-4054-XYZ;n:type:ShaderForge.SFN_ObjectPosition,id:4054,x:32340,y:32393,varname:node_4054,prsc:2;n:type:ShaderForge.SFN_Vector1,id:9896,x:30458,y:32567,varname:node_9896,prsc:2,v1:0.001;n:type:ShaderForge.SFN_Vector1,id:4867,x:30522,y:32631,varname:node_4867,prsc:2,v1:0.001;n:type:ShaderForge.SFN_Vector1,id:4196,x:30586,y:32695,varname:node_4196,prsc:2,v1:0.001;n:type:ShaderForge.SFN_RemapRangeAdvanced,id:4765,x:32532,y:33183,varname:node_4765,prsc:2|IN-6934-OUT,IMIN-9400-OUT,IMAX-6684-OUT,OMIN-1563-OUT,OMAX-1943-OUT;n:type:ShaderForge.SFN_ValueProperty,id:9400,x:32044,y:33181,ptovrint:False,ptlb:Start,ptin:_Start,varname:_Start,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:6684,x:32044,y:33303,ptovrint:False,ptlb:End,ptin:_End,varname:_End,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:5;n:type:ShaderForge.SFN_Vector1,id:1943,x:32215,y:33430,varname:node_1943,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:1563,x:32215,y:33329,varname:node_1563,prsc:2,v1:0;n:type:ShaderForge.SFN_Clamp01,id:6224,x:32697,y:33204,varname:node_6224,prsc:2|IN-4765-OUT;n:type:ShaderForge.SFN_Lerp,id:4021,x:32717,y:32871,varname:node_4021,prsc:2|A-7241-RGB,B-7711-RGB,T-6224-OUT;n:type:ShaderForge.SFN_Multiply,id:5782,x:31943,y:32988,varname:node_5782,prsc:2|A-139-OUT,B-139-OUT;n:type:ShaderForge.SFN_ComponentMask,id:8365,x:32095,y:32988,varname:node_8365,prsc:2,cc1:0,cc2:1,cc3:2,cc4:-1|IN-5782-OUT;n:type:ShaderForge.SFN_Sqrt,id:6934,x:32435,y:32993,varname:node_6934,prsc:2|IN-6263-OUT;n:type:ShaderForge.SFN_Add,id:6263,x:32272,y:32993,varname:node_6263,prsc:2|A-8365-R,B-8365-G,C-8365-B;n:type:ShaderForge.SFN_ObjectPosition,id:9884,x:31664,y:32637,varname:node_9884,prsc:2;n:type:ShaderForge.SFN_SceneDepth,id:8135,x:31113,y:32913,varname:node_8135,prsc:2|UV-2638-UVOUT;n:type:ShaderForge.SFN_ScreenPos,id:2638,x:30943,y:32883,varname:node_2638,prsc:2,sctp:2;n:type:ShaderForge.SFN_Code,id:139,x:31291,y:32978,varname:node_139,prsc:2,code:cgBlAHQAdQByAG4AIAB2AGkAZQB3AEQAaQByACAAKgAgAGQAZQBwAHQAaAAgACsAIABfAFcAbwByAGwAZABTAHAAYQBjAGUAQwBhAG0AZQByAGEAUABvAHMAOwA=,output:2,fname:Function_node_139,width:561,height:266,input:0,input:2,input_1_label:depth,input_2_label:viewDir|A-8135-OUT,B-5733-OUT;n:type:ShaderForge.SFN_ViewVector,id:5733,x:31124,y:33089,varname:node_5733,prsc:2;proporder:7241-7711-9400-6684;pass:END;sub:END;*/

Shader "Shader Forge/Fog" {
    Properties {
        _BaseColor ("Base Color", Color) = (0.3764706,0.4941177,0.6784314,1)
        _DenseColor ("Dense Color", Color) = (0.1137255,0.1490196,0.2941177,1)
        _Start ("Start", Float ) = 0
        _End ("End", Float ) = 5
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent+1"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            ZTest Always
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma target 3.0
            uniform sampler2D _CameraDepthTexture;
            float3 Function_node_139( float depth , float3 viewDir ){
            return viewDir * depth + _WorldSpaceCameraPos;
            }
            
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _BaseColor)
                UNITY_DEFINE_INSTANCED_PROP( float4, _DenseColor)
                UNITY_DEFINE_INSTANCED_PROP( float, _Start)
                UNITY_DEFINE_INSTANCED_PROP( float, _End)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 posWorld : TEXCOORD0;
                float4 projPos : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float2 sceneUVs = (i.projPos.xy / i.projPos.w);
////// Lighting:
////// Emissive:
                float4 _BaseColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _BaseColor );
                float4 _DenseColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _DenseColor );
                float node_8135 = max(0, LinearEyeDepth(SAMPLE_DEPTH_TEXTURE(_CameraDepthTexture, sceneUVs.rg)) - _ProjectionParams.g);
                float3 node_139 = Function_node_139( node_8135 , viewDirection );
                float3 node_8365 = (node_139*node_139).rgb;
                float _Start_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Start );
                float _End_var = UNITY_ACCESS_INSTANCED_PROP( Props, _End );
                float node_1563 = 0.0;
                float node_6224 = saturate((node_1563 + ( (sqrt((node_8365.r+node_8365.g+node_8365.b)) - _Start_var) * (1.0 - node_1563) ) / (_End_var - _Start_var)));
                float3 emissive = lerp(_BaseColor_var.rgb,_DenseColor_var.rgb,node_6224);
                float3 finalColor = emissive;
                return fixed4(finalColor,node_6224);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
