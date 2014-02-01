package org.bitmessage.jni;

public interface NotBit {
	void connect();
	void disconnect();
	boolean hasError();
	String getVersion();
}
