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
    }
}
