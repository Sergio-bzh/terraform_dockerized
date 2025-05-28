FROM debian:bookworm-slim

# Évite les prompts interactifs (utile pour apt)
ENV DEBIAN_FRONTEND=noninteractive

# # Installe Terraform + outils utiles
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y \
    sudo \
    curl \
    unzip \
    gnupg \
    ca-certificates \
    software-properties-common \
    vim \
    && curl -fsSL https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com bookworm main" > /etc/apt/sources.list.d/hashicorp.list \
    && apt-get update && apt-get install -y terraform \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# WORKDIR /workspace ## unecessary because we will declare it and use it in docker-compose

# CMD [ "/bin/bash" ] ## unecessary because we will declare it and use it in docker-compose
