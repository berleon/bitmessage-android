package org.bitmessage.jni;

public interface NotBit {
	void init();
	void connect();
	void disconnect();
	boolean hasError();
	String getVersion();
}
