resource "aws_lightsail_instance" "custom" {
  name              = "dev-server"
  availability_zone = "us-east-1a"
  blueprint_id      = "ubuntu_18_04"
  bundle_id         = "medium_1_0"
  user_data = " #!/bin/bash && sudo apt-get update && sudo apt-get install -y apache2 && sudo systemctl start apache2 && sudo systemctl enable apache2 echo && '<h1>This is deployed by Serge </h1>' | sudo tee /var/www/html/index.html "
  }

resource "aws_iam_group" "cloudtest" {
  name = "cloudtest"
  path = "/users/"
}

resource "aws_iam_user" "Passy" {
  name = "Passy"

}

resource "aws_iam_user" "Lyly" {
  name = "Lyly"

}

resource "aws_iam_group_membership" "cloudtest" {
  name = "cloudtest"

  users = [
    aws_iam_user.Passy.name,
    aws_iam_user.Lyly.name,
  ]

  group = aws_iam_group.cloudtest.name
}

