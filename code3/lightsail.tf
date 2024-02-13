resource "aws_lightsail_instance" "custom" {
  name              = "my-server"
  availability_zone = "us-east-1b"
  blueprint_id      = "amazon_linux_2"
  bundle_id         = "nano_1_0"
  user_data         = "sudo yum install -y httpd && sudo systemctl start httpd && sudo systemctl enable httpd && echo '<h1>Deployed via Terraform by Diane Gakam during my week 5 session </h1>' | sudo tee /var/www/html/index.html"
}

