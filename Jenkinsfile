pipeline {
<<<<<<< HEAD
     agent any
     stages {
         stage('Setup') {
             steps {
                 sh '''
                     make install
                 '''
             }
         }
         stage('Lint HTML') {
              steps {
                  sh 'make lint'
                  sh 'tidy -q -e index.html'
              }
         }
         stage('Build Docker Image') {
             when {
                branch 'master'
            }
              steps { 
                  sh "./run_docker.sh"
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
				  sh'''
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
=======
  agent any
  stages {
    stage('Test') {
      steps {
        echo 'My First Pipeline'
      }
    }

    stage('Create Kube Config File') {
      steps {
        withAWS(region: 'us-east-2', credentials: 'aws_id') {
          sh '''
       aws eks --region us-east-2 update-kubeconfig --name test1
       aws s3 ls'''
        }

      }
    }

  }
>>>>>>> d6d78e19ee45f355cbb933a94d7fb4c23a4659db
}