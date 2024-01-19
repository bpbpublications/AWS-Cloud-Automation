data "aws_region" "current" {}

data "aws_ami" "amazonlinux2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-gp2"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "template_file" "user_data" {
  template = file("${path.module}/install-codedeploy-agent.sh")
  vars = {
    aws_region = data.aws_region.current.name
  }
}

resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow http inbound traffic"
  vpc_id      = aws_vpc.vpc_awsca_demo.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["207.172.40.22/32"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

  tags = {
    Name = "allow_http"
  }
}

resource "aws_iam_role" "awsca-ec2-role" {
  name = "awsca-ec2-role"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "",
            "Effect": "Allow",
            "Principal": {
                "Service": "ec2.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy" "awsca-demo" {
  role = aws_iam_role.awsca-ec2-role.name

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:Get*",
        "s3:List*"
      ],
      "Resource": ["*"]
    }
  ]
}
POLICY
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2_profile"
  role = aws_iam_role.awsca-ec2-role.name
}

resource "aws_instance" "awsca-demo" {
  instance_type          = "t2.micro"
  ami                    = data.aws_ami.amazonlinux2.id
  user_data              = data.template_file.user_data.rendered
  iam_instance_profile   = aws_iam_instance_profile.ec2_profile.name
  vpc_security_group_ids = [aws_security_group.allow_http.id]
  subnet_id              = aws_subnet.subnet_public_1a_demo.id

  tags = {
    Name        = "awsCloudAutomation"
    Environment = "demo"
  }
}

resource "aws_iam_role" "awsca-demo" {
  name = "awsca-demo-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "codedeploy.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "AWSCodeDeployRole" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole"
  role       = aws_iam_role.awsca-demo.name
}

resource "aws_codedeploy_app" "awsca-demo" {
  name = "awsca-demo-app"
}

resource "aws_sns_topic" "awsca-demo" {
  name = "awsca-demo-topic"
}

resource "aws_codedeploy_deployment_group" "awsca-demo" {
  app_name              = aws_codedeploy_app.awsca-demo.name
  deployment_group_name = "awsca-demo-group"
  deployment_config_name = "CodeDeployDefault.AllAtOnce"
  service_role_arn      = aws_iam_role.awsca-demo.arn

  ec2_tag_set {
    ec2_tag_filter {
      key   = "Environment"
      type  = "KEY_AND_VALUE"
      value = "demo"
    }
  }

  trigger_configuration {
    trigger_events     = ["DeploymentFailure"]
    trigger_name       = "awsca-demo-trigger"
    trigger_target_arn = aws_sns_topic.awsca-demo.arn
  }

  auto_rollback_configuration {
    enabled = false
    events  = ["DEPLOYMENT_FAILURE"]
  }

}
