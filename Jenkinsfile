pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = 'YOUR_DOCKER_USERNAME/my-web-app:latest'
    }
    
    stages {
        stage('Check HTML Files') {
            steps {
                echo 'Checking if HTML files exist...'
                sh 'ls -la *.html || echo "No HTML files found"'
            }
        }
        
        stage('Test PHP') {
            steps {
                sh 'find . -name "*.php" -exec php -l {} \; || echo "No PHP files"'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t ${DOCKER_IMAGE} .'
            }
        }
        
        stage('Push to Docker Hub') {
            steps {
                withDockerRegistry([credentialsId: 'docker-hub', url: 'https://index.docker.io/v1/']) {
                    sh 'docker push ${DOCKER_IMAGE}'
                }
            }
        }
    }
}
