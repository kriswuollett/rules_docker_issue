FROM ubuntu:focal

WORKDIR /app
RUN apt-get update \
      && env DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
            build-essential curl python \
            python3 python3-dev python3-pip python3-venv python3-wheel
RUN curl -sSL https://github.com/bazelbuild/bazelisk/releases/download/v1.10.1/bazelisk-linux-amd64 \
      -o /usr/local/bin/bazel && chmod +x /usr/local/bin/bazel
COPY . .
CMD ["sleep", "infinity"]
