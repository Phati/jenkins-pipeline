pipeline{
    
    agent any

    environment {
        PASS = credentials('registry-pass') 
    }
    
    stages{

        stage('Read .env file') {
            steps {
                script {
                    def envFilePath = "${WORKSPACE}/.env"
                    if (fileExists(envFilePath)) {
                        def envContent = readFile(envFilePath).trim()
                        envContent.readLines().each { line ->
                            def (key, value) = line.split('=')
                            env."${key}" = value
                        }
                    } else {
                        echo "No .env file found"
                    }
                }
            }
        }
        
        // stage('Read POM Version') {
        //     steps {
        //        script {
        //            def pom = readMavenPom file: 'pom.xml'
        //            env.RELEASE_VERSION = pom.version  
        //        }
        //     }
        // }
        
        stage('Build'){
            steps{
                sh '''
                echo BUILD STAGE
                echo RELEASE_VERSION = ${RELEASE_VERSION}
                chmod +x -R ${WORKSPACE}/jenkins/build/mvn.sh
                ./jenkins/build/mvn.sh mvn clean compile install -DskipTests
                '''
            }
        }

         stage('Test'){
             steps{
                sh '''
                echo TEST STAGE
                chmod +x -R ${WORKSPACE}/jenkins/test/mvn.sh
                sh ./jenkins/test/mvn.sh mvn test
                '''
            }
        }

        stage('Containerize'){
            steps{
                sh '''
                echo CONTAINERIZE STAGE
                chmod +x -R ${WORKSPACE}/jenkins/build/build.sh
                ./jenkins/build/build.sh
                '''
            }
        }

        stage('Push'){
             steps{
                sh '''
                echo PUSH STAGE
                chmod +x -R ${WORKSPACE}/jenkins/push/push.sh
                ./jenkins/push/push.sh
                '''
            }
        }

        stage('Deploy'){
             steps{
                sh 'echo Deploy'
            }
        }
    }
}
