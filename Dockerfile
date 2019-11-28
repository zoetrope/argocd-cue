FROM quay.io/cybozu/ubuntu:18.04 AS ubuntu

ARG CUR_VERSION=0.0.14

WORKDIR /work
RUN curl -sSL -o cue.tar.gz https://github.com/cuelang/cue/releases/download/v${CUR_VERSION}/cue_${CUR_VERSION}_Linux_x86_64.tar.gz \
    && tar xvzf cue.tar.gz \
    && rm -f cue.tar.gz

FROM argoproj/argocd:latest

COPY --from=ubuntu /work/cue /usr/local/bin/cue
