# Define the existing group in the code
resource "aws_iam_group" "developers" {
  name = "developers"
}

# Import the existing group into Terraform state
import {
  to = aws_iam_group.developers
  id = "developers"
}

# Create a policy that allows all actions on all resources
resource "aws_iam_policy" "full_access" {
  name = "FullAccess"
  description = "A policy that grants full access to everything"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "*"
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

# Attach the policy to the group
resource "aws_iam_group_policy_attachment" "developers_full_access" {
  group      = aws_iam_group.developers.name
  policy_arn = aws_iam_policy.full_access.arn
}
