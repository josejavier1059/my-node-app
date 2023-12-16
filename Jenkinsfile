pipeline {
    agent none
    options {
        skipStagesAfterUnstable()
    }
    stages {
        stage('Build') {
            agent {
                docker {
                    image 'node:16-alpine'
                }
            }
            steps {
                sh 'npm install'
                stash(name: 'node-modules', includes: 'node_modules/')
            }
        }
        stage('Test') {
            agent {
                docker {
                    image 'node:16-alpine'
                }
            }
            steps {
                unstash(name: 'node-modules')
                sh 'npm test'
            }
            post {
                always {
                    junit 'reports/test-results.xml'
                }
            }
        }
        stage('Deliver') { 
            agent any
            steps {
                dir(path: env.BUILD_ID) { 
                    unstash(name: 'node-modules') 
                    sh "npm run build" 
                }
            }
            post {
                success {
                    archiveArtifacts "${env.BUILD_ID}/dist/*" 
                }
            }
        }
    }
}

