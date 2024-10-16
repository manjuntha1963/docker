pipeline {
    agent any 
    environment {
        // Once you sign up for Docker Hub, use that user_id here
        registry = "manjuntha1963/mypythonapp"
        // Update your credentials ID after creating credentials for connecting to Docker Hub
        registryCredential = 'dockerhub-pwd'
        dockerImage = ''
    }
    
    stages {
        stage('Cloning Git') {
            steps {
                // Add your Bitbucket credentials here for private repo access
                checkout([$class: 'GitSCM', branches: [[name: '*/master']],  
                url: 'https://github.com/manjuntha1963/docker.git']]])       
            }
        }
    
        // Building Docker images
        stage('Building image') {
            steps {
                script {
                    dockerImage = docker.build registry
                }
            }
        }
    
        // Uploading Docker images into Docker Hub
        stage('Upload Image') {
            steps {    
                script {
                    docker.withRegistry('', registryCredential) {
                        dockerImage.push()
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
