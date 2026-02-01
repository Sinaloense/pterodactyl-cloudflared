FROM debian:bookworm-slim

LABEL maintainer="Manuel Martinez <sina@serverscstrike.com>"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
        ca-certificates \
        wget \
    && ARCH=$(uname -m) \
    && if [ "$ARCH" = "x86_64" ]; then \
        wget -O /tmp/cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb; \
    elif [ "$ARCH" = "aarch64" ]; then \
        wget -O /tmp/cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm64.deb; \
    else \
        echo "Unsupported architecture: $ARCH" && exit 1; \
    fi \
    && dpkg -i /tmp/cloudflared.deb \
    && rm /tmp/cloudflared.deb \
    && rm -rf /var/lib/apt/lists/* \
    && adduser --disabled-password --home /home/container container

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

CMD ["/entrypoint.sh"]
