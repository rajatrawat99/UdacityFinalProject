node {
    def app

    stage('Clone repository') {
        /* Cloning the Repository to our Workspace */

        checkout scm
    }

    stage("Linting") {
      echo 'Linting...'
      sh 'hadolint Dockerfile'
    }

    
}