kops create cluster \
  --name=kops.devopsinuse.com \
  --state=s3://kops.devopsinuse.com \
  --authorization RBAC \
  --zones=eu-central-1a \
  --node-count=2 \
  --node-size=t2.micro \
  --master-size=t2.micro \
  --master-count=1 \
  --dns-zone=kops.devopsinuse.com \
  --out=devopsinuse_terraform \
  --target=terraform \
  --ssh-public-key=~/.ssh/id_rsa.pub