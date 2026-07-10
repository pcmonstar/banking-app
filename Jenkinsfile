pipeline {

    agent any

    tools {
        maven 'Maven-3.9'
    }

    environment {
        IMAGE_NAME = "pcmonstar/banking-app"
        IMAGE_TAG  = "${BUILD_NUMBER}"
    }

    stages {

        stage('Build') {
            steps {
                echo 'Building application...'
                sh 'mvn clean package'
            }
        }

        stage('Docker Build') {
            steps {
                echo "Building Docker Image ${IMAGE_NAME}:${IMAGE_TAG}"
                sh 'docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .'
            }
        }

        stage('Docker Push') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'dockerhub',
                        usernameVariable: 'DOCKER_USER',
                        passwordVariable: 'DOCKER_PASS'
                    )
                ]) {

                    sh '''
                        echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                        docker push ${IMAGE_NAME}:${IMAGE_TAG}
			docker logout
                    '''
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                echo "Deploying version ${IMAGE_NAME}:${IMAGE_TAG} to Kubernetes"
                sh '''
                kubectl set image deployment/banking-app banking-app=${IMAGE_NAME}:${IMAGE_TAG} -n dev

                kubectl rollout status deployment/banking-app -n dev
                '''
            }
        }
    }

    post {
        success {
            echo 'Build completed successfully.'
        }

        failure {
            echo 'Build failed.'
        }
    }
}