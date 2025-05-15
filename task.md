# 🛠️ Infrastructure Engineer Take-Home Assignment

Welcome! This repository contains a scaffolded Flask application that you'll use as a starting point for your take-home exercise. Your task is to build, containerize, and deploy this service, integrating it into a basic CI/CD pipeline.

---

## 🎯 Objective

You will:

- Extend the Flask service to support simple data persistence and updates.
- Containerize the application and run it using Docker Compose.
- Deploy it to AWS ECS.
- Set up a GitHub Actions CI/CD pipeline for automated deployment.
- Document and explain your decisions.

This should take **no more than 2–3 hours**.

---

## 📦 What’s Included

- A basic Flask app structure with a `/data` endpoint stub
- SQLAlchemy setup for PostgreSQL
- Example environment configuration in `.env.example`

---

## ✅ Your Deliverables

1. **Flask App**:
   - Implement logic for `/data` to insert or update JSON records in the database.
   - Extend the `DataRecord` model as needed.

2. **Dockerization**:
   - Ensure the service runs with Docker Compose.
   - Your app should be available at `http://localhost:<port>/data`.

3. **Deployment to AWS ECS**:
   - Create the necessary ECS task definitions and deployment configs.
   - Use Pulumi, Terraform, or CloudFormation (your choice) for infrastructure.
   - Make sure we can run your infra with minimal effort (scripts or README steps).

4. **CI/CD Pipeline**:
   - Add a GitHub Actions workflow that:
     - Builds and pushes your image to a registry (ECR, Docker Hub, etc.)
     - Deploys the latest version to ECS.

5. **Documentation**:
   - Clear instructions on how to:
     - Run the app locally
     - Deploy to AWS
     - Use the `/data` endpoint
   - Brief explanation of your design choices and any trade-offs.

---

## 🚀 Getting Started

1. **Install dependencies**:

   You’ll need:
   - Docker + Docker Compose
   - Python 3.11 (optional, for local testing)
   - AWS CLI + credentials
   - Pulumi or Terraform (if applicable)

2. **Run locally with Docker Compose**:

   ```bash
   cp .env.example .env
   docker-compose up --build
   ```

   The app will be available at [http://localhost:5000](http://localhost:5000) or another port if you configure it.

3. **Test the endpoint**:

   ```bash
   curl -X POST http://localhost:5000/data \
        -H "Content-Type: application/json" \
        -d '{"key": "user123", "value": "some info"}'
   ```

---

## 🧪 Live Review

After submission, we’ll schedule a **live session** where you’ll walk us through your solution. Be ready to explain your:

- Code structure and choices
- Deployment setup
- CI/CD pipeline
- Error handling and edge cases
- Future improvements and changes required to make it production ready.

---

## 📁 Project Structure

```
project-root/
├── app/
│   ├── __init__.py
│   ├── main.py
│   └── models.py
├── Dockerfile
├── docker-compose.yaml
├── ecs/                # Optional: infra-as-code here
│   └── ...
├── .github/
│   └── workflows/
│       └── ci-cd.yaml
├── .env.example
├── README.md
└── requirements.txt
```

---

## 📝 Notes

- Make reasonable assumptions.
- Feel free to use third-party libraries if it saves time.
- Focus on clarity and correctness, not polish.

---

Thanks again for taking the time to complete this! If you have any questions, reach out to your contact at Monarch.