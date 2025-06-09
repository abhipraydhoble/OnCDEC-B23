# SonarQube Installation Guide

## Step 1: Install Java
Run the following commands to install Java:
```bash
sudo apt-get update && sudo apt-get install openjdk-11-jdk -y
```

## Step 2: Install Unzip Utility
```bash
sudo apt install unzip
```

## Step 3: Create a New User for SonarQube
Switch to the root user and execute:
```bash
adduser sonarqube
```

## Step 4: Download and Extract SonarQube
Switch to the `sonarqube` user and execute:
```bash
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.4.0.54424.zip
```
```bash
unzip sonarqube-9.4.0.54424.zip
```

## Step 5: Set Permissions
Switch back to the root user and execute:
```bash
chmod -R 755 /home/sonarqube/sonarqube-9.4.0.54424
chown -R sonarqube:sonarqube /home/sonarqube/sonarqube-9.4.0.54424
```

## Step 6: Start SonarQube
Switch to the `sonarqube` user, navigate to the `bin` directory, and start the service:
```bash
cd /home/sonarqube/sonarqube-9.4.0.54424/bin/linux-x86-64/
./sonar.sh start
```

SonarQube is now installed and running. You can access it through your web browser by navigating to `http://<your-server-ip>:9000`. Use default credentials (`admin` / `admin`) for the first login.
