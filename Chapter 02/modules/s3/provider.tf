# Replication region must be different from your current region
provider "aws" {
  alias  = "replication"
  region = "us-east-2"
}
