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
                sh 'docker run --rm -t test --name test-${BUILD_ID} -d -p 8088:80 test'
                sh 'curl -s localhost:8080 |grep hola2'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
        post {
          always {
              sh 'docker rm test-${BUILD_ID} -f'
          }
       }
    }
}
