pipeline {
    agent any
    
    environment {
        msname = "${params.microservice}"
    }
    stages {
        stage('clean WS') {
            steps {
                cleanWs()
            }
        }
        stage('scm checkout') {
            steps {
               git 'https://github.com/rajureddy98/book-store.git' 
            }
        }
        stage('build-ms'){
            steps {
                sh '''
                    cd ${msname}
                    mvn clean package
                '''
            }
        }
        stage('docker build'){
            sh 'docker build -t $msname:1.0 .'
        }
        stage('docker login and push'){
            sh 'docker login -u=rajureddy98 -p=rajureddy98'
            sh 'docker tag login:1.0 rajureddy98/login:2.1'
            sh 'docker push rajureddy98/login:2.1'
        }
    }
}
