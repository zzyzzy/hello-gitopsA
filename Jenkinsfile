pipeline {
    agent { label 'agent2' }

    environment {
        DOCKER_REGISTRY = 'https://registry.hub.docker.com'
        DOCKER_IMAGE_NAME = 'siestageek/nginx'
        DOCKER_IMAGE_TAG = 'latest'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/zzyzzy/hello-gitopsA.git'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker compose build'
            }
        }

        // sh "docker tag ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} ${DOCKER_REGISTRY}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}"
        // sh "docker push ${DOCKER_REGISTRY}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}"
        stage('Docker Push') {
            steps {
                withDockerRegistry([credentialsId: 'docker-hub-credentials', url: ""]) {                    
                    sh "docker push ${DOCKER_IMAGE_NAME}"
                }
            }
        }

        stage('docker-compose convert helm') {
            steps {
                sh 'kompose convert -c'
                sh 'ls'
            }
        }
        
        /*stage('Push to Git Repo') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'github-credentials', usernameVariable: 'GIT_USERNAME', passwordVariable: 'GIT_PASSWORD')]) {
                    sh """
                        git config --global user.email "zzyzigy@gmail.com"
                        git config --global user.name "zzyzzy"
                        git add nginx-deployment.yaml
                        git commit -m "Update ArgoCD Deployment"
                        git push https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/hello-gitopsB.git HEAD:main
                    """
                }
            }
        }*/
        
    } // statges
} // pipeline
