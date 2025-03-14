pipeline {
    agent any

    tools {
        maven 'Maven 3'
    }

    environment {
        DOCKERHUB_CREDS = credentials('dockerhub-credentials')
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
                withCredentials([string(credentialsId: 'dockerhub-token', variable: 'DOCKER_TOKEN')]) {
                    sh '''
                    # Ensure Docker is in PATH
                    export PATH=$PATH:/Applications/Docker.app/Contents/Resources/bin:/usr/local/bin:/opt/homebrew/bin

                    # Build the image
                    docker build -t ${DOCKER_IMAGE} .

                    # Debug - check if Docker is working
                    docker info

                    # Login with personal access token
                    echo $DOCKER_TOKEN | docker login -u yhe494 --password-stdin

                    # Try to push (with verbose option)
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

