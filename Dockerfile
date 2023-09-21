ARG LINKERD_AWAIT_VERSION=v0.2.7
ARG LINKERD_AWAIT_ARCH=amd64



FROM curlimages/curl as downloader

ARG LINKERD_AWAIT_VERSION
ARG LINKERD_AWAIT_ARCH

RUN curl \
        -sSLo /tmp/linkerd-await \
        https://github.com/linkerd/linkerd-await/releases/download/release%2F${LINKERD_AWAIT_VERSION}/linkerd-await-${LINKERD_AWAIT_VERSION}-${LINKERD_AWAIT_ARCH} \
    && chmod 755 /tmp/linkerd-await



FROM alpine:3.18

COPY --from=downloader /tmp/linkerd-await /usr/local/bin/linkerd-await