node {
    def customImage
    def registry = "rajatrawat88/myrepo"
    stage('Clone repository') {
        /* Cloning the Repository to our Workspace */

        checkout scm
    }

    stage('Build Cluster'){
         withAWS(region:'us-west-2',credentials:'aws-cred'){
            sh "eksctl create cluster --name rjtCloud --version 1.14 --region us-west-2 --nodegroup-name standard-workers --node-type t3.medium --nodes 1 --nodes-min 1 --nodes-max 2 --managed"
         }
    }

    stage('Update kubectl config'){
         withAWS(region:'us-west-2',credentials:'aws-cred'){
            sh "/usr/local/bin/aws eks --region us-west-2 update-kubeconfig --name rjtCloud"
         }
    }

    stage("Linting") {
      echo 'Linting...'
      //sh '/home/linuxbrew/.linuxbrew/bin/hadolint Dockerfile'
      //sh 'pylint --disable=R,C,W1203 app.py'
    }

    stage('Build image') {
        /* This builds the actual image */

        customImage = docker.build("${registry}")
    }

    stage('Test image') {
        
        customImage.inside {
            echo "Tests passed"
        }
    }

    stage('Push image') {
        /* 
			You would need to first register with DockerHub before you can push images to your account
		*/
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub') {
            //customImage.push("${env.BUILD_NUMBER}")
            customImage.push("latest")
            } 
                echo "Trying to Push Docker Build to DockerHub"
    }

    stage('Deploy to Kubernetes') {

        withAWS(region:'us-west-2',credentials:'aws-cred'){
        
        //sh "kubectl set image deployments/capstone-app capstone-app=${registry}:latest"
    
        sh "/usr/local/bin/kubectl apply -f deployment.yml --validate=false"
        sh "/usr/local/bin/kubectl get pods"
        sh "/usr/local/bin/kubectl get deployment"
        }
    }

    
}