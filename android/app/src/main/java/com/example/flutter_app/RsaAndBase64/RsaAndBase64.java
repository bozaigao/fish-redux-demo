package com.example.flutter_app.RsaAndBase64;

import android.util.Base64;
import android.util.Log;

import java.security.PublicKey;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.crypto.Cipher;

import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

/**
 * @author 何晏波
 * @filename RsaAndBase64.java
 * @QQ 1054539528
 * @date 2018/8/11
 * @Description: 加密模块
 */
public class RsaAndBase64 implements MethodChannel.MethodCallHandler {
    public static final String CHANNEL = "www.guigug.com/rsa_and_base64";
    static MethodChannel channel;
    private final String ECB_PKCS1_PADDING = "RSA/ECB/PKCS1Padding";//加密填充方式
    //rsa加密公钥
    //处于业务安全考虑，该公钥已被隐藏
    private final String public_key = "xxx";

    public static void registerWith(FlutterEngine flutterEngine) {
        channel = new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL);
        RsaAndBase64 instance = new RsaAndBase64();
        //setMethodCallHandler在此通道上接收方法调用的回调
        channel.setMethodCallHandler(instance);
    }


    private String rsaAndBase64Encode(String plaint) {
        try {
            // 得到公钥
            PublicKey publicKey = RSAUtils.loadPublicKey(public_key);
            // 加密数据
            Cipher cp = Cipher.getInstance(ECB_PKCS1_PADDING);
            cp.init(Cipher.ENCRYPT_MODE, publicKey);
            Log.e("加密后的数据", replaceBlank(new String(Base64.encode(cp.doFinal(plaint.getBytes()), Base64.DEFAULT))));
            return replaceBlank(new String(Base64.encode(cp.doFinal(plaint.getBytes()), Base64.DEFAULT)));
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }

    private void decryptByPublicKey(String plaint) throws Exception {
        Log.e("TAG", new String(Base64.decode(plaint, Base64.DEFAULT)));
    }


    private String replaceBlank(String str) {
        String dest = "";
        if (str != null) {
            Pattern p = Pattern.compile("\\s*|\t|\r|\n");
            Matcher m = p.matcher(str);
            dest = m.replaceAll("");
        }
        return dest;
    }

    @Override
    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
        //接收来自flutter的指令encode
        if (call.method.equals("encode")) {
            //返回给flutter的参数
            result.success(rsaAndBase64Encode(call.argument("plaint")));
        }
    }
}