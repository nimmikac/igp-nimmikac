pipeline {
    agent any
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

        stage('Build Docker Image') {
            steps {
                sh 'cp /var/lib/jenkins/workspace/$JOB_NAME/target/ABCtechnologies-1.0.war /var/lib/jenkins/workspace/$JOB_NAME/abc.war'
                sh 'docker build -t nimmika/abc_tech:$BUILD_NUMBER .'
           }
        }

        stage('Push Docker Image') {
            steps {
                withDockerRegistry([ credentialsId: "mydockerhub", url: ""]){
                    sh 'docker push nimmika/abc_tech:$BUILD_NUMBER'
                }

            }
        }

        stage('Deploy as container') {
            steps{
                sh 'docker run -itd -P nimmika/abc_tech:$BUILD_NUMBER'
            }
        }
    }
}
