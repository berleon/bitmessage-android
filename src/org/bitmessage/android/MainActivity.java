package org.bitmessage.android;

import org.bitmessage.jni.NativeNotBit;

import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;

public class MainActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        NativeNotBit notbit = new NativeNotBit();
        notbit.connect();
        notbit.disconnect();
        boolean x =notbit.hasError();
        int y = 2;
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        return true;
    }
    
}
