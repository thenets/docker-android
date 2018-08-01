FROM openjdk:10.0.2-jdk

ENV SDK_URL="https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip" \
    ANDROID_HOME="/usr/local/android-sdk" \
    ANDROID_VERSION=27 \
    ANDROID_BUILD_TOOLS_VERSION=27.0.3

# Download Android
RUN set -x \
    && apt-get update && apt-get install -y curl \
    && mkdir "$ANDROID_HOME" .android \
    && cd "$ANDROID_HOME" \
    && curl -o sdk.zip $SDK_URL \
    && unzip sdk.zip \
    && rm sdk.zip

# Install Android Build Tool and Libraries
RUN set -x \
    && echo yes | $ANDROID_HOME/tools/bin/sdkmanager --licenses \
    && $ANDROID_HOME/tools/bin/sdkmanager --update \
    && $ANDROID_HOME/tools/bin/sdkmanager 'build-tools;${ANDROID_BUILD_TOOLS_VERSION}' 'platforms;android-${ANDROID_VERSION}' 'platform-tools'
    
    
