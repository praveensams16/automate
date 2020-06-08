module "eks-node-group" {
  source = "umotif-public/eks-node-group/aws"
  version = "~> 1.0"

  enabled      = true
  cluster_name = aws_eks_cluster.example.id

  subnet_ids = [aws_subnet.local-front.id,aws_subnet.local-back.id]

  desired_size = 1
  min_size     = 1
  max_size     = 1

  instance_types = ["t3.large"]

  ec2_ssh_key = "eks-test"

  kubernetes_labels = {
    lifecycle = "OnDemand"
  }

  tags = {
    Environment = "test"
  }
}
