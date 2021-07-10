project = "example-go"

runner {
  enabled = true

  data_source "git" {
    url  = "https://github.com/karl-cardenas-coding/waypoint-examples.git"
    path = "docker/go"
  }
}

app "example-go" {
  labels = {
    "service" = "example-go",
    "env"     = "dev"
  }

  build {
    use "pack" {}
  }

  deploy {
    use "exec" {
      command = ["docker", "run", "-d", "--publish", "3000:3000", "example-go:latest"]
    }
  }
}
