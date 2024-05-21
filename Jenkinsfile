@Library('java_shared_library') _
pipeline{
    
    agent any

    environment {
        DOCKER_HUB_PASSWORD = credentials('registry-pass') 
    }
    
    stages{

        stage('Pipeline Setup') {
            steps {
                sh "echo ****************PIPELINE SETUP STAGE****************"
                loadEnv()
            }
        }

         stage('Unit Tests'){
             steps{
                 sh "echo ****************UNIT TESTING STAGE****************"
                 runJavaUnitTests()
            }
        }
        
        stage('Build'){
            steps{
                sh '''
                echo ****************BUILD STAGE****************
                echo RELEASE_VERSION = ${RELEASE_VERSION}
                echo COMPILE_AGRS = ${COMPILE_ARGS}
                chmod +x -R ${WORKSPACE}/jenkins/build/mvn.sh
                ./jenkins/build/mvn.sh mvn ${COMPILE_ARGS}
                '''
            }
        }

        stage('Containerize'){
            steps{
                sh '''
                echo ****************CONTAINERIZE STAGE****************
                chmod +x -R ${WORKSPACE}/jenkins/build/build.sh
                ./jenkins/build/build.sh
                '''
            }
        }

        stage('Push'){
             steps{
                sh '''
                echo ****************PUSH STAGE****************
                chmod +x -R ${WORKSPACE}/jenkins/push/push.sh
                ./jenkins/push/push.sh
                '''
            }
        }

        stage('Deploy'){
             steps{
                sh 'echo ****************DEPLOY STAGE****************'
            }
        }
    }
}
