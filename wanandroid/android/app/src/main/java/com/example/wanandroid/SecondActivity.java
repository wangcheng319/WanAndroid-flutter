package com.example.wanandroid;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

/**
 * @ProjectName: wanandroid
 * @Package: com.example.wanandroid
 * @ClassName: SecondActivity
 * @Description: java类作用描述
 * @Author: wangc
 * @CreateDate: 2019/1/17 16:50
 * @Version: 1.0
 */
public class SecondActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Button button = new Button(this);
        button.setText("这是原生第二个页面");
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });
        setContentView(button);
    }
}
