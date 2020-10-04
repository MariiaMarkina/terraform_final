pipeline {
    agent any
    
    stages {
    
        stage('Terraform init') {
            steps {
              withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'AWS_keys', ACCESS_KEY: 'TF_VAR_access_key', SECRET_KEY: 'TF_VAR_secret_key']]){
                withCredentials([string(credentialsId: 'Git_token', variable: 'TF_VAR_token')]) {
                  sh 'echo Hello'
                  sh 'sudo terraform init'
                } 
              }
            }
        }
        

              //withCredentials([sshUserPrivateKey(credentialsId: 'SSH_ubuntu', keyFileVariable: 'keyfile', usernameVariable: 'userName')]) {
                
        
        
   
        

        
       
        
        
    }
}
