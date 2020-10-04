pipeline {
    agent any
    
    stages {
    
        stage('Terraform init and plan') {
            steps {
              withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'AWS_keys', accessKeyVariable: 'TF_VAR_access_key', secretKeyVariable: 'TF_VAR_secret_key']]){
                withCredentials([string(credentialsId: 'GitToken', variable: 'TF_VAR_token')]) {
                    withCredentials([sshUserPrivateKey(credentialsId: 'ssh_key_for_instance', keyFileVariable: 'TF_VAR_private_key', usernameVariable: 'TF_VAR_ssh_user')]) {
                      sh 'cp '
                      //sh '[ -d "./jenkins_terraform_final" ] &&  rm -r ./jenkins_terraform_final || echo "directory does not exist yet" '
                      //sh 'git clone https://github.com/MariiaMarkina/terraform_final ./jenkins_terraform_final'
                      //sh 'cd ./jenkins_terraform_final'
                      sh 'terraform init'
                      sh 'ls -l'
                      sh 'terraform plan -out my_plan'
                    }
                } 
              }
            }
        }
        
        stage('Terraform apply') {
            steps {
              withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'AWS_keys', accessKeyVariable: 'TF_VAR_access_key', secretKeyVariable: 'TF_VAR_secret_key']]){
                withCredentials([string(credentialsId: 'GitToken', variable: 'TF_VAR_token')]) {
                    withCredentials([sshUserPrivateKey(credentialsId: 'ssh_key_for_instance', keyFileVariable: 'TF_VAR_private_key', usernameVariable: 'TF_VAR_ssh_user')]) {
                      //sh 'cd ./jenkins_terraform_final'
                      sh 'terraform apply my_plan'
                       // -auto-approve
                    }
                } 
              }
            }
        }
        

                
        
        
   
        

        
       
        
        
    }
}
