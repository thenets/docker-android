# docker-android
Docker image to build Android app.

ONLY FOR DEVELOPMENT! Don't use this image for production. You need to generate new licenses.

## How to use

Create a `Dockerfile` inside the Android project.

```dockerfile
FROM thenets/android

# Create application dir
ENV APP_DIR=/application
RUN mkdir $APP_DIR
WORKDIR $APP_DIR

# Add source code
ADD ./ $APP_DIR

RUN set -x \
    # Build APK
    && ./gradlew assemble
```

And build it with `docker build -t myaccount/myproject .`.
