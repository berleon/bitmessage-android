package org.bitmessage.notbit;

public class NativeNotBit implements NotBit {

	@Override
	public native void connect(); 

	@Override
	public native void disconnect();

	@Override
	public native boolean hasError();
	
}
