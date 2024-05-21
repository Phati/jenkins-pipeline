pipeline{

    agent any

    //environment {
    //    PASS = credentials('registry-pass') 
   // }
    
    stages{
        stage('Build'){
            steps{
                sh 'echo BUILD STAGE'
                sh 'whoami'
                //sh " password- ${PASS}"
                sh "echo ubuntu | -S sudo chown -R jenkins:jenkins ${env.WORKSPACE}"
                sh "exho ubuntu | -S sudo chmod +x -R ${env.WORKSPACE}"
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
