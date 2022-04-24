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
        stage ('docker build') {
            steps {
                sh 'docker build -t devopsxprts/addressbook:latest .'
            }
        }
    }
}
 
