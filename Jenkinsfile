pipeline {
    agent any
    
    environment {
        msname = "${params.microservice}"
        msversion="${params.version}"
        NEXUS_VERSION = "nexus3"
        NEXUS_PROTOCOL = "http"
        NEXUS_URL = "34.16.207.200:8081"
        NEXUS_REPOSITORY = "book-store"
        NEXUS_CREDENTIAL_ID = "nexus"
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
                sh 'echo ${msname} ,${msversion}'
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
        stage("Publish to Nexus Repository Manager") {
            steps {
                script {
                    pom = readMavenPom file: "pom.xml";
                    echo "*** File: ${artifactPath}, group: ${pom.groupId}, packaging: ${pom.packaging}, version ${pom.version}";
                    nexusArtifactUploader(
                        nexusVersion: NEXUS_VERSION,
                        protocol: NEXUS_PROTOCOL,
                        nexusUrl: NEXUS_URL,
                        groupId: pom.groupId,
                        version: pom.version,
                        repository: NEXUS_REPOSITORY,
                        credentialsId: NEXUS_CREDENTIAL_ID,
                        artifacts: [
                            [artifactId: pom.artifactId,
                            classifier: '',
                            file: artifactPath,
                            type: pom.packaging],
                            [artifactId: pom.artifactId,
                            classifier: '',
                            file: "pom.xml",
                            type: "pom"]
                            ]
                        );
                    }
                }
            }
        stage('docker build & push'){
            steps{
                script{
                    if(Docker_build_and_push_required.toBoolean()){
                        stage('executing docker build & push'){
                              sh '''
                                cd ${msname}
                                pwd
                                ls -latr
                                docker build -t $msname:2.0 .
                                docker login -u=rajureddy98 -p=rajureddy98
                                docker tag $msname:2.0 rajureddy98/$msname:2.0
                                docker push rajureddy98/$msname:2.0
                            '''
                        }
                    }
                    else{
                        echo "skipped docker build & push"
                    }
                }
            }    
        }
        stage('deploy in ec2'){
            steps{
                script{
                    if(Deploy_ec2.toBoolean()){
                        build job: 'book-store-deploy-ec2', parameters: [
                            string(name: 'microservice', value: "${msname}")
                        ]
                    }
                    else{
                        echo "deployment in EC2 skipped"
                    }
                }
            }
        }
        stage('deploy in k8s'){
            steps{
                script{
                    if(Deploy_k8s.toBoolean()){
                        build job: 'book-store-deploy-k8s', parameters: [
                            string(name: 'microservice', value: "${msname}"),
                            string(name: 'version', value: "${msversion}")
                        ]
                    }
                    else{
                        echo "deployment in k8s skipped"
                    }
                }
            }
        }
    }
}
