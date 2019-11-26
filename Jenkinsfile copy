pipeline {
    agent any
    stages {

        stage('Build') {
             steps {
                 sh 'skaffold'
                 sh '''
                    echo "Multiline Works"
                    ls -lah
                    '''
            }
        }
    }
}