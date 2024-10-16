pipeline {
    agent any // This specifies that the pipeline can run on any available agent.
    
    stages {
        stage('Checkout') {
            steps {
                sh 'echo passed' // Print "passed" to the console
                // Uncomment to enable git checkout
                // git branch: 'master', url: 'https://github.com/manjuntha1963/docker.git'
            }
        }
        
        stage('Build docker image'){
            steps{
                script{
                    sh 'docker build -t manjuntha1963/devops-integration .'
                }
            }
        }
        stage('Push image to Hub'){
            steps{
                script{
                   withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
                   sh 'docker login -u manjuntha1963 -p ${dockerhubpwd}'
                   sh 'docker push manjuntha1963/devops-integration'
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
