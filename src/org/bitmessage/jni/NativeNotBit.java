package org.bitmessage.jni;


public class NativeNotBit implements NotBit {
	
	static {
		System.loadLibrary("notbit_jni");
	}
	@Override
	public native void connect(); 

	@Override
	public native void disconnect();

	@Override
	public native boolean hasError();

	@Override
	public native String getVersion(); 
}
