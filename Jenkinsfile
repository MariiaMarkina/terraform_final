pipeline {
    agent any
    
    stages {
    
        stage('Terraform init') {
            steps {
              withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'AWS_keys', accessKeyVariable: 'TF_VAR_access_key', secretKeyVariable: 'TF_VAR_secret_key']]){
                withCredentials([string(credentialsId: 'GitToken', variable: 'TF_VAR_token')]) {
                  sh '[ -d "./jenkins_terraform_final" ] &&   sudo rm -r ./jenkins_terraform_final || echo "directory does not exist yet" '
                  sh 'git clone https://github.com/MariiaMarkina/terraform_final ./jenkins_terraform_final'
                  sh 'cd ./jenkins/terraform/final'
                  sh 'terraform init'
                } 
              }
            }
        }
        

              //withCredentials([sshUserPrivateKey(credentialsId: 'SSH_ubuntu', keyFileVariable: 'keyfile', usernameVariable: 'userName')]) {
                
        
        
   
        

        
       
        
        
    }
}
