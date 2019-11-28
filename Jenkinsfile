node {
    def customImage
    def registry = "rajatrawat88/myrepo"
    stage('Clone repository') {
        /* Checkout git ripo */
        checkout scm
    }

    stage("Linting Dockerfile") {
        /* Lint the Dockerfile with Hadolint */
      echo 'Linting...'
      sh '/home/linuxbrew/.linuxbrew/bin/hadolint Dockerfile'
    }

    stage('Build EKS Cluster'){
        /* Use eksctl to create EKS Kubernetes Cluster */
         withAWS(region:'us-west-2',credentials:'aws-cred'){
            sh "eksctl create cluster --name RJCloud --version 1.14 --region us-west-2 --nodegroup-name standard-workers --node-type t3.medium --nodes 1 --nodes-min 1 --nodes-max 2 --managed"
         }
    }

    stage('Update kubectl config for EKS Cluster'){
        /* Update the config file so that kubectl can access it */
         withAWS(region:'us-west-2',credentials:'aws-cred'){
            sh "/usr/local/bin/aws eks --region us-west-2 update-kubeconfig --name RJCloud"
         }
    }

    stage('Build Docker image') {
        /* Build the Docker image */

        customImage = docker.build("${registry}")
    }

    stage('Test Docker image') {
        /* Test the Docker image */
        customImage.inside {
            echo "Tests passed"
        }
    }

    stage('Push Docker image to Docker-hub') {
        /* Registering with Docker-hub and then push the image to Docker-hub */
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub') {
            //customImage.push("${env.BUILD_NUMBER}")
            customImage.push("latest")
            } 
                echo "Trying to Push Docker Build to DockerHub"
    }

    stage('Deploy Docker image to AWS EKS Kubernetes') {
        /* Deploy the image to AWS EKS */
        withAWS(region:'us-west-2',credentials:'aws-cred'){    
        sh "/usr/local/bin/kubectl apply -f deployment.yml --validate=false"
        sh "/usr/local/bin/kubectl get pods"
        sh "/usr/local/bin/kubectl get deployment"
        }
    }

    
}