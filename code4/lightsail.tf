resource "aws_lightsail_instance" "custom" {
  name              = "my-apache"
  availability_zone = "us-east-1b"
  blueprint_id      = "amazon_linux_2"
  bundle_id         = "nano_1_0"
  user_data         = "sudo yum install -y httpd && sudo systemctl start httpd && sudo systemctl enable httpd && echo '<h1>This is my first terraform project</h1>' | sudo tee /var/www/html/index.html"
}

resource "aws_iam_group" "cloudteam" {
  name = "cloudteam"
  path = "/users/"
}

resource "aws_iam_user" "Charly" {
  name = "Charly"

}

resource "aws_iam_user" "Serge" {
  name = "Serge"

}

resource "aws_iam_group_membership" "cloudteam" {
  name = "cloudteam"

  users = [
    aws_iam_user.Charly.name,
    aws_iam_user.Serge.name,
  ]

  group = aws_iam_group.cloudteam.name
}

