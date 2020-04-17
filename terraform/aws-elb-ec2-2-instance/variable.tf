variable "image" {
    type = map
    default = {
        us-east-1 = "ami-0fc61db8544a617ed"
        us-east-2 = "ami-0fc61db8544a617e"
        }
    }

 variable "region" {
    default = "us-east-1"
    }
