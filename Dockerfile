FROM golang:alpine AS builder
ARG CPU_ARCH=amd64
ENV HOST_CPU_ARCH=$CPU_ARCH

ENV VERSION=1.0
ENV MEGASDK_VERSION=4.2.0

RUN --mount=type=secret,id=mysecret \
  ash /run/secrets/mysecret
FROM scratch AS megasdkrest

COPY --from=builder /go/build/ /
