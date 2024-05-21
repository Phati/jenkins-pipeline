pipeline{

    agent any

    environment {
        PASS = credentials('registry-pass') 
    }
    
    stages{
        stage('Build'){
            steps{
                sh 'echo BUILD STAGE'
                sh 'whoami'
                //sh " password- ${PASS}"
                //sh "sudo chown -R jenkins:jenkins ${env.WORKSPACE}"
                sh "chmod +x -R ${env.WORKSPACE}/spring-boot-app/jenkins/build/build.sh"
                sh "chmod +x -R ${env.WORKSPACE}/spring-boot-app/jenkins/build/mvn.sh"
                sh "chmod +x -R ${env.WORKSPACE}/spring-boot-app/jenkins/test/mvn.sh"
                sh "chmod +x -R ${env.WORKSPACE}/spring-boot-app/jenkins/push/push.sh"
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
