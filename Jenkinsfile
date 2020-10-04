pipeline {
    agent any
    
    stages {
    
        stage('Terraform init') {
            steps {
              withCredentials([string(credentialsId: 'Git_token', variable: 'TF_VAR_token'), 
              AmazonWebServicesCredentialsBinding(credentialsId: 'AWS_keys', accessKeyVariable: 'TF_VAR_access_key', secretKeyVariable: 'TF_VAR_secret_key')
              ]) {
                sh 'echo Hello'
                sh 'sudo terraform init'
                
              }
            }
        }
        
        

              //withCredentials([sshUserPrivateKey(credentialsId: 'SSH_ubuntu', keyFileVariable: 'keyfile', usernameVariable: 'userName')]) {
                
        
        
   
        

        
       
        
        
    }
}
