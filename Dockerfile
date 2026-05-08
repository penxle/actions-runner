FROM ghcr.io/falcondev-oss/actions-runner:latest

RUN sudo apt-get update \
  && sudo apt-get install -y --no-install-recommends libatomic1 zstd build-essential pkg-config libssl-dev just gh unzip curl ca-certificates \
  && sudo rm -rf /var/lib/apt/lists/*

RUN ARCH="$(uname -m)" \
  && case "$ARCH" in \
       x86_64) AWS_ARCH="x86_64" ;; \
       aarch64|arm64) AWS_ARCH="aarch64" ;; \
       *) echo "Unsupported architecture: $ARCH" >&2; exit 1 ;; \
     esac \
  && curl -fsSL "https://awscli.amazonaws.com/awscli-exe-linux-${AWS_ARCH}.zip" -o /tmp/awscliv2.zip \
  && unzip -q /tmp/awscliv2.zip -d /tmp \
  && sudo /tmp/aws/install \
  && rm -rf /tmp/awscliv2.zip /tmp/aws

