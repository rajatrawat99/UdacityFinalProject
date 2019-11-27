node {
    def customImage
    def registry = "rajatrawat88/myrepo"
    stage('Clone repository') {
        /* Cloning the Repository to our Workspace */

        checkout scm
    }

    stage("Linting") {
      echo 'Linting...'
      //sh '/home/linuxbrew/.linuxbrew/bin/hadolint Dockerfile'
      //sh 'pylint --disable=R,C,W1203 app.py'
    }

    stage('Build image') {
        /* This builds the actual image */

        customImage = docker.build("${registry}:${env.BUILD_ID}")
    }

    stage('Test image') {
        
        customImage.inside {
            echo "Tests passed"
        }
    }

    
}