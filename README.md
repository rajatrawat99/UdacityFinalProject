## Project Overview

In this project, I have deployed a simple flask application to the AWS EKS.  for this project I have used instructions of Alvaro Andres from following two links:
1. https://medium.com/@andresaaap/capstone-cloud-devops-nanodegree-4493ab439d48
2. https://medium.com/@andresaaap/jenkins-pipeline-for-blue-green-deployment-using-aws-eks-kubernetes-docker-7e5d6a401021

I have not used ansible or cloudformation for building the environment as I said I followed the the above links from Alvaro Andres which takes you to this aws link: https://docs.aws.amazon.com/eks/latest/userguide/getting-started-eksctl.html. 

This makes building EKS cluster really easy as in this you only have to run one command and declare all the variable in it and also it is very easy to update it.
in my project I have kept this command in a shell script in which you send the name of the environment as command line argument. like this "./aws.sh RAJATCloud"
I have chosen the the rolling deployment here as it is easy to implement here. I have chosen 3 replicas for my rolling deployment which means in any case of update there will always be 3 pods serving my app. Old pods will only get terminated when there is newly 3 created pods to serve the application. In short there will never be downtime for my application which is ultimate aim of the Rolling update.

Below image can demostrate working of the rolling update better:

![Image of Pods](https://github.com/rajatrawat99/UdacityFinalProject/blob/master/pods.PNG)

First stage shows when the update has not started, you can see there are 3 pods serving. After 1st stage rolling update has started. Then till the last stage you can see pods are getting created and terminated but the total number of pods always remains 3 which results no downtime which is ultimate goal of rolling deployment. When the update is done you can see new pods have been created and there is no downtime.

Jenkinsfile Pipeline Stages
1. Clone repository: Checkout git ripo
2. Linting Dockerfile: Lint the Dockerfile with Hadolint
3. Build Docker image: Builds the Docker image
4. Test Docker image: Test the Docker image
5. Push Docker image to Docker-hub: Registering with Docker-hub and then push the image to Docker-hub
6. Update kubectl config: Update the config file so that kubectl can access it
7. Deploy Docker image to EKS: Deploy the image to AWS EKS Cluster
8. Clean Docker Images: Cleaning Dangling docker images

Below image shows the failing of the pipeline at linting stage due to error at Dockerfile
![Image of Pods](https://github.com/rajatrawat99/UdacityFinalProject/blob/master/fail1.PNG)



Below image shows all the stages has passed successfully
![Image of Pods](https://github.com/rajatrawat99/UdacityFinalProject/blob/master/pass1.PNG)
