# Node.js CI/CD pipeline with Jenkins, Docker & AWS EC2

![Node.js](https://img.shields.io/badge/Node.js-339933?style=flat&logo=nodedotjs&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=flat&logo=docker&logoColor=white)
![Jenkins](https://img.shields.io/badge/Jenkins-D24939?style=flat&logo=jenkins&logoColor=white)
![AWS EC2](https://img.shields.io/badge/AWS_EC2-FF9900?style=flat&logo=amazonaws&logoColor=white)

> **Note:** The Node.js application is based on Heroku's open-source starter template. All DevOps work — Dockerfile, Jenkinsfile, CI/CD pipeline design, and AWS EC2 deployment — was implemented by me as a hands-on learning project.

---

## What this project does

A complete automated deployment pipeline that takes code from GitHub, builds a Docker image, pushes it to Docker Hub, and deploys it to an AWS EC2 instance — all triggered automatically via Jenkins.

## Pipeline architecture

```
GitHub push → Jenkins trigger → Docker build → Docker Hub push → EC2 deploy
```

---

## Run locally

```bash
git clone https://github.com/sopatel14/nodejs-getting-started.git
cd nodejs-getting-started
npm install
npm start
# App runs at http://localhost:5006
```

## Run with Docker

```bash
docker build -t new-nodejs:latest .
docker run -d -p 5006:5006 new-nodejs:latest
# App runs at http://localhost:5006
```

## Jenkins pipeline stages

```
1. Checkout    – clone repo from GitHub
2. Build       – docker build -t new-nodejs:latest .
3. Push        – tag & push to sopatel264/new-nodejs on Docker Hub
4. Deploy      – SSH into EC2, pull image, restart container
```

---

## Challenges & how I solved them

- **Port conflicts on EC2** — added `docker stop || true` before each deploy to handle already-running containers
- **Jenkins credential errors** — used Jenkins credential store instead of hardcoding secrets in Jenkinsfile
- **Low EC2 RAM** — optimised the Dockerfile to reduce image size and avoid OOM kills

## What's next

- Versioned Docker tags instead of `latest`
- Terraform for EC2 provisioning
- Prometheus + Grafana monitoring
- Separate Jenkins and app servers

---

Docker Hub: `sopatel264/new-nodejs` · [LinkedIn](https://www.linkedin.com/in/sourav-patel-devops/)
