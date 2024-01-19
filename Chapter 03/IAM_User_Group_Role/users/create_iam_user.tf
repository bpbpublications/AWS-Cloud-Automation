provider "aws" {
  region = "us-east-1"
}

locals {
  iam_users = [
    {
      name     = "user1",
	  name     = "user1@gmail.com",
      password = "password1"
    },
    {
      name     = "user2",
	  name     = "user2@gmail.com",
      password = "password2"
    },
    {
      name     = "user3",
	  name     = "user3@gmail.com",
      password = "password3"
    }
  ]
}

resource "aws_iam_user" "newusers" {
  count = length(local.iam_users)

  name = local.iam_users[count.index].name

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

resource "aws_iam_access_key" "newusers" {
  count = length(local.iam_users)

  user = aws_iam_user.newusers[count.index].name
}
