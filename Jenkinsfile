pipeline{

    agent any

    stages{
        stage('Build'){
            steps{
                sh 'echo BUILD STAGE'
                sh './jenkins/build/mvn.sh mvn clean compile install -DskipTests'
                sh './jenkins/build/build.sh'
            }
        }

        stage('Test'){
             steps{
                sh 'echo TEST STAGE'
                sh './jenkins/test/mvn.sh mvn test'
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