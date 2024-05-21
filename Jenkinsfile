pipeline{

    agent any

    environment {
        PASS = credentials('registry-pass') 
    }
    
    stages{
        stage('Build'){
            steps{
                sh 'echo BUILD STAGE'
                def pom = readMavenPom file: 'pom.xml'
                env.RELEASE_VERSION = pom.version
                sh "echo VERSION IS ${RELEASE_VERSION}"
                sh 'whoami'
                //sh " password- ${PASS}"
                //sh "sudo chown -R jenkins:jenkins ${env.WORKSPACE}"
                sh "chmod +x -R ${env.WORKSPACE}/jenkins/build/build.sh"
                sh "chmod +x -R ${env.WORKSPACE}/jenkins/build/mvn.sh"
                sh "chmod +x -R ${env.WORKSPACE}/jenkins/test/mvn.sh"
                sh "chmod +x -R ${env.WORKSPACE}/jenkins/push/push.sh"
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
