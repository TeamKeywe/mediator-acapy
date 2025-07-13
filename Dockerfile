
FROM ghcr.io/openwallet-foundation/acapy-agent:py3.12-1.3.0

USER root

RUN apt update && apt install -y \
    jq \
    curl \
    && rm -rf /var/lib/apt/lists/*


RUN mkdir -p /configs

COPY entrypoint.sh /entrypoint.sh
COPY config.yml /configs/config.yml


RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
