#Codigo para configuração do VPC (Virtaul private cloud).
#Para que possamos acessar as instancias criadas. 
resource "aws_security_group" "acesso-ssh" {
  name        = "acesso-ssh"
  description = "acesso-ssh"

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [""] #Colocar o IP que ira realizar o acesso
  }

  tags = {
    Name = "ssh"
  }
}

resource "aws_security_group" "acesso-ssh-us-east-2" {
  provider = aws.us-east-2
  name        = "acesso-ssh"
  description = "acesso-ssh"

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [""] #Colocar o IP que ira realizar o acesso
  }

  tags = {
    Name = "ssh"
  }
}