// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:9361,x:34351,y:32665,varname:node_9361,prsc:2|emission-2460-OUT,custl-7197-OUT;n:type:ShaderForge.SFN_LightAttenuation,id:8068,x:32818,y:32984,varname:node_8068,prsc:2;n:type:ShaderForge.SFN_LightColor,id:3406,x:32682,y:32914,varname:node_3406,prsc:2;n:type:ShaderForge.SFN_LightVector,id:6869,x:31470,y:32649,varname:node_6869,prsc:2;n:type:ShaderForge.SFN_NormalVector,id:9684,x:31470,y:32775,prsc:2,pt:True;n:type:ShaderForge.SFN_HalfVector,id:9471,x:31699,y:33271,varname:node_9471,prsc:2;n:type:ShaderForge.SFN_Dot,id:7782,x:31695,y:32683,cmnt:Lambert,varname:node_7782,prsc:2,dt:1|A-6869-OUT,B-9684-OUT;n:type:ShaderForge.SFN_Dot,id:3269,x:31983,y:33233,cmnt:Blinn-Phong,varname:node_3269,prsc:2,dt:1|A-9684-OUT,B-9471-OUT;n:type:ShaderForge.SFN_Multiply,id:2746,x:32447,y:33234,cmnt:Specular Contribution,varname:node_2746,prsc:2|A-6001-OUT,B-5267-OUT,C-4865-RGB;n:type:ShaderForge.SFN_Tex2d,id:851,x:32170,y:31834,ptovrint:False,ptlb:Diffuse Alpha tex,ptin:_DiffuseAlphatex,varname:node_851,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:1941,x:32465,y:32693,cmnt:Diffuse Contribution,varname:node_1941,prsc:2|A-9098-OUT,B-6001-OUT;n:type:ShaderForge.SFN_Color,id:5927,x:32107,y:32002,ptovrint:False,ptlb:Color Alpha,ptin:_ColorAlpha,varname:node_5927,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Exp,id:1700,x:32009,y:33404,varname:node_1700,prsc:2,et:1|IN-9978-OUT;n:type:ShaderForge.SFN_Slider,id:5328,x:31449,y:33429,ptovrint:False,ptlb:UNUSED Gloss,ptin:_UNUSEDGloss,varname:node_5328,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.3888889,max:1;n:type:ShaderForge.SFN_Power,id:5267,x:32188,y:33261,varname:node_5267,prsc:2|VAL-3269-OUT,EXP-1700-OUT;n:type:ShaderForge.SFN_Add,id:2159,x:32619,y:33217,cmnt:Combine,varname:node_2159,prsc:2|A-1941-OUT,B-2746-OUT;n:type:ShaderForge.SFN_Multiply,id:5085,x:33059,y:32941,cmnt:Attenuate and Color,varname:node_5085,prsc:2|A-1941-OUT,B-3406-RGB,C-8068-OUT;n:type:ShaderForge.SFN_ConstantLerp,id:9978,x:31817,y:33420,varname:node_9978,prsc:2,a:1,b:11|IN-5328-OUT;n:type:ShaderForge.SFN_Color,id:4865,x:32026,y:33618,ptovrint:False,ptlb:UNUSED Spec Color,ptin:_UNUSEDSpecColor,varname:node_4865,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_AmbientLight,id:7528,x:33235,y:32571,varname:node_7528,prsc:2;n:type:ShaderForge.SFN_Multiply,id:2460,x:33474,y:32487,cmnt:Ambient Light,varname:node_2460,prsc:2|A-9098-OUT,B-7528-RGB;n:type:ShaderForge.SFN_Multiply,id:544,x:32440,y:31977,cmnt:Diffuse Color,varname:node_544,prsc:2|A-851-RGB,B-5927-RGB;n:type:ShaderForge.SFN_Lerp,id:6001,x:32217,y:32753,varname:node_6001,prsc:2|A-2071-OUT,B-7782-OUT,T-7343-OUT;n:type:ShaderForge.SFN_Vector1,id:7343,x:31975,y:32833,varname:node_7343,prsc:2,v1:0.8;n:type:ShaderForge.SFN_Multiply,id:7879,x:31883,y:32594,varname:node_7879,prsc:2|A-938-OUT,B-7782-OUT;n:type:ShaderForge.SFN_Vector1,id:938,x:31695,y:32567,varname:node_938,prsc:2,v1:8;n:type:ShaderForge.SFN_Clamp01,id:2071,x:32055,y:32680,varname:node_2071,prsc:2|IN-7879-OUT;n:type:ShaderForge.SFN_Fresnel,id:4503,x:32957,y:33394,varname:node_4503,prsc:2|NRM-3755-OUT,EXP-8583-OUT;n:type:ShaderForge.SFN_Slider,id:3295,x:32824,y:33318,ptovrint:False,ptlb:fresnell str,ptin:_fresnellstr,varname:node_3295,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.98,max:2;n:type:ShaderForge.SFN_Multiply,id:5321,x:33421,y:33349,varname:node_5321,prsc:2|A-3295-OUT,B-4503-OUT,C-6345-RGB,D-7596-OUT;n:type:ShaderForge.SFN_Slider,id:8583,x:32499,y:33667,ptovrint:False,ptlb:fresnell exp,ptin:_fresnellexp,varname:_fresnellstr_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.1,cur:5.16,max:10;n:type:ShaderForge.SFN_Add,id:7197,x:33879,y:33071,varname:node_7197,prsc:2|A-7736-OUT,B-5321-OUT;n:type:ShaderForge.SFN_NormalVector,id:3755,x:32597,y:33416,prsc:2,pt:False;n:type:ShaderForge.SFN_Color,id:6345,x:33099,y:33457,ptovrint:False,ptlb:fresnell color,ptin:_fresnellcolor,varname:node_6345,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Slider,id:6684,x:32485,y:33855,ptovrint:False,ptlb:fresnell str shadow,ptin:_fresnellstrshadow,varname:node_6684,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.4444455,max:1;n:type:ShaderForge.SFN_Add,id:1672,x:32993,y:33717,varname:node_1672,prsc:2|A-2071-OUT,B-6684-OUT;n:type:ShaderForge.SFN_Clamp01,id:7596,x:33164,y:33667,varname:node_7596,prsc:2|IN-1672-OUT;n:type:ShaderForge.SFN_Vector3,id:1507,x:32998,y:32757,varname:node_1507,prsc:2,v1:1,v2:1,v3:1;n:type:ShaderForge.SFN_Multiply,id:6859,x:33411,y:33618,varname:node_6859,prsc:2|A-2324-OUT,B-7596-OUT;n:type:ShaderForge.SFN_Color,id:2210,x:33178,y:33012,ptovrint:False,ptlb:shadow color,ptin:_shadowcolor,varname:node_2210,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1268382,c2:0.255426,c3:0.5073529,c4:1;n:type:ShaderForge.SFN_OneMinus,id:2324,x:33122,y:33203,varname:node_2324,prsc:2|IN-2071-OUT;n:type:ShaderForge.SFN_Lerp,id:7736,x:33448,y:32991,varname:node_7736,prsc:2|A-5085-OUT,B-2210-RGB,T-2324-OUT;n:type:ShaderForge.SFN_VertexColor,id:1459,x:30997,y:32462,varname:node_1459,prsc:2;n:type:ShaderForge.SFN_Lerp,id:2823,x:31962,y:32335,varname:node_2823,prsc:2|A-5909-OUT,B-7300-OUT,T-1459-B;n:type:ShaderForge.SFN_Color,id:1575,x:31642,y:31660,ptovrint:False,ptlb:Color Blue,ptin:_ColorBlue,varname:node_1575,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1544118,c2:0.7900608,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:7300,x:31845,y:31698,varname:node_7300,prsc:2|A-1575-RGB,B-8915-RGB;n:type:ShaderForge.SFN_Tex2d,id:8915,x:31642,y:31851,ptovrint:False,ptlb:Diffuse Blue tex,ptin:_DiffuseBluetex,varname:node_8915,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Lerp,id:5909,x:31666,y:32287,varname:node_5909,prsc:2|A-1614-OUT,B-1371-OUT,T-1459-G;n:type:ShaderForge.SFN_Color,id:2285,x:31097,y:31255,ptovrint:False,ptlb:Color Green,ptin:_ColorGreen,varname:_ColorBlue_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1544118,c2:0.7900608,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:1371,x:31300,y:31292,varname:node_1371,prsc:2|A-2285-RGB,B-8124-RGB;n:type:ShaderForge.SFN_Tex2d,id:8124,x:31097,y:31445,ptovrint:False,ptlb:Diffuse Green tex,ptin:_DiffuseGreentex,varname:_DiffuseBluetex_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:1614,x:30648,y:31762,varname:node_1614,prsc:2|A-2436-RGB,B-2313-RGB;n:type:ShaderForge.SFN_Color,id:2436,x:30422,y:31659,ptovrint:False,ptlb:Color Red,ptin:_ColorRed,varname:node_2436,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.9411765,c2:0.7278845,c3:0.6574395,c4:1;n:type:ShaderForge.SFN_Tex2d,id:2313,x:30422,y:31880,ptovrint:False,ptlb:Diffuse Red tex,ptin:_DiffuseRedtex,varname:node_2313,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Lerp,id:9098,x:32243,y:32392,varname:node_9098,prsc:2|A-544-OUT,B-2823-OUT,T-1459-A;proporder:851-5927-2313-2436-8124-2285-8915-1575-5328-4865-3295-8583-6345-6684-2210;pass:END;sub:END;*/

Shader "Shader Forge/planet" {
    Properties {
        _DiffuseAlphatex ("Diffuse Alpha tex", 2D) = "white" {}
        _ColorAlpha ("Color Alpha", Color) = (1,1,1,1)
        _DiffuseRedtex ("Diffuse Red tex", 2D) = "white" {}
        _ColorRed ("Color Red", Color) = (0.9411765,0.7278845,0.6574395,1)
        _DiffuseGreentex ("Diffuse Green tex", 2D) = "white" {}
        _ColorGreen ("Color Green", Color) = (0.1544118,0.7900608,1,1)
        _DiffuseBluetex ("Diffuse Blue tex", 2D) = "white" {}
        _ColorBlue ("Color Blue", Color) = (0.1544118,0.7900608,1,1)
        _UNUSEDGloss ("UNUSED Gloss", Range(0, 1)) = 0.3888889
        _UNUSEDSpecColor ("UNUSED Spec Color", Color) = (1,1,1,1)
        _fresnellstr ("fresnell str", Range(0, 2)) = 0.98
        _fresnellexp ("fresnell exp", Range(0.1, 10)) = 5.16
        _fresnellcolor ("fresnell color", Color) = (1,1,1,1)
        _fresnellstrshadow ("fresnell str shadow", Range(0, 1)) = 0.4444455
        _shadowcolor ("shadow color", Color) = (0.1268382,0.255426,0.5073529,1)
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
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform sampler2D _DiffuseAlphatex; uniform float4 _DiffuseAlphatex_ST;
            uniform float4 _ColorAlpha;
            uniform float _fresnellstr;
            uniform float _fresnellexp;
            uniform float4 _fresnellcolor;
            uniform float _fresnellstrshadow;
            uniform float4 _shadowcolor;
            uniform float4 _ColorBlue;
            uniform sampler2D _DiffuseBluetex; uniform float4 _DiffuseBluetex_ST;
            uniform float4 _ColorGreen;
            uniform sampler2D _DiffuseGreentex; uniform float4 _DiffuseGreentex_ST;
            uniform float4 _ColorRed;
            uniform sampler2D _DiffuseRedtex; uniform float4 _DiffuseRedtex_ST;
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
                o.posWorld = mul(_Object2World, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
////// Emissive:
                float4 _DiffuseAlphatex_var = tex2D(_DiffuseAlphatex,TRANSFORM_TEX(i.uv0, _DiffuseAlphatex));
                float3 node_544 = (_DiffuseAlphatex_var.rgb*_ColorAlpha.rgb); // Diffuse Color
                float4 _DiffuseRedtex_var = tex2D(_DiffuseRedtex,TRANSFORM_TEX(i.uv0, _DiffuseRedtex));
                float3 node_1614 = (_ColorRed.rgb*_DiffuseRedtex_var.rgb);
                float4 _DiffuseGreentex_var = tex2D(_DiffuseGreentex,TRANSFORM_TEX(i.uv0, _DiffuseGreentex));
                float4 _DiffuseBluetex_var = tex2D(_DiffuseBluetex,TRANSFORM_TEX(i.uv0, _DiffuseBluetex));
                float3 node_9098 = lerp(node_544,lerp(lerp(node_1614,(_ColorGreen.rgb*_DiffuseGreentex_var.rgb),i.vertexColor.g),(_ColorBlue.rgb*_DiffuseBluetex_var.rgb),i.vertexColor.b),i.vertexColor.a);
                float3 emissive = (node_9098*UNITY_LIGHTMODEL_AMBIENT.rgb);
                float node_7782 = max(0,dot(lightDirection,normalDirection)); // Lambert
                float node_2071 = saturate((8.0*node_7782));
                float node_6001 = lerp(node_2071,node_7782,0.8);
                float3 node_1941 = (node_9098*node_6001); // Diffuse Contribution
                float node_2324 = (1.0 - node_2071);
                float node_7596 = saturate((node_2071+_fresnellstrshadow));
                float3 finalColor = emissive + (lerp((node_1941*_LightColor0.rgb*attenuation),_shadowcolor.rgb,node_2324)+(_fresnellstr*pow(1.0-max(0,dot(i.normalDir, viewDirection)),_fresnellexp)*_fresnellcolor.rgb*node_7596));
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
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform sampler2D _DiffuseAlphatex; uniform float4 _DiffuseAlphatex_ST;
            uniform float4 _ColorAlpha;
            uniform float _fresnellstr;
            uniform float _fresnellexp;
            uniform float4 _fresnellcolor;
            uniform float _fresnellstrshadow;
            uniform float4 _shadowcolor;
            uniform float4 _ColorBlue;
            uniform sampler2D _DiffuseBluetex; uniform float4 _DiffuseBluetex_ST;
            uniform float4 _ColorGreen;
            uniform sampler2D _DiffuseGreentex; uniform float4 _DiffuseGreentex_ST;
            uniform float4 _ColorRed;
            uniform sampler2D _DiffuseRedtex; uniform float4 _DiffuseRedtex_ST;
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
                o.posWorld = mul(_Object2World, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float4 _DiffuseAlphatex_var = tex2D(_DiffuseAlphatex,TRANSFORM_TEX(i.uv0, _DiffuseAlphatex));
                float3 node_544 = (_DiffuseAlphatex_var.rgb*_ColorAlpha.rgb); // Diffuse Color
                float4 _DiffuseRedtex_var = tex2D(_DiffuseRedtex,TRANSFORM_TEX(i.uv0, _DiffuseRedtex));
                float3 node_1614 = (_ColorRed.rgb*_DiffuseRedtex_var.rgb);
                float4 _DiffuseGreentex_var = tex2D(_DiffuseGreentex,TRANSFORM_TEX(i.uv0, _DiffuseGreentex));
                float4 _DiffuseBluetex_var = tex2D(_DiffuseBluetex,TRANSFORM_TEX(i.uv0, _DiffuseBluetex));
                float3 node_9098 = lerp(node_544,lerp(lerp(node_1614,(_ColorGreen.rgb*_DiffuseGreentex_var.rgb),i.vertexColor.g),(_ColorBlue.rgb*_DiffuseBluetex_var.rgb),i.vertexColor.b),i.vertexColor.a);
                float node_7782 = max(0,dot(lightDirection,normalDirection)); // Lambert
                float node_2071 = saturate((8.0*node_7782));
                float node_6001 = lerp(node_2071,node_7782,0.8);
                float3 node_1941 = (node_9098*node_6001); // Diffuse Contribution
                float node_2324 = (1.0 - node_2071);
                float node_7596 = saturate((node_2071+_fresnellstrshadow));
                float3 finalColor = (lerp((node_1941*_LightColor0.rgb*attenuation),_shadowcolor.rgb,node_2324)+(_fresnellstr*pow(1.0-max(0,dot(i.normalDir, viewDirection)),_fresnellexp)*_fresnellcolor.rgb*node_7596));
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
