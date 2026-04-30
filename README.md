# 🚀 Node.js CI/CD Pipeline with Jenkins, Docker & AWS

Before containerizing and deploying, the application was tested locally to ensure it runs correctly.

## 🧪 Local Development & Testing


### 1. Install Dependencies

```bash
npm install
```

### 2. Run Application

```bash
npm start
```

### 3. Access Application

```bash
http://localhost:5006
```

### ✅ Purpose

* Validate application functionality before Dockerizing
* Catch runtime errors early
* Ensure correct port configuration

---

## 🐳 Dockerization

After verifying the app locally, it was containerized using Docker.

### Build Image

```bash
docker build -t new-nodejs:latest .
```

### Run Container

```bash
docker run -d -p 5006:5006 new-nodejs:latest
```

### Access Application

```bash
http://localhost:5006
```




---

## 📖 Overview

This project demonstrates a complete **CI/CD pipeline** for a Node.js application using Jenkins, Docker, and AWS EC2.

The pipeline automates:

* Building a Docker image
* Pushing the image to Docker Hub
* Deploying the application on AWS EC2

---

## 🏗️ Architecture

```bash
GitHub → Jenkins → Docker Build → Docker Hub → AWS EC2
```

---

## ⚙️ Tech Stack

* Node.js
* Jenkins
* Docker
* Docker Hub
* AWS EC2

---

## 🔄 CI/CD Pipeline Flow

### 1. Code Checkout

```bash
git clone https://github.com/sopatel14/nodejs-getting-started.git
```

### 2. Build Docker Image

```bash
docker build -t new-nodejs:latest .
```

### 3. Push to Docker Hub

```bash
docker tag new-nodejs:latest sopatel264/new-nodejs:latest
docker push sopatel264/new-nodejs:latest
```

### 4. Deploy on EC2

```bash
docker stop node-app || true
docker rm node-app || true
docker pull sopatel264/new-nodejs:latest
docker run -d -p 5006:5006 --name node-app sopatel264/new-nodejs:latest
```

---

## 📸 Application Running

<img width="2558" height="1788" alt="image" src="https://github.com/user-attachments/assets/315f919d-172c-4c50-aa6c-520c43b6bae8" />



---

## 📂 Project Structure

```bash
.
├── Dockerfile
├── Jenkinsfile
├── package.json
├── index.js

```

---

## ⚠️ Challenges Faced

```bash
- Docker container conflicts (port already in use)
- Jenkins credential configuration issues
- Debugging container startup failures
- Managing limited EC2 resources (low RAM)
```

---

## 📈 Future Improvements

```bash
- Implement version-based tagging instead of 'latest'
- Add rollback mechanism
- Introduce monitoring (Prometheus, Grafana)
- Use separate EC2 for Jenkins and application
- Automate infrastructure using Terraform
```

---

## 🎯 Key Learnings

```bash
- CI/CD pipeline design and automation
- Secure credential handling in Jenkins
- Docker image vs container lifecycle
- Importance of idempotent deployments
- Debugging real-world DevOps issues
```

---

## 👨‍💻 Author

**Sourav Patel**
Aspiring DevOps Engineer

---
