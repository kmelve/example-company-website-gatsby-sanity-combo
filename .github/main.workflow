workflow "New workflow" {
  on = "push"
  resolves = ["GitHub Action for Zeit"]
}

action "GitHub Action for Zeit" {
  uses = "actions/zeit-now@9fe84d557939d277e0d98318b625bd48d364a89b"
  runs = "npm run now-deploy"
  secrets = ["GITHUB_TOKEN"]
}