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
           aws ec2 describe-tags
            '''
        }

      }
    }

  }
}