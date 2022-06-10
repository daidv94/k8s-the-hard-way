#!/bin/bash
# apt-get update \
#     && apt-get install -y \
#         apt-transport-https \
#         ca-certificates \
#         curl \
#         software-properties-common \
#     && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
#     && add-apt-repository \
#         "deb https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
#         $(lsb_release -cs) \
#         stable" \
#     && apt-get update \
#     && apt-get install -y docker-ce=$(apt-cache madison docker-ce | grep 18.06 | head -1 | awk '{print $3}')

# Update the apt package index and install packages to allow apt to use a repository over HTTPS:
apt-get update -y

apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update -y

apt-get install -y docker-ce docker-ce-cli containerd.io