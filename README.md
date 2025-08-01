# GENSYN-NODE-RUN-GUIDE-BY-NTEK-NEW- 💖💖

## Node Management**
  
## 🔄 Inter Gensyn Screen :

```bash
screen -r gensyn
```

## Check screen sessions :

```bash
screen -ls
```

## Reattach to screen session :

```bash
screen -r
```

## Delete a screen session :

```bash
screen -S 65432.gensyn -X quit
```

### Remove existing swarm directory:

```bash
rm -rf rl-swarm
```

1. **Download and send the script to your VPS home folder: DOWNLOAD FILE IN TELEGRAM & DRAG &DROP LOCAL PC TO VPS (SFTR) FOLDER

![17489820394627516665887876140114](https://github.com/user-attachments/assets/06fde5a8-fa7f-42ab-851c-81e69ff37bf3)


## 📦 Prerequisites

### ✅ Docker Installation

```bash
curl -L https://raw.githubusercontent.com/Naveenrawde3/GENSYN-NODE-RUN-GUIDE-BY-NTEK-NEW-/main/install_docker_full%20(3).sh -o install_docker.sh
chmod +x install_docker.sh
./install_docker.sh
```

---

5. **Test Docker:**

```bash
docker run hello-world
docker ps
```

---

## 🧠 Gensyn RL Swarm Node Installation

### Step 1: Install system dependencies

```bash
sudo apt update && sudo apt install -y python3 python3-venv python3-pip curl wget screen git lsof
```

### 🐍 Check Python Version

```bash
python3 --version
```

### Step 2: Install Node.js and Yarn

```bash
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install -y nodejs

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list > /dev/null
sudo apt update && sudo apt install -y yarn
```

### ✅ Check Versions

```bash
node -v
npm -v
yarn -v
````

### Step 3: Clone the repository and enter a screen session

```bash
git clone https://github.com/gensyn-ai/rl-swarm.git
screen -S swarm
```

### Step 4: Setup Python environment and install dependencies

```bash
cd rl-swarm
python3 -m venv .venv
source .venv/bin/activate
cd modal-login
cd ..

git switch main
git reset --hard
git clean -fd
git pull origin main

pip install --force-reinstall transformers==4.51.3 trl==0.19.1
pip freeze
```

### 5. Drop File (Local PC - Termius PC)

 • Drop Your swarm.pem File - Local PC To Terminus PC
 
![17489820394627516665887876140114](https://github.com/user-attachments/assets/06fde5a8-fa7f-42ab-851c-81e69ff37bf3)


### Step 6: Start the swarm

```bash
./run_rl_swarm.sh
```

---

## 🔐 Gensyn Login Instructions

In a new terminal window:

```bash
sudo npm install -g localtunnel
lt --port 3000
```

* Login with your **VPS IP as the password**
* Keep the page open until the **swarm address appears**

---

## 💾 Backup Node (Optional)

```bash
[ -f backup.sh ] && rm backup.sh; \
curl -sSL -O https://raw.githubusercontent.com/AbhiEBA/gensyn1/main/backup.sh && \
chmod +x backup.sh && ./backup.sh
```

---

## ⚙️ Troubleshooting

### 🔧 Solution 1: 
Reinstall correct Python libraries

```bash
pip install --force-reinstall transformers==4.51.3 trl==0.19.1
pip freeze
bash run_rl_swarm.sh
```

### 🔧 Solution 2: Fix reward tensor error

```bash
sed -i 's/rewards = torch.tensor(rewards)/rewards = torch.tensor([[r, 0.0] if isinstance(r, (int, float)) else r for r in rewards])/g' .venv/lib/python3.12/site-packages/genrl/trainer/grpo_trainer.py
./run_rl_swarm.sh
```

### 🔧 Solution 3: Reset virtual environment

```bash
rm -rf .venv
python3 -m venv .venv
source .venv/bin/activate
./run_rl_swarm.sh
```

### 🔧 Solution 4: Increase daemon timeout

```bash
sed -i 's/startup_timeout: float = *15/startup_timeout: float = 300/' ~/rl-swarm/.venv/lib/python3.12/site-packages/hivemind/p2p/p2p_daemon.py
./run_rl_swarm.sh
```

---

## 🚀 You're Done!

## JOIN TELEGRAM CHANNAL : https://t.me/ntekearning2
