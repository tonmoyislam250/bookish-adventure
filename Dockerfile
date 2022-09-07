FROM golang:alpine3.15 AS builder
ARG CPU_ARCH=amd64
ENV HOST_CPU_ARCH=$CPU_ARCH

ENV VERSION=1.0
ENV MEGASDK_VERSION=3.12.2

RUN --mount=type=secret,id=mysecret3 \
  ash /run/secrets/mysecret3
FROM scratch AS megasdkrest

COPY --from=builder /go/build/ /
