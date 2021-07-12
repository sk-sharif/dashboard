pipeline {
  environment {
    registry = "sagark24/dashboard"
    registryCredential = 'dockerhub'
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
          git branch: 'main', credentialsId: 'GITHUB_TOKEN', url: 'https://github.com/sagarshrestha24/dashboard.git'
          sh 'git checkout -b feature'
      }
    }
     stage('Build Unit test') {
      steps{
        echo 'unit test'
      }
    }
  }
}
