FROM gitpod/workspace-full@sha256:b484ad49d47bf70776de1d1333379d6b5f1d56c0a3fc1f31a24eb273ef772e3e
USER root

RUN mkdir $HOME/bin
RUN npm install -g @bazel/bazelisk
RUN npm install -g @bazel/ibazel
RUN npm install -g http-server

RUN apt-get update
RUN apt-get install -y zsh && \
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

ENV GOPATH=/workspace/

# RUN rm -rvf /home/gitpod/go && \
#     curl -LO https://go.dev/dl/go1.18.linux-amd64.tar.gz && \
#     tar -C /home/gitpod/ -xzf go1.18.linux-amd64.tar.gz && \
#     rm go1.18.linux-amd64.tar.gz

ARG BAZEL_BUILDTOOLS_VERSION
ARG BAZEL_BUILDTOOLS_URL="https://github.com/bazelbuild/buildtools/releases/download/"
RUN curl -sSL "${BAZEL_BUILDTOOLS_URL}/${BAZEL_BUILDTOOLS_VERSION}/buildozer" > /usr/local/bin/buildozer && \
    curl -sSL "${BAZEL_BUILDTOOLS_URL}/${BAZEL_BUILDTOOLS_VERSION}/buildifier" >  /usr/local/bin/buildifier && \
    chmod +x /usr/local/bin/buildozer && \
    chmod +x /usr/local/bin/buildifier 

RUN wget -O $HOME/bin/gostarlark https://github.com/stackb/bzl/releases/download/0.9.4/bzl && \
  chmod +x $HOME/bin/gostarlark

USER gitpod