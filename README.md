# GENSYN-NODE-RUN-GUIDE-BY-NTEK-NEW- 💖💖

## 📦 Prerequisites  (SHORT COMMAND)  

### 1. ✅ Increase Space :

```bash
sudo fallocate -l 16G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
```

### 2. ✅ Docker Installation

```bash
curl -fsSL https://gist.github.com/Naveenrawde3/730dd719e9813403ab1bbbebda2c5ce9/raw -o install_docker.sh && chmod +x install_docker.sh && ./install_docker.sh

```

## 3. 🧠  Gensyn RL Swarm Node Installation

```bash
# Install base tools
sudo apt update && sudo apt install -y python3 python3-venv python3-pip curl wget screen git lsof gpg

# Check Python version
python3 --version

# Install Node.js from NodeSource
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install -y nodejs

# Install Yarn without apt-key (Ubuntu 24.04+ fix)
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarn-archive-keyring.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/yarn-archive-keyring.gpg] https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list > /dev/null
sudo apt update
sudo apt install -y yarn

# Check versions
node -v && npm -v && yarn -v

# Clone Gensyn swarm repo
rm -rf rl-swarm && git clone https://github.com/gensyn-ai/rl-swarm.git

# Start screen session with environment setup
screen -S swarm -dm bash -c "
cd rl-swarm && \
python3 -m venv .venv && \
source .venv/bin/activate && \
cd modal-login && cd .. && \
git switch main && \
git reset --hard && \
git clean -fd && \
git pull origin main && \
pip install --upgrade pip && \
pip install --force-reinstall transformers==4.51.3 trl==0.19.1 && \
pip freeze && \
echo '⚠️ 20 seconds pause: Please upload your swarm.pem file...' && \
sleep 20 && \
./run_rl_swarm.sh
"

# Wait then attach to screen
sleep 2 && screen -r swarm

```

### 4. Drop File (Local PC - Termius PC)

 • Drop Your swarm.pem File - Local PC To Terminus PC
 
![17489820394627516665887876140114](https://github.com/user-attachments/assets/06fde5a8-fa7f-42ab-851c-81e69ff37bf3)


##  5. 🔐 Gensyn Login Instructions

In a new terminal window:

```bash
sudo npm install -g localtunnel
lt --port 3000
```

##  6. 💾 Backup Node :

```bash
sudo apt update && (sudo apt install -y netcat-openbsd lsof || sudo apt install -y netcat-traditional lsof) && curl -sSL -o backup.sh https://raw.githubusercontent.com/Naveenrawde3/GENSYN-NODE-RUN-GUIDE-BY-NTEK-NEW-/main/backup.sh && chmod +x backup.sh && ./backup.sh
```

## CHECK VERSION : 

```bash
cd rl-swarm && git describe --tags
```

## Check screen sessions :

```bash
screen -ls
```

## Reattach to screen session :

```bash
screen -r
```

### Remove existing swarm directory:

```bash
rm -rf rl-swarm
```

---


## 🚀 You're Done!

## JOIN TELEGRAM CHANNAL : https://t.me/ntekearning2
