workflow "New workflow" {
  on = "push"
  resolves = [
    "Deploy",
    "docker://",
  ]
}

action "Deploy" {
  uses = "actions/zeit-now@master"
  secrets = [
    "ZEIT_TOKEN",
  ]
}

action "docker://" {
  uses = "docker://kmelve/github-actions-sanity-io"
  secrets = ["SANITY_AUTH_TOKEN"]
}
