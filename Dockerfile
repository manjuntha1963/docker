# Dockerfile for Docker-in-Docker (DinD)

# Use the official Docker image with Docker already installed
FROM docker:20.10.24-dind

# Install necessary tools like curl, git, etc. (optional)
RUN apk update && apk add --no-cache \
    bash \
    curl \
    git

# Set environment variables for Docker-in-Docker
ENV DOCKER_TLS_CERTDIR=/certs

# Expose the Docker daemon port
EXPOSE 2375

# Entry point for Docker daemon
CMD ["dockerd"]
