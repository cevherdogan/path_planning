ARG  CODE_VERSION=latest
# 3, 3.17, 3.17.0, 3.17.0_rc1

FROM --platform=linux/arm/v8 alpine:${CODE_VERSION} as build

RUN echo image_version=$CODE_VERSION > image_version && cat image_version

# FROM [--platform=<platform>] <image> [AS <name>]
# FROM [--platform=<platform>] <image>[:<tag>] [AS <name>]
# FROM [--platform=<platform>] <image>[@<digest>] [AS <name>]

# Update and add bash
RUN apk update && \
    apk add bash cmake --update alpine-sdk

COPY . /workspace

RUN cd /workspace && \
    rm -rf ./build && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make -j4

CMD ["/workspace/build/main"]
