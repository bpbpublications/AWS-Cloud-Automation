# Create Keypair
resource "tls_private_key" "efs-tfdemo-keypair"  {
  algorithm = "RSA"
}

# locally store
resource "local_file" "efstfdemokey" {
    content     = tls_private_key.efs-tfdemo-keypair.public_key_openssh
    filename = "efs-demo.pem"
    //file_permission = 0400
}


resource "aws_key_pair" "efs-tfdemo-key" {
  key_name    = "efs-tfdemo-key"
  public_key = tls_private_key.efs-tfdemo-keypair.public_key_openssh  
}
