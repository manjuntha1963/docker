pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "manjuntha1963/sample-docker-app:latest" // Replace with your Docker Hub username
        DOCKER_CREDENTIALS = credentials('docker-hub-credentials')       // Replace with your Jenkins credentials ID
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Clone the GitHub repository
                git branch: 'master', url: 'https://github.com/manjuntha1963/docker.git' // Replace with your GitHub repo
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image from the Dockerfile
                    docker.build(DOCKER_IMAGE)
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                script {
                    // Log in to Docker Hub using the credentials
                    docker.withRegistry('https://index.docker.io/v1/', "DOCKER_CREDENTIALS") {
                        echo 'Logged in to Docker Hub'
                    }
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Push the Docker image to Docker Hub
                    docker.image(DOCKER_IMAGE).push()
                }
            }
        }
    }

    post {
        always {
            cleanWs() // Clean up workspace after the build
        }
    }
}
