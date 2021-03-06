terraform {
  required_version = ">= 1.1"

  backend "gcs" {
    credentials = "./terraform.json"
    bucket = "tf-ga-state"
    prefix = "terraform-github-org"
  }

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
}

# Configure the GitHub Provider
provider "github" {
    token = var.token
    owner = "fernandezfalvaro"
}