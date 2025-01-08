pipeline {
    agent any

    environment {
        DOCKERHUB_USERNAME = 'sajiyahsalat'
        DOCKERHUB_TOKEN = '***'
        DOCKER_IMAGE = 'sajiyahsalat/myimage'
    }

    stages {
        stage('Login to Docker Hub') {
            steps {
                script {
                    sh """
                    echo $DOCKERHUB_TOKEN | docker login -u $DOCKERHUB_USERNAME --password-stdin
                    """
                }
            }
        }
        stage('Checkout') {
            steps {
                script {
                    git branch: 'main', url: 'https://github.com/Sajiyah-Salat/webserver.git'
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }
        stage('Push to Docker Hub') {
            steps {
                script {
                    sh 'docker push $DOCKER_IMAGE'
                }
            }
        }
    }
}
