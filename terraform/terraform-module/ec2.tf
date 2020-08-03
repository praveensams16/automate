module "adds" {
        source = "github.com/praveensams/module/ec2"
        subnet = aws_subnet.subnet.id
       keypair = aws_key_pair.deployer.id
}   