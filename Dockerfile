FROM debian:trixie-slim

ARG CLOUDFLARED_VERSION=2026.5.0

LABEL maintainer="Manuel Martinez <sina@serverscstrike.com>"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install --no-install-recommends -y \
        ca-certificates \
        wget \
        adduser \
    && wget -O /tmp/cloudflared.deb https://github.com/cloudflare/cloudflared/releases/download/$CLOUDFLARED_VERSION/cloudflared-linux-amd64.deb \
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
