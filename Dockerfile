FROM alpine:3.9

ARG AKSENGINE_VERSION=0.35.0

# The Docker image is missing TLS root certificates, and as a result the aks-engine commands fail on TLS when connecting to Azure services via HTTPS.
RUN apk add --no-cache -u ca-certificates

ADD "https://github.com/Azure/aks-engine/releases/download/v${AKSENGINE_VERSION}/aks-engine-v${AKSENGINE_VERSION}-linux-amd64.tar.gz" /tmp/aks-engine.tgz

RUN tar xvzf /tmp/aks-engine.tgz \
 && rm /tmp/aks-engine.tgz \
 && mv aks-engine-v${AKSENGINE_VERSION}-linux-amd64/aks-engine /usr/local/bin/aks-engine \
 && rm -r aks-engine-v${AKSENGINE_VERSION}-linux-amd64

ENTRYPOINT ["aks-engine"]
CMD ["version"]
