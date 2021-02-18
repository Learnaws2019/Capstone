pipeline {
  agent any
  stages {
    stage('Test') {
      steps {
        echo 'My First Pipeline'
      }
    }

    stage('') {
      steps {
        bat(script: '@echo off  SET a = Hello  SET b = World  SET c=%a% and %b%  echo %c%', returnStatus: true, returnStdout: true)
        echo 'Testing Batch File'
        bat(script: '@echo off  set list=1 2 3 4  (for %%a in (%list%) do (     echo %%a  ))', returnStatus: true, returnStdout: true)
      }
    }

  }
}