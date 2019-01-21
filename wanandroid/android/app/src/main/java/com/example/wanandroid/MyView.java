package com.example.wanandroid;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.util.AttributeSet;
import android.view.View;

/**
 * @ProjectName: android
 * @Package: com.example.wanandroid
 * @ClassName: MyView
 * @Description: java类作用描述
 * @Author: wangc
 * @CreateDate: 2019/1/21 16:18
 * @Version: 1.0
 */
public class MyView extends View {
    public MyView(Context context) {
        super(context);
    }

    public MyView(Context context,  AttributeSet attrs) {
        super(context, attrs);
    }

    public MyView(Context context,  AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    @Override
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        Paint paint = new Paint();
        paint.setColor(Color.RED);
        paint.setStrokeWidth(30);
        canvas.drawText("这是原生view",50,50,paint);
    }
}
