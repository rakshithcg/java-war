/**pipeline {
    agent none

    stages {
        stage('Stage1:checkout') {
            agent {label 'docker-2'}
            steps {
                git branch: 'main', credentialsId: 'git-credentials', url: 'https://github.com/rakshithcg/java-war.git'            
            }
        }
         stage('Stage2:Build-1') {
            agent {label 'docker-2'}
            steps {
              sh 'docker build -t rakshithcg/java-war:ver$BUILD_NUMBER .'
            }
        }
        stage('Stage3:Push') {
            agent {label 'docker-2'}
            steps {
               sh 'docker push rakshithcg/java-war:ver$BUILD_NUMBER'
            }
        }
         stage('Stage5:Deploy') {
            agent {label 'kubernetes'}
            steps {
               sh 'kubectl set image deploy my-app my-ct=rakshithcg/java-war:ver$BUILD_NUMBER -n my-namespace'
            }
        }
    }
}**/
