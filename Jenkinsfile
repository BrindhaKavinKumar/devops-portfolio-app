pipeline {
    agent any

    environment {
        IMAGE_NAME = "brindhakavinkumar/devops-portfolio-app:latest"
    }

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

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
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin'
                }
            }
        }

        stage('Push Image') {
            steps {
                sh 'docker push $IMAGE_NAME'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh '/usr/local/bin/kubectl apply -f k8s/deployment.yaml'
                sh '/usr/local/bin/kubectl apply -f k8s/service.yaml'
                sh '/usr/local/bin/kubectl rollout restart deployment portfolio-app'
                sh '/usr/local/bin/kubectl rollout status deployment portfolio-app'
            }
        }
    }
}