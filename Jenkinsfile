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
                sh 'docker run -d --rm --name test-${EXECUTOR_NUMBER} -p 8088:80 test'
                sh 'curl -s localhost:8088'
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
        sh 'docker rm test-${EXECUTOR_NUMBER} -f'
     }
   }

}
