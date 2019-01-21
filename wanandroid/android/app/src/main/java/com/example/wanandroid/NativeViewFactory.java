package com.example.wanandroid;

import android.content.Context;
import android.view.View;

import io.flutter.plugin.common.MessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;

/**
 * @ProjectName: android
 * @Package: com.example.wanandroid
 * @ClassName: NativeViewFactory
 * @Description: java类作用描述
 * @Author: wangc
 * @CreateDate: 2019/1/21 16:17
 * @Version: 1.0
 */
public class NativeViewFactory extends PlatformViewFactory {


    private MyView myView;

    public NativeViewFactory(MessageCodec<Object> createArgsCodec,MyView myView) {
        super(createArgsCodec);
        this.myView = myView;
    }

    @Override
    public PlatformView create(Context context, int i, Object o) {
        return new PlatformView() {
            @Override
            public View getView() {
                return myView;
            }

            @Override
            public void dispose() {

            }
        };
    }
}
