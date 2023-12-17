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
                stash(name: 'source-code', includes: 'src/,package.json,package-lock.json')
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
                unstash(name: 'source-code')
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
                unstash(name: 'node-modules')
                unstash(name: 'source-code')
                sh "npm run build" 
            }
            post {
                success {
                    archiveArtifacts "dist/*" 
                }
            }
        }
    }
}


