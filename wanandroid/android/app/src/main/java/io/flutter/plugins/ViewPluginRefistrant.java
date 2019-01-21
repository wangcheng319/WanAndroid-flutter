package io.flutter.plugins;

import com.example.wanandroid.MyView;
import com.example.wanandroid.NativeViewFactory;
import com.flutter_webview_plugin.FlutterWebviewPlugin;

import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugins.pathprovider.PathProviderPlugin;
import io.flutter.plugins.sharedpreferences.SharedPreferencesPlugin;

/**
 * @ProjectName: android
 * @Package: io.flutter.plugins
 * @ClassName: ViewPluginRefistrant
 * @Description: java类作用描述
 * @Author: wangc
 * @CreateDate: 2019/1/21 16:25
 * @Version: 1.0
 */
public final class ViewPluginRefistrant {
    public static void registerWith(PluginRegistry registry, MyView myView) {
        final String key = ViewPluginRefistrant.class.getCanonicalName();
        if (registry.hasPlugin(key)) {
            return ;
        }

        PluginRegistry.Registrar registrar = registry.registrarFor(key);
        registrar.platformViewRegistry().registerViewFactory("nativeview",new NativeViewFactory(new StandardMessageCodec(),myView));
    }
}
