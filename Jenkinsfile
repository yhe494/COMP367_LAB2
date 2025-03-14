pipeline {
    agent any

    tools {
        maven 'Maven 3'
    }

    environment
    {
        DOCKERHUB_PWD=credentials('CredentialID_DockerHubPWD')
    }
    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/yhe494/COMP367_LAB2.git', branch: 'main'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean install'
            }
        }

        stage('Morning Greeting') {
            steps {
                script {
                    // Get the current hour
                    def hour = new java.util.Date().hours
                    if (hour < 12) {
                        echo 'Good Morning!'
                    } else {
                        echo 'It is no longer morning.'
                    }
                }
            }
        }

        stage('Afternoon Greeting') {
            steps {
                script {
                    // Get the current hour
                    def hour = new java.util.Date().hours
                    if (hour >= 12) {
                        echo 'Good Afternoon!'
                    } else {
                        echo 'It is not yet afternoon.'
                    }
                }
            }
        }

        stage("Unit test"){
        steps{
        sh "mvn test"
        }
        }

        stage("Docker build"){
            steps{
            script{
            sh 'docker build -t yhe494/COMP367_LAB2:1.3 .'}}}
    }
        stage("Docker login"){
            steps{
                 script{
                    sh 'docker login -u yhe494 -p ${DOCKERHUB_PWD}'
                 }
            }
        }
}
