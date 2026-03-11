pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t portfolio-app -f Docker/Dockerfile .'
            }
        }

        stage('Stop Old Container') {
            steps {
                sh 'docker stop portfolio-app-container || true'
                sh 'docker rm portfolio-app-container || true'
            }
        }

        stage('Run New Container') {
            steps {
                sh 'docker run -d -p 80:80 --name portfolio-app-container portfolio-app'
            }
        }
    }
}