pipeline {
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
}