pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-creds')  // Jenkins credentials ID
        IMAGE_NAME = 'samkitchopda/mydockerpipelineapp'          // Change this to your Docker Hub repo
        IMAGE_TAG = 'v1'
    }

    stages {
        stage('Checkout') {
            steps {
                echo "Cloning repository..."
                git branch: 'main', url: 'https://github.com/SAMKIT-CHOPDA/MyDockerPipelineApp.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image..."
                bat 'docker build -t %IMAGE_NAME%:%IMAGE_TAG% .'
            }
        }

        stage('Login to DockerHub') {
            steps {
                echo "Logging in to Docker Hub..."
                bat 'echo %DOCKERHUB_CREDENTIALS_PSW% | docker login -u %DOCKERHUB_CREDENTIALS_USR% --password-stdin'
            }
        }

        stage('Push Docker Image') {
            steps {
                echo "Pushing Docker image to Docker Hub..."
                bat 'docker push %IMAGE_NAME%:%IMAGE_TAG%'
            }
        }
    }

    post {
        success {
            echo " Docker image successfully built and pushed to Docker Hub!"
        }
        failure {
            echo " Build failed!"
        }
    }
}
