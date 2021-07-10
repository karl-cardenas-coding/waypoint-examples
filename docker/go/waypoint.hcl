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
    use "docker" {
     service_port = 3000
     command = ["docker run example-go -d -p 3000:3000"]
    }
  }
}
