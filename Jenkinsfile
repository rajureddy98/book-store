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
        stage('docker build & push'){
            steps{
                script{
                    if(Docker_build_and_push_required){
                        stage('executing docker build & push){
                              sh '''
                                cd ${msname}
                                pwd
                                ls -latr
                                docker build -t $msname:1.0 .
                                docker login -u=rajureddy98 -p=rajureddy98
                                docker tag $msname:1.0 rajureddy98/$msname:1.0
                                docker push rajureddy98/$msname:1.0
                            '''
                        }
                    }
                }
            }    
        }
    }
}
