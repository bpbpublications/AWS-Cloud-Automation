variable "environment" {
    description = "Identifies environment for the infrastructure"
    type = string
    default = "demo"
}
variable "server_name" {
    description = "Utilized to identify the server name of each instance"
    type    = map
    default = { 
        server_1 = {
            server_name = "demo-web-server1"
            key_name = "apache_key"
        }
        server_2 = {
            server_name = "demo-web-server2"
            key_name = "apache_key"
        }
        server_3 = {
            server_name = "demo-db1"
            key_name = "rds_key"
        }
        server_4 = {
            server_name = "demo-db2"
            key_name = "rds_key"
        }
    }
}
