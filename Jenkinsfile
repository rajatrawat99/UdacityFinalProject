pipeline {
    agent any
    stages {

        stage('Build') {
             steps {
                 sh 'echo "Hello world"'
                 sh '''
                    echo "Multiline Works"
                    ls -lah
            }
        }
    }
}