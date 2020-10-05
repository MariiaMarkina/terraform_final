pipeline {
    agent any
    
    stages {
    
        stage('Terraform init and plan') {
            steps {
              withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'AWS_keys', accessKeyVariable: 'TF_VAR_access_key', secretKeyVariable: 'TF_VAR_secret_key']]){
                withCredentials([string(credentialsId: 'GitToken', variable: 'TF_VAR_token')]) {
                    //withCredentials([sshUserPrivateKey(credentialsId: 'ssh_key_for_instance', keyFileVariable: 'VAR_private_key', usernameVariable: 'TF_VAR_ssh_user')]) {
                    withCredentials([sshUserPrivateKey(credentialsId: 'ssh_key_for_instance', keyFileVariable: 'keyfile', usernameVariable: 'TF_VAR_ssh_user')]) {

                      sh 'terraform init'
                      sh 'ls -l'
                      //sh 'terraform destroy --auto-approve'
                      sh '[ -f "./ec2_key.pem" ] &&   echo "file for keys already exists" || touch "./ec2_key.pem"'
                      //sh 'cp "$Var_private_key" ./ec2_key.pem'
                      sh 'terraform plan -out my_plan'
                    }
                } 
              }
            }
        }
        
        stage('Terraform apply') {
            steps {
              script {
                if (params.apply_plan != 'yes') {
                    input message: 'Apply this plan?'
                }
              }
              withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'AWS_keys', accessKeyVariable: 'TF_VAR_access_key', secretKeyVariable: 'TF_VAR_secret_key']]){
                withCredentials([string(credentialsId: 'GitToken', variable: 'TF_VAR_token')]) {
                    withCredentials([sshUserPrivateKey(credentialsId: 'ssh_key_for_instance', keyFileVariable: 'keyfile', usernameVariable: 'TF_VAR_ssh_user')]) {
                      //sh 'cd ./jenkins_terraform_final'
                      
                      sh 'echo $TF_VAR_token > token.txt'
                      sh 'cat $keyfile > ./ec2_key.pem'
                      
                      sh 'terraform apply my_plan'
                      sh 'rm ./ec2_key.pem'
                    }
                } 
              }
            }
        }
        

                
        
        
 // input message: 'Do you want to approve the deploy in production?', ok: 'Yes'
        

        
       
        
        
    }
}
