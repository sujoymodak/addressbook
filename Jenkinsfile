pipeline {
    agent any
    stages {
        stage ('compilation') {
            steps {
                sh 'mvn -B compile'
            }
        }
        stage ('test') {
            steps {
                sh 'mvn -B test'
            }
        }
        stage ('package') {
            steps {
                sh 'mvn -B package'
            }
        }
        stage ('build and psh docker image') {
            steps {
                sh 'sudo docker build -t devopsxprts/addressbook .'
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'pass', usernameVariable: 'user')]) {
                    sh 'sudo docker login --username $user --password-stdin $pass'
                    sh 'sudo docker push devopsxprts/addressbook'
                }
            }
        }
//         stage ('build and push docker build to dockerhub') {
//             steps {
//                 withDockerRegistry(credentialsId: 'dockerhub', url: 'https://index.docker.io/v1/') {
//                     script {
//                         def myimage = docker.build 
//                         myimage.push
//                     }
//                 }
//             }
//         }
    }
}
 
