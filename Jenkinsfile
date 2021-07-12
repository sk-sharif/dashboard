pipeline {
  environment {
    registry = "akanshagiriya/dashboard"
    registryCredential = 'Docker_cred'
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
          git branch: 'feature', url: 'https://github.com/sk-sharif/dashboard.git'
//          sh 'git checkout -b feature'
      }
    }
     stage('Build Unit test') {
      steps{
        echo 'unit tests01'
      }
    }
  }
}
