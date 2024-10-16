pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
        IMAGE_VERSION = "${env.BUILD_NUMBER}" // Set the image version to the build number
    }

    stages {
        
        stage('Git Clone') {
            steps {
                git 'https://github.com/manjuntha1963/docker'
            }
        }

        stage('Build') {
            steps {
                // Tag the image with the build number
                sh "docker build -t manjuntha1963/nodeapp_test:${IMAGE_VERSION} ."
            }
        }

        stage('Login') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }

        stage('Push') {
            steps {
                // Push the image with the build number tag
                sh "docker push manjuntha1963/nodeapp_test:${IMAGE_VERSION}"
            }
        }
    }

    post {
        always {
            sh 'docker logout'
        }
    }
}
