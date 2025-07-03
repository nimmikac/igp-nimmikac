pipeline {
    agent any

    environment {
        IMAGE_NAME = "nimmika/abc_tech"
        TAG = "${BUILD_NUMBER}"
        WAR_NAME = "abc.war"
        DOCKERFILE_SRC = "${WORKSPACE}/Dockerfile"
        WAR_SRC = "${WORKSPACE}/target/ABCtechnologies-1.0.war"
        ANSIBLE_DIR = "${env.HOME}/ansible-docker-deploy"
        ANSIBLE_BUILD_DIR = "/ansible-docker-deploy/build"
    }

    stages {
        stage('Code Compile') {
            steps {
                sh 'mvn compile'
            }
        }

        stage('Unit Test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Code Packaging') {
            steps {
                sh 'mvn package'
            }
        }

        stage('Prepare Docker Build Files for Ansible') {
            steps {
                sh """
                    mkdir -p $ANSIBLE_BUILD_DIR
                    cp $WAR_SRC $ANSIBLE_BUILD_DIR/$WAR_NAME
                    cp $DOCKERFILE_SRC $ANSIBLE_BUILD_DIR/Dockerfile
                """
            }
        }

        stage('Build Docker Image (optional)') {
            steps {
                echo "Skipping local Docker build — Ansible will handle it"
            }
        }

        stage('Push Docker Image (optional)') {
            steps {
                echo "Skipping local Docker push — image is built on remote Docker host"
            }
        }

        stage('Ansible Deploy to Docker Host') {
            steps {
                sh """
                    ansible-playbook -i $ANSIBLE_DIR/inventory $ANSIBLE_DIR/docker_deploy.yml \
                    -e "image_name=$IMAGE_NAME tag=$TAG container_name=abc_container_$TAG port=8082"
                """
            }
        }
    }
}
