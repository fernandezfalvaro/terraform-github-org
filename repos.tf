resource "github_repository" "terraform_github" {
  name        = "terraform-github-org"
  description = "Managing Github Organization with TF"

  visibility = "public"
  auto_init = true

}

resource "github_repository_file" "terraform_github_readme" {
  repository          = github_repository.terraform_github.name
  branch              = "main"
  file                = "README.md"
  content             = "# Manage Github Organization with Terraform"
  commit_message      = "Managed by Terraform"
  commit_author       = "Terraform User"
  commit_email        = "terraform@example.com"
  overwrite_on_create = true

}

resource "github_branch_protection" "terraform_github_main" {
  repository_id = github_repository.terraform_github.node_id

  pattern          = "main"
  enforce_admins   = true
  allows_deletions = true

  required_pull_request_reviews {
    required_approving_review_count = 1
  }

  depends_on = [github_repository_file.terraform_github_readme]
}