variable "image" {
    type = map
    default = {
       us-east-1 =  "data.aws_ami.ubuntu.id"
       us-east-2 = "ami-0f90a34c9df977efb"
       }
       }

variable "region" {
    default = "us-east-1"
        }

