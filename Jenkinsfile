pipeline {
    agent any
    stages {

        stage('Build') {
             steps {
                 sh 'docker version'
                 sh '''
                    echo "Multiline Works"
                    ls -lah
                    '''
            }
        }
    }
}