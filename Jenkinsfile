pipeline {

    agent {label 'any'}

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
    }

    stages {
        
        stage('Git Clone') {
            steps {
                git 'https://github.com/manjuntha1963/docker'
            }
        }

        stage('Build') {
            steps {
                sh 'docker build -t manjuntha1963/nodeapp_test:latest .'
            }
        }

        stage('Login') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }

        stage('Push') {
            steps {
                sh 'docker push manjuntha1963/nodeapp_test:latest'
            }
        }
    }

    post {
        always {
            sh 'docker logout'
        }
    }
}
