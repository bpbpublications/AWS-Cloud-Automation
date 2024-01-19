provider "aws" {
  region = "us-east-2"
}

resource "aws_iam_role" "ec2-eng-role" {
  name = "ec2-eng-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role" "lambda-eng-role" {
  name = "lambda-eng-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ec2-eng-role_policy" {
  role = "${aws_iam_role.ec2-eng-role.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

resource "aws_iam_role_policy_attachment" "lambda-eng-role_policy" {
  role = "${aws_iam_role.lambda-eng-role.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

