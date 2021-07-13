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
    stage('Push Image') {
            steps{
                script {
                    docker.withRegistry( '', registryCredential ) {
                        dockerImage.push("$BUILD_NUMBER")
                        dockerImage.push('latest')
                    }
                }
            }
        }

    stage('Deploy') {
      steps{
        script {
          sh "docker stack rm dashboard01 || true"
          sh "docker stack deploy --prune --compose-file docker-compose.yml dashboard01"
        }
      }
    }
  }
}
