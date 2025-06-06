pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('dockerhub-credentials') // Jenkins credentials ID
        DOCKER_IMAGE = 'eliteuser/spring-boot-app'
    }

    stages {
        stage('Checkout') {
            steps {
                git '' // change to your repo
            }
        }

        stage('Build JAR') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build --build-arg artifact=target/*.jar -t ${DOCKER_IMAGE}:latest ."
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_HUB_CREDENTIALS) {
                        sh "docker push ${DOCKER_IMAGE}:latest"
                    }
                }
            }
        }
    }
}
