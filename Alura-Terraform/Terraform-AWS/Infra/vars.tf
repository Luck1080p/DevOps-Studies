variable "amis" {
  type = map

  default = {
    "us-east-1" = "ami-052efd3df9dad4825"
    "us-east-2" = "ami-02d1e544b84bf7502"
  }
}

variable "cdirs_acesso_remoto" {
  type = list

  default = [""]
  
}