pipeline {
  agent any
  stages {
    stage('Setup') {
      steps {
        sh '''echo "Multiline shell steps works too"
ls -lah     '''
      }
    }

    stage('Lint') {
      steps {
        sh '''hadolint Dockerfile
cat Dockerfile'''
      }
    }

    stage('Build Docker Image') {
      when {
        branch 'master'
      }
      steps {
        sh ' ./run_docker.sh'
      }
    }

    stage('upload image to Dockerhub') {
      steps {
        script {
          withDockerRegistry([ credentialsId: "dockerhub", url: "" ]){
            sh "./upload_docker.sh"
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
                  aws eks --region us-east-2 update-kubeconfig --name finalprojectcluster
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