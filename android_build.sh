#!/usr/bin/env bash


#check https://github.com/lucasvanmol/algodot/issues/6#issuecomment-1241229297 for updates
# compiling for arm64 and x86 architectures would require you to comment out #include <float.h> line 
#in android clang's float.h

# change the Android NDK paths to your OS specific directory
#install cargo ndk from https://github.com/bbqsrc/cargo-ndk



#Edit the Linker Paths to your own Android Sdk folder
export ANDROID_NDK_VERSION=21.4.7075529
export CARGO_TARGET_ARMV7_LINUX_ANDROIDEABI_LINKER="/home/samuel/Android/Sdk/ndk/"$ANDROID_NDK_VERSION"/toolchains/llvm/prebuilt/linux-x86_64/bin/armv7a-linux-androideabi29-clang"
export CARGO_TARGET_AARCH64_LINUX_ANDROID_LINKER="/home/samuel/Android/Sdk/ndk/"$ANDROID_NDK_VERSION"/toolchains/llvm/prebuilt/linux-x86_64/bin/aarch64-linux-android29-clang"
export CARGO_TARGET_I686_LINUX_ANDROID_LINKER="/home/samuel/Android/Sdk/ndk/"$ANDROID_NDK_VERSION"/toolchains/llvm/prebuilt/linux-x86_64/bin/i686-linux-android29-clang"
export CARGO_TARGET_X86_64_LINUX_ANDROID_LINKER="/home/samuel/Android/Sdk/ndk/"$ANDROID_NDK_VERSION"/toolchains/llvm/prebuilt/linux-x86_64/bin/x86_64-linux-android29-clang"
export ANDROID_SDK_ROOT="/home/samuel/Android/Sdk"


#########################Requires openssl to build ######################################

export OPENSSL="build_openssl_android_clang/libs/android/clang/android-arm" #arm


#export OPENSSL="build_openssl_android_clang/libs/android/clang/android-arm64" #arm64

#export OPENSSL="build_openssl_android_clang/libs/android/clang/android-x86" #x86


export OPENSSL_DIR='/home/samuel/'$OPENSSL #incompatible with android

export OPENSSL_LIB_DIR="/home/samuel/"$OPENSSL
export PKG_CONFIG_PATH="/home/samuel/"$OPENSSL
export PKG_CONFIG_ALLOW_CROSS_x86_64_linux_android=1

###############################################################

export API=x86_64-linux-android
export NDK=21.4.7075529


export X86_64_LINUX_ANDROID_OPENSSL_LIB_DIR="/home/samuel/"$OPENSSL"/ssl"

export TOOLCHAIN=$ANDROID_SDK_ROOT/$NDK/toolchains/llvm/prebuilt/linux-x86_64

export TARGET=x86_64-linux-android


export DEBUG= true


cargo ndk -t armeabi-v7a  -o ./jniLibs build --release #32 bit arm #builds

#cargo ndk -t arm64-v8a  -o ./jniLibs build --release #64 bit arm #c++ error

#cargo ndk -t x86  -o ./jniLibs build --release #x86 #c++ error #c++ error
