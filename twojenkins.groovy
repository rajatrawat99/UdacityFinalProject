pipeline {
    stages {
        stage('stage 1') {
            steps {
                script{
                    sh "echo PROECT 2"
                }
            }
        }
        stage('stage 2') {
            steps {
                script{
                    sh "echo PROECT 2"
                }
            }
        }
    }
}