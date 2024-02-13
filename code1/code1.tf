terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.61.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"

}

resource "aws_iam_group" "developers" {
  name = "developers"

}

resource "aws_iam_user" "lb" {
  name = "diane"

}

resource "aws_iam_group_membership" "team" {
  name = "developers"

  users = [
    "diane",
    "victorine",
  ]

  group = aws_iam_group.developers.name
}