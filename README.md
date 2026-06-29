# Node.js CI/CD Pipeline with Docker, AWS EC2 & Docker Compose

[![Docker build-push](https://github.com/sopatel14/nodejs-getting-started/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/sopatel14/nodejs-getting-started/actions/workflows/docker-publish.yml)

A production-ready Node.js application demonstrating containerization, CI/CD with GitHub Actions, Docker Hub image publishing, and deployment using Docker Compose on AWS EC2.

**Tech Stack:** Node.js • Docker • GitHub Actions • Docker Hub • Docker Compose • AWS EC2

> Note: The Node.js application is based on Heroku's open-source starter template. All DevOps work — Dockerfile, CI/CD pipeline design, AWS EC2 deployment, and Docker Compose orchestration — was implemented by me as a hands-on learning project.

---
![Node.js](https://img.shields.io/badge/Node.js-339933?style=flat&logo=nodedotjs&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=flat&logo=docker&logoColor=white)
![Jenkins](https://img.shields.io/badge/Jenkins-D24939?style=flat&logo=jenkins&logoColor=white)
![AWS EC2](https://img.shields.io/badge/AWS_EC2-FF9900?style=flat&logo=amazonaws&logoColor=white)



# What this project does

This project demonstrates a complete DevOps workflow:

* Code pulled from GitHub
* Application containerized using Docker
* Deployed on AWS EC2
* Multi-container architecture managed using Docker Compose

The system runs:

* Node.js Web Application
* PostgreSQL Database
* Redis Cache

---

# Pipeline Architecture

GitHub → Docker Build → EC2 Deployment → Docker Compose Up

---

# Multi-Container Setup (Docker Compose)

Docker Compose is used to manage all services in a single configuration file.

It handles:

* Service orchestration
* Internal networking between containers
* Database persistence using volumes
* Healthchecks for service readiness
* Restart policies for reliability

---

# Project Services

* Web App → Node.js (Port 5006)
* Database → PostgreSQL
* Cache → Redis

---

# Run Locally (Without Docker)

```bash id="lq3v8n"
git clone https://github.com/sopatel14/nodejs-getting-started.git
cd nodejs-getting-started
npm install
npm start
```

App runs at:
http://localhost:5006

---

# Run with Docker (Single Container)

```bash id="q7m1zd"
docker build -t new-nodejs:latest .
docker run -d -p 5006:5006 new-nodejs:latest
```

---

# Run with Docker Compose (Multi-Container Setup)

```bash id="m0x8pl"
docker compose up -d
```

This starts:

* Node.js application
* PostgreSQL database
* Redis cache

App runs at:
http://<EC2-PUBLIC-IP>:5006

---

# Screenshots

## 1. Docker Compose Running Containers

Shows all services running together.

```bash
docker compose ps
```

📸 Screenshot:

<img width="1212" height="127" alt="image" src="https://github.com/user-attachments/assets/86a8968d-06ab-4113-87a5-ef94b880c0b4" />


---

## 2. Application Running in Browser

Proof of successful deployment.

```
http://<EC2-PUBLIC-IP>:5006
```

📸 Screenshot:

<img width="1667" height="900" alt="image" src="https://github.com/user-attachments/assets/3b138984-9a77-40c9-a46c-b6c56580a527" />


---

## 3. PostgreSQL Healthcheck Status

Shows database readiness using Docker healthchecks.

```bash
docker inspect postgres-db
```

📸 Screenshot:

<img width="659" height="430" alt="image" src="https://github.com/user-attachments/assets/38d019b8-dcac-46f3-aab4-305c49b76645" />


---

## Docker Compose Configuration Highlights

* depends_on ensures correct startup order
* healthcheck ensures database readiness
* restart: always improves reliability
* named volumes persist database data
* custom network enables service communication

---

# Challenges & Solutions

**1. Port configuration issues**

* Fixed by ensuring correct mapping: `5006:5006`

**2. Database readiness problem**

* Solved using healthchecks and `depends_on`

**3. Container orchestration complexity**

* Simplified using Docker Compose

**4. Persistent storage**

* Implemented using named volumes

---

# Key Learnings

* Docker Compose simplifies multi-container architecture
* Healthchecks are critical for production readiness
* Restart policies improve system resilience
* Containers must listen on `0.0.0.0` for external access
* AWS Security Groups control external accessibility

---

# What’s next

* Add versioned Docker image tagging
* Introduce Terraform for infrastructure provisioning
* Add Prometheus + Grafana monitoring
* Explore Kubernetes for scaling and orchestration
