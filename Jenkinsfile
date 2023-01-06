pipeline {
agent any

stages{
    stage("Build our website"){
        steps{
            script{
                sh "scripts/build.sh"
            }
        }

    }

    stage ("Run unit tests"){
        steps{
            script{
                sh "scripts/unit_tests.sh"
            }
        }

    }

    stage("Deploy website"){
        steps{
            script{
                sh "scripts/deploy_website.sh"
            }
        }

    }
}
}