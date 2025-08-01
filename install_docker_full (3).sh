#!/bin/bash

# ---------------------------------
# ✅ STEP 1: System Update
# ---------------------------------
sudo apt update && sudo apt upgrade -y

# ---------------------------------
# ✅ STEP 2: Install Dependencies
# ---------------------------------
sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    software-properties-common

# ---------------------------------
# ✅ STEP 3: Add Docker GPG Key
# ---------------------------------
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
    sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# ---------------------------------
# ✅ STEP 4: Add Docker Repository
# ---------------------------------
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# ---------------------------------
# ✅ STEP 5: Install Docker
# ---------------------------------
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io

# ---------------------------------
# ✅ STEP 6: Enable Docker on Boot
# ---------------------------------
sudo systemctl enable docker

# ---------------------------------
# ✅ STEP 7: Add Current User to docker Group
# ---------------------------------
sudo usermod -aG docker $USER

# ---------------------------------
# ✅ STEP 8: Verify Docker Installation
# ---------------------------------
docker --version && echo "✅ Docker installed successfully"

# ---------------------------------
# ✅ STEP 9: (Optional) Hello World Test
# ---------------------------------
# docker run --rm hello-world

# ---------------------------------
# ✅ STEP 10: Create Idle Container
# ---------------------------------
docker run -d --restart=always --name gensyn-container busybox sleep 9999999

# ---------------------------------
# ✅ STEP 11: Install screen (Optional)
# ---------------------------------
sudo apt install -y screen

# ---------------------------------
# ✅ STEP 12: Use screen for Background Session
# ---------------------------------
# Start screen:
# screen -S swarm
# Run inside screen:
# docker run -d --name swarm busybox sleep 9999999
# Detach: Press Ctrl + A then D
# Reattach later: screen -r swarm

# ---------------------------------
# ✅ STEP 13: Auto-Restart Policy (Recommended)
# ---------------------------------
# Set restart policy without recreating:
docker update --restart=always gensyn-container

# To verify:
docker inspect gensyn-container --format='{{.HostConfig.RestartPolicy.Name}}'
# Output should be: always

# ---------------------------------
# ✅ EXTRA: Reboot Fix (If docker fails to start)
# ---------------------------------
# sudo systemctl stop docker.socket
# sudo systemctl stop docker
# sudo rm -f /var/run/docker.pid
# sudo systemctl start docker
# sudo systemctl status docker
