package com.example.wanandroid;

import android.os.Bundle;
import android.util.Base64;
import android.util.Log;

import com.example.wanandroid.aes.Codec2;

import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.KeyGenerator;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {

    private static final String CHANNEL = "samples.flutter.io/test";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);

        new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(
                new MethodChannel.MethodCallHandler() {
                    @Override
                    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
//                通过methodCall可以获取参数和方法名  执行对应的平台业务逻辑即可
                        if (methodCall.method.equals("getNativeArguments")) {
                            //获取flutter传递过来的参数
                            String text = methodCall.argument("flutter");
                            //AES加密
                            String key = "fsgjernfjwnfjeft";
                            String encrypt = AESEncode(text,key);
                            result.success(encrypt);
                        } else {
                            result.notImplemented();
                        }
                    }
                }
        );
    }


    public static String AESEncode(String text,String privateKey){
        try {
            byte[] raw = privateKey.getBytes("UTF-8");
            SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
            Cipher cipher = Cipher.getInstance("AES");
            cipher.init(Cipher.ENCRYPT_MODE, skeySpec);
            return Codec2.byteToHexString(cipher.doFinal(text.getBytes("UTF-8")));
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }
}
