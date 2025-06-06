## Install Maven Intergration Plugin: 
- managed jenkins -> plugins-> available plugins

## Configure Maven
-  managed jenkins ->tools-> maven

## create cicd pipeline
````
pipeline {
    agent any
    
    tools {
        maven 'maven'
    }
    
    stages{
        stage('code-pull'){
            steps{
                git branch: 'main', url: 'https://github.com/abhipraydhoble/Student-App-Code.git'
            }
        }
        
        stage('code-build'){
            steps{
                sh 'mvn clean package'
            }
        }
    }
}
````
