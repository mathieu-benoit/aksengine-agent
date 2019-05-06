FROM ubuntu:18.04

ARG AKSENGINE_VERSION=0.35.1

RUN apt-get update \
 && apt-get install -y unzip \
 && rm -rf /var/lib/apt/lists/*
 
ADD "https://github.com/Azure/aks-engine/releases/download/v${AKSENGINE_VERSION}/aks-engine-v${AKSENGINE_VERSION}-linux-amd64.zip" /tmp/aks-engine.zip

RUN unzip /tmp/aks-engine.zip \
 && mv aks-engine-v${AKSENGINE_VERSION}-linux-amd64/aks-engine /usr/local/bin/aks-engine \
 && rm /tmp/aks-engine.zip \
 && rm -r aks-engine-v${AKSENGINE_VERSION}-linux-amd64
