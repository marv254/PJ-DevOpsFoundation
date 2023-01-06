pipeline {
agent any

stages{
    stage("Build our website"){
        steps{
            script{
                sh "$PWD/scripts/build.sh"
            }
        }

    }

    stage ("Run unit tests"){
        steps{
            script{
                sh "$PWD/scripts/unit_tests.sh"
            }
        }

    }

    stage("Deploy website"){
        steps{
            script{
                sh "$PWD/scripts/deploy_website.sh"
            }
        }

    }
}
}