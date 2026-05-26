pipeline {
    agent any
    environment {
        SCANNER_HOME = tool 'sonarqube'
        DOCKER_IMAGE = 'rishalsingh/node-todo-app'
    }
    stages {
        stage('pull code form git') {
            steps {
                git branch: 'master',
                url: 'https://github.com/Rishal-Singh/node-todo-cicd.git'
            }
        }
        
        stage('sonar scan') {
            steps {
                withSonarQubeEnv('sonar') {
            sh '''
                $SCANNER_HOME/bin/sonar-scanner \
                -Dsonar.projectName=node-todo-app \
                -Dsonar.projectKey=node-todo-app \
                -Dsonar.sources=. \
            '''
                }
            }
        }
        
        stage('owasp dc check') {
            steps {
               dependencyCheck additionalArguments: '''
                    --scan .
                    --format ALL
                ''',
                odcInstallation: 'dc'
                dependencyCheckPublisher pattern: '**/dependency-check-report.xml'
            }
        }
        
        stage('build code') {
            steps {
                sh 'docker build -t node-todo-app .'
                sh 'docker images'
            }
        }
        
        stage('Trivy-scan') {
            steps {
                 sh 'trivy image node-todo-app'
            }
        }
        
        stage('Push Docker Image') {

            steps {

                withCredentials([usernamePassword(
                    credentialsId: 'dockerhublogin',
                    usernameVariable: 'DOCKERHUB_USER',
                    passwordVariable: 'DOCKERHUB_PASS'
                )]) {

                    sh '''
                    echo "$DOCKERHUB_PASS" | docker login -u "$DOCKERHUB_USER" --password-stdin

                    docker tag node-todo-app:latest $DOCKER_IMAGE:latest

                    docker push $DOCKER_IMAGE:latest
                    '''
                }
            }
        }
        
        stage('Deploy using Docker Compose') {
                steps {

                            sh '''
                                docker compose down

                                docker compose pull

                                docker compose up -d
                                '''
                        }
                }
        
        
    }
}
