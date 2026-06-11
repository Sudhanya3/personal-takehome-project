To-Do List App with CI/CD Pipeline

Overview

This is a simple To-Do List web application built to demonstrate a complete CI/CD pipeline using GitHub Actions, Docker, and GitHub Container Registry (GHCR).

The application allows users to add, view, and delete tasks (if implemented).

The project focuses on automation, containerization, and basic DevSecOps practices.

Tech Stack

- HTML / CSS / JavaScript (or your actual stack)
- Docker
- GitHub Actions (CI/CD)
- GitHub Container Registry (GHCR)
- Trivy (SCA security scanning)
- Self-hosted GitHub Actions runner (macOS)

CI/CD Pipeline Overview

Every push to the `main` branch triggers an automated pipeline:

1.  Checkout Code
    Retrieves the latest source code from the repository.

2.  Build Docker Image
    Builds a Docker image for the application and tags it using the commit SHA.

3.  Security Scan (SCA)
    Uses Trivy to scan the Docker image for vulnerabilities:

- Fails the pipeline on CRITICAL vulnerabilities
- Ignores unfixed vulnerabilities to reduce noise

4.  Push Image to GHCR
    Pushes the Docker image to GitHub Container Registry.

5.  Deploy Container
    Stops any existing container and runs the updated version of the application.

Security Approach

Software Composition Analysis (SCA)

- Tool: Trivy
- Scans container images for known vulnerabilities in OS packages and dependencies
- Blocks deployment on critical vulnerabilities

Controlled Risk Handling

- Only CRITICAL vulnerabilities block the pipeline
- Unfixed vulnerabilities are ignored to avoid false positives and pipeline noise

Secure Image Distribution

- Uses GHCR for container storage
- Authentication handled via `GITHUB_TOKEN`

How to Run Locally

1.  Clone the repository

```bash
git https://github.com/Sudhanya3/personal-takehome-project.git
cd personal-takehome-project
```

2. Build Docker image
   docker build -t todo-app .

3. Run the container
   docker run -d -p 8080:80 todo-app
4. Open the application
   http://localhost:8080

5. Run from GHCR
   docker pull ghcr.io/<username>/todo-app:latest
   docker run -d -p 8080:80 ghcr.io/<username>/todo-app:latest

CI/CD Flow Summary

Git Push → GitHub Actions → Building Docker Image → Trivy Scan → Push to GHCR → Deploy Container 
