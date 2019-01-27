workflow "New workflow" {
  on = "push"
  resolves = [
    "Deploy",
    "Deploy Studio",
  ]
}

action "Deploy" {
  uses = "actions/zeit-now@master"
  secrets = [
    "ZEIT_TOKEN",
  ]
}

action "Deploy Studio" {
  uses = "docker://kmelve/github-actions-sanity-io"
  secrets = ["SANITY_AUTH_TOKEN"]
  runs = "cd studio && SANITY_AUTH_TOKEN=$SANITY_AUTH_TOKEN sanity deploy"
}
