workflow "New workflow" {
  on = "push"
  resolves = ["Build"]
}

action "Build" {
  uses = "actions/zeit-now@9fe84d557939d277e0d98318b625bd48d364a89b"
  runs = "npm run now-deploy -- --token"
  secrets = [
    "ZEIT_TOKEN",
  ]
}
