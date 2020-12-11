pipeline {
    agent any
    stages {
        stage ('Build BackEnd'){
            steps{
                bat 'mvn clean package -DskipTests=true'
            }
        }
        stage ('Deploy BackEnd'){
            steps{
                deploy adapters: [tomcat9(credentialsId: 'tomcatLocal', path: '', url: 'http://localhost:8080/')], contextPath: 'tasks-backend', war: 'target/tasks-backend.war'
            }
        }
        stage ('Deploy FrontEnd'){
            steps{
                dir('frontend'){
                    git credentialsId: 'github_login', url: 'https://github.com/rafadonatelo/tasks-frontend.git'
                    bat 'mvn clean package'
                    deploy adapters: [tomcat9(credentialsId: 'tomcatLocal', path: '', url: 'http://localhost:8080/')], contextPath: 'tasks', war: 'target/tasks.war'
                }
            }
        }
    }
}