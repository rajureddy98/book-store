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
                    mvn clean install package
                '''
            }
        }
        if(Docker build and push required){
            stage('docker build'){
                steps{
                    sh '''
                        cd ${msname}
                        pwd
                        ls -latr
                        docker build -t $msname:1.0 .
                    '''
                }    
            }
            stage('docker login and push'){
                steps{
                    sh '''
                        docker login -u=rajureddy98 -p=rajureddy98
                        docker tag $msname:1.0 rajureddy98/$msname:1.0
                        docker push rajureddy98/$msname:1.0
                    '''
                }
            }
        }
        else{
            echo "docker build and push skipped"
        }
    }
}
