pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'docker build -t test .'
            }
        }
        stage('Test') {
            steps {
                sh 'docker run -d --rm --name test-${BUILD_ID} -p ${env.TEST_PORT}:80 test'
                sh 'curl -s localhost:${env.TEST_PORT} |grep hola'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
    post {
      always {
        sh 'docker rm test-${BUILD_ID} -f'
     }
   }

}
