pipeline {
    agent any

    stages {

        stage('Build Image') {
            steps {
                sh 'docker build -t devops-portfolio-app -f Docker/Dockerfile .'
            }
        }

        stage('Tag Image') {
            steps {
                sh 'docker tag devops-portfolio-app brindha/devops-portfolio-app:latest'
            }
        }

        stage('Push Image') {
            steps {
                sh 'docker push brindha/devops-portfolio-app:latest'
            }
        }

        stage('Deploy Container') {
            steps {
                sh 'docker stop portfolio-app-container || true'
                sh 'docker rm portfolio-app-container || true'
                sh 'docker pull brindha/devops-portfolio-app:latest'
                sh 'docker run -d -p 80:80 --name portfolio-app-container brindha/devops-portfolio-app:latest'
            }
        }
    }
}