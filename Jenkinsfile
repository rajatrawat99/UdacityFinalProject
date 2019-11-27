node {
    def app

    stage('Clone repository') {
        /* Cloning the Repository to our Workspace */

        checkout scm
    }

    stage("Linting") {
      echo 'Linting...'
      sh '/home/linuxbrew/.linuxbrew/bin/hadolint Dockerfile'
      //sh 'pylint --disable=R,C,W1203 app.py'
    }

    
}