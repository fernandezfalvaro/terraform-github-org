resource "github_team" "admin_team" {
  name        = "admin-team"
  description = "Admin team"
  privacy     = "closed"
}

resource "github_team_members" "admin_team_members" {
  team_id  = github_team.admin_team.id

  members {
    username = "alvarof2"
    role     = "maintainer"
  }

  members {
    username = "lone-lynx"
    role     = "maintainer"
  }
}

resource "github_team_repository" "terraform_github_team_admin" {
  team_id    = github_team.admin_team.id
  repository = github_repository.terraform_github.name
  permission = "admin"
}
