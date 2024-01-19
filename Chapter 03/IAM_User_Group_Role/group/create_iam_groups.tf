provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_group" "storage-eng-group" {
  name = "Storage-Engineering-Group"
}

resource "aws_iam_group" "vpc-eng-group" {
  name = "VPC-Engineering-Group"
}

resource "aws_iam_group" "identity-eng-group" {
  name = "Identity-Engineering-Group"
}

resource "aws_iam_group" "eks-eng-group" {
  name = "EKS-Engineering-Group"
}

resource "aws_iam_group" "database-engineering-group" {
  name = "Database-Engineering-Group"
}

resource "aws_iam_group_policy_attachment" "storage-eng-group_policy" {
  group = "${aws_iam_group.storage-eng-group.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

resource "aws_iam_group_policy_attachment" "vpc-eng-group_policy" {
  group = "${aws_iam_group.vpc-eng-group.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_group_policy_attachment" "identity-eng-group_policy" {
  group = "${aws_iam_group.identity-eng-group.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

resource "aws_iam_group_policy_attachment" "eks-eng-group_policy" {
  group = "${aws_iam_group.eks-eng-group.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_group_policy_attachment" "Database-Engineering-Group_policy" {
  group = "${aws_iam_group.database-engineering-group.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}
