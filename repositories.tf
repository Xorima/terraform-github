module "deployment_status_slack_notifier" {
  source                     = "./modules/repository"
  name                       = "deployment_status_slack_notifier"
  description                = "Posts messages to slack based on github deployment_status webhook"
  dockerhub_config           = local.dockerhub_config
  label_validator_config     = local.label_validator_config
  json_version_bumper_config = local.json_version_bumper_config
  release_creator_config     = local.release_creator_config
  changelog_reset_config     = local.changelog_reset_config
  changelog_validator_config = local.changelog_validator_config
  providers = {
    github              = github
    github.collaborator = github.xorimabot
  }
}

module "cookbook_supermarket_uploader" {
  source                     = "./modules/repository"
  name                       = "cookbook_supermarket_uploader"
  description                = "Uploads a cookbook source to the chef supermarket based on a github webhook event"
  dockerhub_config           = local.dockerhub_config
  label_validator_config     = local.label_validator_config
  json_version_bumper_config = local.json_version_bumper_config
  release_creator_config     = local.release_creator_config
  changelog_reset_config     = local.changelog_reset_config
  changelog_validator_config = local.changelog_validator_config
  providers = {
    github              = github
    github.collaborator = github.xorimabot
  }
}

module "cookbook_release_creator" {
  source                     = "./modules/repository"
  name                       = "cookbook_release_creator"
  description                = "Creates a release in github based on the metadata.rb from a github webhook event"
  dockerhub_config           = local.dockerhub_config
  label_validator_config     = local.label_validator_config
  json_version_bumper_config = local.json_version_bumper_config
  release_creator_config     = local.release_creator_config
  changelog_reset_config     = local.changelog_reset_config
  changelog_validator_config = local.changelog_validator_config
  providers = {
    github              = github
    github.collaborator = github.xorimabot
  }
}

module "cookbook_release_validator" {
  source                     = "./modules/repository"
  name                       = "cookbook_release_validator"
  description                = "Checks that the version number in metadata.rb on the pull request is the same as the default branch"
  dockerhub_config           = local.dockerhub_config
  label_validator_config     = local.label_validator_config
  json_version_bumper_config = local.json_version_bumper_config
  release_creator_config     = local.release_creator_config
  changelog_reset_config     = local.changelog_reset_config
  changelog_validator_config = local.changelog_validator_config
  providers = {
    github              = github
    github.collaborator = github.xorimabot
  }
}

module "changelog_reset" {
  source                     = "./modules/repository"
  name                       = "changelog_reset"
  dockerhub_config           = local.dockerhub_config
  label_validator_config     = local.label_validator_config
  json_version_bumper_config = local.json_version_bumper_config
  release_creator_config     = local.release_creator_config
  changelog_reset_config     = local.changelog_reset_config
  changelog_validator_config = local.changelog_validator_config
  description                = "Resets a changelog back to the ## Unreleased heading from a github release webhook event"
  providers = {
    github              = github
    github.collaborator = github.xorimabot
  }
}

module "changelog_validator" {
  source                     = "./modules/repository"
  name                       = "changelog_validator"
  description                = "Checks the changelog has a ## Unreleased section via a status check"
  dockerhub_config           = local.dockerhub_config
  label_validator_config     = local.label_validator_config
  json_version_bumper_config = local.json_version_bumper_config
  release_creator_config     = local.release_creator_config
  changelog_reset_config     = local.changelog_reset_config
  changelog_validator_config = local.changelog_validator_config
  providers = {
    github              = github
    github.collaborator = github.xorimabot
  }
}


module "labelvalidator" {
  source                     = "./modules/repository"
  name                       = "labelvalidator"
  description                = "Ruby webapp to check that github prs have release labels"
  dockerhub_config           = local.dockerhub_config
  label_validator_config     = local.label_validator_config
  json_version_bumper_config = local.json_version_bumper_config
  release_creator_config     = local.release_creator_config
  changelog_reset_config     = local.changelog_reset_config
  changelog_validator_config = local.changelog_validator_config
  providers = {
    github              = github
    github.collaborator = github.xorimabot
  }
}

module "json_version_bumper" {
  source                     = "./modules/repository"
  name                       = "json_version_bumper"
  description                = "A small app to bump json files with application versions"
  dockerhub_config           = local.dockerhub_config
  label_validator_config     = local.label_validator_config
  json_version_bumper_config = local.json_version_bumper_config
  release_creator_config     = local.release_creator_config
  changelog_reset_config     = local.changelog_reset_config
  changelog_validator_config = local.changelog_validator_config
  providers = {
    github              = github
    github.collaborator = github.xorimabot
  }
}


module "release_creator" {
  source                     = "./modules/repository"
  name                       = "release_creator"
  description                = "Consumes github webhooks and creates releases from tags and changelog. Comments on the merged PR with the new version number"
  dockerhub_config           = local.dockerhub_config
  label_validator_config     = local.label_validator_config
  json_version_bumper_config = local.json_version_bumper_config
  release_creator_config     = local.release_creator_config
  changelog_reset_config     = local.changelog_reset_config
  changelog_validator_config = local.changelog_validator_config
  providers = {
    github              = github
    github.collaborator = github.xorimabot
  }
}


module "github-label-manager" {
  source                     = "./modules/repository"
  name                       = "github-label-manager"
  description                = "A Label Manager for Github relying on Topics and a source repository for Definition files"
  dockerhub_config           = local.dockerhub_config
  label_validator_config     = local.label_validator_config
  json_version_bumper_config = local.json_version_bumper_config
  release_creator_config     = local.release_creator_config
  changelog_reset_config     = local.changelog_reset_config
  changelog_validator_config = local.changelog_validator_config
  providers = {
    github              = github
    github.collaborator = github.xorimabot
  }
}

module "github-cookstyle-runner" {
  source                     = "./modules/repository"
  name                       = "github-cookstyle-runner"
  description                = "A kubernetes application to automatically run cookstyle against repos found by a github topic"
  dockerhub_config           = local.dockerhub_config
  label_validator_config     = local.label_validator_config
  json_version_bumper_config = local.json_version_bumper_config
  release_creator_config     = local.release_creator_config
  changelog_reset_config     = local.changelog_reset_config
  changelog_validator_config = local.changelog_validator_config
  providers = {
    github              = github
    github.collaborator = github.xorimabot
  }
}


module "github-file-manager" {
  source                     = "./modules/repository"
  name                       = "github-file-manager"
  description                = "A File Manager for multiple Github Repositories written in Powershell"
  dockerhub_config           = local.dockerhub_config
  label_validator_config     = local.label_validator_config
  json_version_bumper_config = local.json_version_bumper_config
  release_creator_config     = local.release_creator_config
  changelog_reset_config     = local.changelog_reset_config
  changelog_validator_config = local.changelog_validator_config
  providers = {
    github              = github
    github.collaborator = github.xorimabot
  }
}

module "get-iplayer" {
  source           = "./modules/repository"
  name             = "get-iplayer"
  description      = "A repository to build docker images which hold get-iplayer"
  dockerhub_config = local.dockerhub_config
  providers = {
    github              = github
    github.collaborator = github.xorimabot
  }
}

module "gitconfig" {
  source                     = "./modules/repository"
  name                       = "gitconfig"
  description                = "A Golang module for managing gitconfig"
  label_validator_config     = local.label_validator_config
  release_creator_config     = local.release_creator_config
  changelog_reset_config     = local.changelog_reset_config
  changelog_validator_config = local.changelog_validator_config
}
