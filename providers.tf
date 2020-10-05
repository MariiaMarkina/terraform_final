provider "aws" {
region = var.region
access_key = var.access_key
secret_key = var.secret_key
}

provider "github" {
token = "${var.token}"
owner = "mariiamarkina"
}
