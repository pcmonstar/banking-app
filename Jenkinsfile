pipeline {

    agent any

    tools {
        maven 'Maven-3.9'
    }

    environment {
                 IMAGE_NAME = "pcmonstar/banking-app"
                 IMAGE_TAG = "${BUILD_NUMBER}"
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