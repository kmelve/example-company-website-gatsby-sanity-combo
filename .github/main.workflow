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
  runs = "SANTY_AUTH_TOKEN=$SANTY_AUTH_TOKEN cd studio && sanity deploy"
}
