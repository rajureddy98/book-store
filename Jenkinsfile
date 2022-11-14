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
               git 'https://github.com/rajureddy98/web-app.git' 
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
        stage('deploy with ansible'){
            steps {
                ansiblePlaybook(
                    credentialsId: 'ansible_user',
                    inventory: '/etc/ansible/hosts', 
                    playbook: '/opt/ansscripts/copy.yaml',
                    extraVars   : [
                      msname: env.msname,
            ])
            }
        }
    }
}
