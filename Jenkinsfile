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

         stage('Unit Tests'){
             steps{
                sh '''
                echo UNIT TESTING STAGE
                echo SKIP_TESTS = ${SKIP_TESTS}
                if !$SKIP_TESTS; then
                chmod +x -R ${WORKSPACE}/jenkins/test/mvn.sh
                sh ./jenkins/test/mvn.sh mvn test
                fi
                '''
            }
        }
        
        stage('Build'){
            steps{
                sh '''
                echo BUILD STAGE
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
