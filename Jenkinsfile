pipeline {
    agent any
    triggers {
        githubPush()
    }
    options {
        timestamps()
    }
    stages {
        stage('Github Repository Clone & Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/hyelimhong/dockerfile-example.git'
            }
        }
        stage('Docker Build') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'docker-hub') {
                        docker.build('honghyelim/ubuntu_apache2', './ubuntu_apache2') 
                    }
                } 
            }
        }
        stage('Docker Build2') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'docker-hub') {
                        docker.build('honghyelim/ubuntu_nginx_loadbalancer', './ubuntu_nginx_loadbalancer') 
                    }
                }
            }
        }
        stage('Docker Build3') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'docker-hub') {
                        docker.build('honghyelim/ubuntu_nginx', './ubuntu_nginx') 
                    }
                }
            }
        }
        stage('Docker Image Push') {
            steps{
                script{
                     docker.withRegistry('https://index.docker.io/v1/', 'docker-hub') {
                        def img = docker.image('honghyelim/ubuntu_nginx') 
                        img.push('latest')
                        img.push('0.1')
                     }
                }
            }
        }
        stage('Docker Image Push2') {
            steps{
                script{
                     docker.withRegistry('https://index.docker.io/v1/', 'docker-hub') {
                        def img = docker.image('honghyelim/ubuntu_apache2') 
                        img.push('latest')
                        img.push('0.1')
                     }
                }
            }
        }
        stage('Docker Image Push3') {
            steps{
                script{
                     docker.withRegistry('https://index.docker.io/v1/', 'docker-hub') {
                        def img = docker.image('honghyelim/ubuntu_nginx_loadbalancer') 
                        img.push('latest')
                        img.push('0.1')
                     }
                }
            }
        }
    }
    post{
        cleanup {
        emailext subject: '$DEFAULT_SUBJECT',
                 to: 'hyelim8112@gmail.com', //받는사람
                 body: '$DEFAULT_CONTENT'
    }
  }
}