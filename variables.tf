variable "region" {

  description = "Amazon Default Region"    
  default = "ap-south-1"
}

variable "project" {
  default = "zomato"
}

variable "vpc_cidr" { 
  default = "172.16.0.0/16"
}
#-----------------------

variable "subnet_public1_cidr" {
  default = "172.16.0.0/19"
  }
  
variable "subnet_public1_az" {
  default = "ap-south-1a"
  }
 #--------------------
  
variable "subnet_public2_cidr" {
  default = "172.16.32.0/19"
  }
variable "subnet_public2_az" {
  default = "ap-south-1b"
  }  

#-------------------

variable "subnet_public3_cidr" {
  default = "172.16.64.0/19"
  }
variable "subnet_public3_az" {
  default = "ap-south-1c"
  }

#---------------------

variable "subnet_private1_cidr" {
  default = "172.16.96.0/19"
  }
variable "subnet_private1_az" {

    default = "ap-south-1a"
  }
#---------------------

variable "subnet_private2_cidr" {
  default = "172.16.128.0/19"
  }
variable "subnet_private2_az" {

    default = "ap-south-1b"
  }
#---------------------

variable "subnet_private3_cidr" {
  default = "172.16.160.0/19"
  }
variable "subnet_private3_az" {

    default = "ap-south-1c"
  }
#---------------------
