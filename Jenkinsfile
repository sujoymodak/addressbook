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
        stage ('build and push docker image') {
            steps {
                sh 'sudo docker build -t devopsxprts/addressbook:$BUILD_NUMBER .'
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'pass', usernameVariable: 'user')]) {
                    sh "sudo docker login -u ${env.user} -p ${env.pass}"
                    sh 'sudo docker push devopsxprts/addressbook:$BUILD_NUMBER'
                }
            }
        }
        stage ('kubernetes deployment') {
            steps {
//                 sh 'kubectl apply -f deployment.yaml'
                sh 'kubectl set image deployment addressbook addressbook=devopsxprts/addressbook:$BUILD_NUMBER'
                
            }
        }

    }
}
