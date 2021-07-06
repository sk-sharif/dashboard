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
      }
    }
     stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
    stage('Deploy') {
      steps{
        script {
          sh "docker run -d --name dashboard -p 8083:8083 sagark24/dashboard"
        }
      }
    }
  }
}
