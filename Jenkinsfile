pipeline {
    agent any

    environment {
        IMAGE_NAME = 'brindha/devops-portfolio-app:latest'
    }

    stages {

        stage('Build Image') {
            steps {
                sh 'docker build -t devops-portfolio-app -f Docker/Dockerfile .'
            }
        }

        stage('Tag Image') {
            steps {
                sh 'docker tag devops-portfolio-app $IMAGE_NAME'
            }
        }

        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'DOCKER_USERNAME',
                    passwordVariable: 'DOCKER_PASSWORD'
                )]) {
                    sh 'echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin'
                }
            }
        }

        stage('Push Image') {
            steps {
                sh 'docker push $IMAGE_NAME'
            }
        }

        stage('Deploy Container') {
            steps {
                sh 'docker stop portfolio-app-container || true'
                sh 'docker rm portfolio-app-container || true'
                sh 'docker pull $IMAGE_NAME'
                sh 'docker run -d -p 80:80 --name portfolio-app-container $IMAGE_NAME'
            }
        }
    }
}