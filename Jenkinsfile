pipeline {
  environment {
    registry = "akanshagiriya/dashboard01"
    registryCredential = 'Docker_cred'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
          git branch: 'main', url: 'https://github.com/sk-sharif/dashboard.git'
          sh 'git checkout -b main || true'
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
          sh "docker run -d --name admindashboard01 -p 8084:8083 akanshagiriya/dashboard01"
        }
      }
    }
  }
}
