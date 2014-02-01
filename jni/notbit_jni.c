
#include <stdio.h>
#include <jni.h>

JNIEXPORT void JNICALL
Java_org_bitmessage_jni_NativeNotBit_connect(JNIEnv *env, jobject obj)
{
    printf("Hello World!\n");
    return;
}
JNIEXPORT void JNICALL
Java_org_bitmessage_jni_NativeNotBit_disconnect(JNIEnv *env, jobject obj)
{
    printf("Hello World! Disconnect\n");
    return;
}

JNIEXPORT jboolean JNICALL
Java_org_bitmessage_jni_NativeNotBit_hasError(JNIEnv *env, jobject obj)
{
    printf("Hello World!\n");
    return 1;
}

JNIEXPORT jstring JNICALL
Java_org_bitmessage_jni_NativeNotBit_getVersion(JNIEnv *env, jobject obj)
{
	const char * hello_world = "Hello World!";
	return (*env)->NewStringUTF(env, hello_world);
}
