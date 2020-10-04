resource "github_repository_webhook" "jenkins_hook" {
  repository = "intermine_final"

  configuration {
    url          = "http://${aws_instance.myjenkins.public_ip}:8080/github-webhook/"
    content_type = "form"
    insecure_ssl = false
  }


  events = ["push"]
}
