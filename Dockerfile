FROM ghcr.io/curl/curl-container/curl-dev-debian:master

ARG KUBE_VERSION="v1.27.11"

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh && \
    curl -L https://storage.googleapis.com/kubernetes-release/release/$KUBE_VERSION/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/entrypoint.sh"]
CMD ["cluster-info"]
