pipeline{
    agent any
    
    stages{
        stage("Code Clone"){
            steps{
                echo "Code Clone Stage"
                git url: "https://github.com/devops-vaibhav7/A-Task", branch: "main"
            }
        }
        stage("Code Build"){
            steps{
                echo "Code Build Stage"
                sh "whoami"
                sh "docker build -t demo-app:latest ."
            }
        }
        stage("Push To DockerHub"){
            steps{
                withCredentials([usernamePassword(
                    credentialsId:"DockerCred",
                    usernameVariable:"DockerUser", 
                    passwordVariable:"DockerPass")]){
                sh 'echo $DockerPass | docker login -u $DockerUser --password-stdin'
                sh "docker image tag demo-app:latest ${env.DockerUser}/demo-app:latest"
                sh "docker push ${env.DockerUser}/demo-app:latest"
                }
            }
        }
        stage("Deploy"){
            steps{
                sh "docker-compose down && docker-compose up -d"
            }
        }
    }
}