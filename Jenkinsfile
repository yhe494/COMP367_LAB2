pipeline {
    agent any

    tools {
        maven 'Maven 3'
    }

    environment {
        DOCKERHUB_CREDS = credentials('CredentialID_DockerHubPWD')
        DOCKER_IMAGE = "yhe494/comp367_lab2:1.3"
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

        stage('Time-Based Greeting') {
            steps {
                script {
                    def hour = new java.util.Date().hours
                    if (hour < 12) {
                        echo 'Good Morning!'
                    } else {
                        echo 'Good Afternoon!'
                    }
                }
            }
        }

        stage("Docker Build & Push") {
            steps {
                sh '''
                # Ensure Docker is in PATH
                export PATH=$PATH:/Applications/Docker.app/Contents/Resources/bin:/usr/local/bin:/opt/homebrew/bin

                # Build the image
                docker build -t ${DOCKER_IMAGE} .

                # Login and push
                echo $DOCKERHUB_CREDS_PSW | docker login -u $DOCKERHUB_CREDS_USR --password-stdin
                docker push ${DOCKER_IMAGE}

                # Logout immediately to minimize credential exposure
                docker logout
                '''
            }
        }
    }

    post {
        always {
            echo "Pipeline completed"
        }
        success {
            echo "Pipeline succeeded"
        }
        failure {
            echo "Pipeline failed"
        }
    }
}