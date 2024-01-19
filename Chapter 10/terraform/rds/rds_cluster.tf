# initial password
resource "random_password" "db_master_pass" {
  length           = 40
  special          = true
  min_special      = 5
  override_special = "!#$%^&*()-_=+[]{}<>:?"
}

# the secret
resource "aws_secretsmanager_secret" "db-pass" {
  name = "db-pass-${random_id.id.hex}"
}

# initial version
resource "aws_secretsmanager_secret_version" "db-pass-val" {
  secret_id = aws_secretsmanager_secret.db-pass.id

# encode in the required format
  secret_string = jsonencode(
    {
      username = aws_rds_cluster.demo-cluster.master_username
      password = aws_rds_cluster.demo-cluster.master_password
      engine   = "mysql"
      host     = aws_rds_cluster.demo-cluster.endpoint
    }
  )
}

# add the cluster to the 2 subnets
resource "aws_db_subnet_group" "demo-rdsdb-sg" {
  subnet_ids = aws_subnet.demo-rdsdb-subnet[*].id
}

resource "aws_rds_cluster" "demo-cluster" {
  engine                 = "aurora-mysql"
  engine_version         = "5.7.mysql_aurora.2.07.1"
  engine_mode            = "serverless"
  database_name          = "demordsdb"
  master_username        = "admin"
  master_password        = random_password.db_master_pass.result
  enable_http_endpoint   = true
  skip_final_snapshot    = true

# attach the security group
  vpc_security_group_ids = [aws_security_group.demo-rdsdb-sg.id]

# deploy to the subnets
  db_subnet_group_name   = aws_db_subnet_group.demo-rdsdb-sg.name
}
