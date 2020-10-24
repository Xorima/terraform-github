provider "github" {
  alias = "collaborator"
}

resource "github_repository" "repository" {
  name        = var.name
  description = var.description

  visibility             = "public"
  has_issues             = true
  has_wiki               = false
  has_projects           = false
  allow_merge_commit     = true
  allow_squash_merge     = true
  allow_rebase_merge     = true
  delete_branch_on_merge = true
  has_downloads          = false
  auto_init              = true

}

resource "github_repository_collaborator" "xorimabot" {
  repository = github_repository.repository.name
  username   = "xorimabot"
}


resource "github_user_invitation_accepter" "xorimabot" {
  provider      = github.collaborator
  invitation_id = github_repository_collaborator.xorimabot.invitation_id
}

resource "github_actions_secret" "docker_username" {
  repository      = github_repository.repository.name
  secret_name     = "DOCKER_USERNAME"
  plaintext_value = var.dockerhub_config.username
  count           = var.dockerhub_config.enabled ? 1 : 0
}
resource "github_actions_secret" "docker_password" {
  repository      = github_repository.repository.name
  secret_name     = "DOCKER_PASSWORD"
  plaintext_value = var.dockerhub_config.password
  count           = var.dockerhub_config.enabled ? 1 : 0
}
