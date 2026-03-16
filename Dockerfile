FROM ghcr.io/falcondev-oss/actions-runner:latest

RUN sudo apt-get update \
  && sudo apt-get install -y --no-install-recommends libatomic1 zstd \
  && sudo rm -rf /var/lib/apt/lists/*
