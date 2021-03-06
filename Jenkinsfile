pipeline {
  agent any
  stages {
    stage('Setup') {
      steps {
        sh '''echo "Setup"
              ls -lst    
	   '''
      }
    }

    stage('Lint') {
      steps {
        sh '''hadolint Dockerfile
              cat Dockerfile
	   '''
      }
    }

    stage('Build Docker Image') {
      when {
        branch 'master'
      }
      steps {
        sh '''#!/usr/bin/env bash
	# Step 1:
	# Build image and add a descriptive tag
	docker build --tag=amitfinalproject .


	# Step 2: 
	# List docker images
	docker image ls'''
      }
    }

    stage('upload image to Dockerhub') {
      steps {
        script {
          withDockerRegistry([ credentialsId: "dockerhub", url: "" ]){
            sh'''

		dockerpath="amitshr90/amitfinalproject"

		docker login && docker image tag amitfinalproject $dockerpath

		docker image push $dockerpath
		'''

          }
        }

      }
    }

    stage('Deploy to AWS Kubernetes Cluster') {
      when {
        branch 'master'
      }
      steps {
        withAWS(region: 'us-east-2', credentials: 'aws_id') {
          sh '''
                  aws eks --region us-east-2 update-kubeconfig --name finalprojectcluster2
                  kubectl set image deployments/amitfinalproject amitfinalproject=amitshr90/amitfinalproject:latest                  
                  kubectl apply -f deployment.yml
                  kubectl get nodes
                  kubectl get deployment
                  kubectl get pod -o wide
                  kubectl apply -f service.yml
                  kubectl get services
	     '''
        }

      }
    }

  }
}
