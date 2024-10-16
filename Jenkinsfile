pipeline {
    agent {
        docker {
            image 'manjuntha1963/maven-abhishek-docker-agent:v1'
            args '--user root -v /var/run/docker.sock:/var/run/docker.sock' // Mount Docker socket to access the host's Docker daemon
        }
    }
    stages {
        stage('Checkout') {
            steps {
                sh 'echo passed'
                // Uncomment to enable git checkout
                // git branch: 'master', url: 'https://github.com/manjuntha1963/docker.git'
            }
        }
        stage('Build and Push Docker Image') {
            environment {
                DOCKER_IMAGE = "manjuntha1963/ultimate-cicd:${BUILD_NUMBER}" // Unique image tag using build number
                REGISTRY_CREDENTIALS = credentials('docker-cred') // Use the credentials ID you set in Jenkins
            }
            steps {
                script {
                    // Corrected the syntax for the build command
                    sh "docker build -t ${DOCKER_IMAGE} ." // Use double quotes for variable interpolation
                    def dockerImage = docker.image("${DOCKER_IMAGE}")
                    docker.withRegistry('https://index.docker.io/v1/', REGISTRY_CREDENTIALS) {
                        dockerImage.push() // Push the image to Docker Hub
                    }
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
