
## 🧠  **Introduction to Datadog**

### 🔹 What is Datadog?

* A **cloud-native observability platform**.
* Provides **monitoring**, **alerting**, **log management**, **APM**, and **security** in one platform.
* Used for monitoring **applications, infrastructure, containers, networks, and services**.

### 🔹 Key Features:

* Infrastructure Monitoring
* Application Performance Monitoring (APM)
* Log Management
* Real User Monitoring (RUM)
* Synthetic Monitoring (uptime checks)
* Dashboarding & Alerts


## 🌐  **Introduction to the Datadog UI**



| Section            | Purpose                                              |
| ------------------ | ---------------------------------------------------- |
| **Dashboards**     | Visualize metrics using graphs, tables, etc.         |
| **Monitors**       | Create alerts based on metric thresholds, logs, etc. |
| **Infrastructure** | View hosts, containers, services in maps             |
| **Logs**           | Centralized log ingestion and search                 |
| **APM**            | View traces, services, dependencies                  |
| **Synthetics**     | Simulate user requests to monitor uptime             |
| **Integrations**   | Connect with AWS, Kubernetes, Redis, MySQL, etc.     |

---

## 🖥️  **Installing the Datadog Agent**

### 📍 A. On **Linux**

1. **Add the Datadog package repo:**

   ```bash
   DD_API_KEY=<YOUR_API_KEY> bash -c "$(curl -L https://s3.amazonaws.com/dd-agent/scripts/install_script.sh)"
   ```

2. **Verify Agent is Running:**

   ```bash
   sudo systemctl status datadog-agent 
   ```




---

## 🏗️ **Introduction to Infrastructure Monitoring**

### 🔍 What is it?

* Continuous monitoring of **servers, containers, databases, and services**.
* Helps detect **resource bottlenecks, downtimes, or failures**.

### 🔧 Key Metrics:

* CPU, Memory, Disk, Network I/O
* System load, processes, uptime
* Container health, node metrics (for Kubernetes)

### 📊 Use Dashboards To:

* Monitor real-time metrics
* Spot anomalies
* Drill down into node- or container-specific issues

---

## 🖥️ **Monitoring Hosts**

### 🔹 Host = Any physical/virtual machine with Datadog Agent

* Once the agent is installed, the host will show up in **Infrastructure > Host Map**.

### 🔹 Host Metrics:

* `system.cpu.user`
* `system.mem.used`
* `system.disk.in_use`
* `system.load.1`
