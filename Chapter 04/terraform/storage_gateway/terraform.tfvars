# bucket_region         = "us-east-2"
 bucket_name           = "sgw-demo-bucket"
# gateway_time_zone     = "GMT-6:00"
# vpc_id                = "vpc-080f66d124a5149da" #your VPC ID goes here.
# subnet_id             = "subnet-058b3cad46115ce5d" #the subnet into which you are launching the gateway
# key_name              = "efs-tfdemo-key" #your ec2 ssh key goes here
 gateway_name          = "sgw-demo-gateway"
# ebs_cache_volume_size = 200
# instance_type         = "t2.micro"  #consult the AWS deployment guides for supported instance types
# deployment_cidr       = "172.20.0.0/24"#the CIDR block for your deployment host goes here.  Example:  "172.0.0.0/8"
# zone_name             = "sgw-demo-dns" #the DNS Zone into which your gateway's record should be created
# client_access_list    = ["10.100.0.0/24"] #replace with your own list
 gateway_ip_address    = "10.10.1.222"
 gateway_timezone     = "GMT-6:00"
