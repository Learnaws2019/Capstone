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
        withAWS(region: 'us-east-2', credentials: 'awsid') {
          s3Upload(file: 'generate.html', bucket: 'nouran.portfolio', path: 'generate.html')
		    }
	    }
    }
  }
}