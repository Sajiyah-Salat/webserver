pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-creds') // Docker Hub credentials
        DOCKER_IMAGE = 'sajiyasalat/myimage'
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    // Checkout the code from the private GitHub repository using credentials
                    git credentialsId: 'github-creds', url: 'https://github.com/your-repo/your-project.git'
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }
        stage('Login to Docker Hub') {
            steps {
                script {
                    // Login to Docker Hub
                    sh "echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin"
                }
            }
        }
        stage('Push to Docker Hub') {
            steps {
                script {
                    // Push the Docker image to Docker Hub
                    sh 'docker push $DOCKER_IMAGE'
                }
            }
        }
    }
}
