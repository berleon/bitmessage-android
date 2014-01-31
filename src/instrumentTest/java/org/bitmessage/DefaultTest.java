package org.bitmessage;

import android.test.ActivityInstrumentationTestCase2;

/**
 * This is a simple framework for a test of an Application.  See
 * {@link android.test.ApplicationTestCase ApplicationTestCase} for more information on
 * how to write and extend Application tests.
 * <p/>
 * To run this test, you can type:
 * adb shell am instrument -w \
 * -e class org.bitmessage.DefaultTest \
 * org.bitmessage.tests/android.test.InstrumentationTestRunner
 */
public class DefaultTest extends ActivityInstrumentationTestCase2<Default> {

    public DefaultTest() {
        super("org.bitmessage", Default.class);
    }

}
