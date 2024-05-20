pipeline{

    agent any

    stages{
        stage('Build'){
            steps{
                sh 'echo BUILD STAGE'
                ./jenkins/build/mvn.sh mvn clean compile install -DskipTests
                ./jenkins/build/build.sh

        }

        stage('Test'){
             steps{
                sh 'echo TEST STAGE'
                ./jenkins/test/mvn.sh mvn test
            }
        }


        stage('Push'){
             steps{
                sh 'echo PUSH STAGE'
                sh './jenkins/push/push.sh'
            }
        }

        stage('Deploy'){
             steps{
                sh 'echo Deploy'
            }
        }
    }
}