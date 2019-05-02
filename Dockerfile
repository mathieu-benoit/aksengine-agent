FROM ubuntu:18.04

ARG AKSENGINE_VERSION=0.35.0

RUN apt-get update \
 && apt-get install -y wget unzip \
 && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/Azure/aks-engine/releases/download/v${AKSENGINE_VERSION}/aks-engine-v${AKSENGINE_VERSION}-linux-amd64.zip \
 &&	unzip aks-engine-v${AKSENGINE_VERSION}-linux-amd64.zip \
 && mv aks-engine-v${AKSENGINE_VERSION}-linux-amd64/aks-engine /usr/local/bin/aks-engine \
 && rm aks-engine-v${AKSENGINE_VERSION}-linux-amd64.zip \
 && rm -r aks-engine-v${AKSENGINE_VERSION}-linux-amd64
