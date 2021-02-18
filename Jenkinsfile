pipeline {
  agent {
    node {
      label 'Windows'
    }

  }
  stages {
    stage('Test') {
      steps {
        echo 'My First Pipeline'
      }
    }

    stage('error') {
      steps {
        bat(script: '@echo off  SET a = Hello  SET b = World  SET c=%a% and %b%  echo %c%', returnStatus: true, returnStdout: true)
        echo 'Testing Batch File'
        bat(script: '@echo off  set list=1 2 3 4  (for %%a in (%list%) do (     echo %%a  ))', returnStatus: true, returnStdout: true)
      }
    }

  }
}