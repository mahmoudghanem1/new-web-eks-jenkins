pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "mahmoudghanem/new-web"
    }

    stages {

        stage('Checkout') {
            steps {
                git 'https://github.com/mahmoudghanem1/new-web-eks-jenkins.git'
            }
        }

        stage('Build App') {
            steps {
                sh 'chmod +x gradlew'
                sh './gradlew build'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE:$BUILD_NUMBER .'
            }
        }

        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                    sh '''
                    echo $PASS | docker login -u $USER --password-stdin
                    docker push $DOCKER_IMAGE:$BUILD_NUMBER
                    '''
                }
            }
        }
    }
}