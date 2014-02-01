package org.bitmessage.jni;


public class NativeNotBit implements NotBit {
	private int ntb_run_context;
	static {
		System.loadLibrary("notbit_jni");
	}
	public NativeNotBit() {
		this.init();
	}
	@Override
	public native void init();
	
	@Override
	public native void connect(); 

	@Override
	public native void disconnect();

	@Override
	public native boolean hasError();

	@Override
	public native String getVersion(); 
}
