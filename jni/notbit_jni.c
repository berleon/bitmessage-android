
#include <stdio.h>
#include <jni.h>
#include <ntb-api.h>

JNIEXPORT void JNICALL
Java_org_bitmessage_jni_NativeNotBit_init(JNIEnv *env, jobject obj)
{
	jfieldID fid;
    jclass cls;

    struct ntb_run_context * rc = ntb_init();
    


    jclass localRefCls = (*env)->FindClass(env, "org/bitmessage/jni/NativeNotBit");
    cls = (*env)->NewGlobalRef(env, localRefCls);

    fid = (*env)->GetFieldID(env, cls, "ntb_run_context", "I");
    (*env)->SetIntField(env, obj, fid, (jint) rc);

}

JNIEXPORT void JNICALL
Java_org_bitmessage_jni_NativeNotBit_connect(JNIEnv *env, jobject obj)
{
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
