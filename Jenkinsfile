pipeline {

    agent any

    tools {
        maven 'Maven-3.9'
    }

    stages {

        stage('Checkout') {
            steps {
                echo 'Checking out source code...'
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo 'Building application...'
                sh 'mvn clean package'
            }
        }
	
	stage('Docker Build') {
	    steps {
               echo 'Building Docker Image...'
	       sh 'docker build -t banking-app-v1 .'
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