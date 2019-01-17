package com.example.wanandroid;

import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build;
import android.os.Bundle;

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
                            startActivity(new Intent(MainActivity.this, SecondActivity.class));
                            //获取flutter传递过来的参数
                            String text = methodCall.argument("flutter");
                            //返回flutter，并且携带参数
                            result.success(text + "007");
                        } else {
                            result.notImplemented();
                        }
                    }
                }
        );

    }
}
