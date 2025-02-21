pipeline {
    agent any

    tools {
        maven 'Maven 3'
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

        stage('Deploy') {
            steps {
                echo 'Deploying the application...'
            }
        }
    }
}
