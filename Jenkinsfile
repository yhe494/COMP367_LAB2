pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/yhe494/COMP367_LAB2', branch: 'main'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean install'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying application'
            }
        }
    }
}
