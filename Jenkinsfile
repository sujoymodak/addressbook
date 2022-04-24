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
        stage ('build and push docker build to dockerhub') {
            steps {
                withDockerRegistry(credentialsId: 'dockerhub') {
                    script {
                        def myimage = docker.build 
                        myimage.push
                    }
                }
            }
        }
    }
}
 
