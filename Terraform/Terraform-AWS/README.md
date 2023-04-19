# Alura-Terraform-AWS

# https://www.alura.com.br/curso-online-terraform

- Projeto do curso de introdução ao terraform da Alura na plataforma AWS. O projeto se consistiu na criação e 7 VM's, duas em regiões diferentes, um bucket ligado a uma das VM's, e um dynamoDB também ligado a uma das VM's.
- **IAAC** - Qualquer aplicação depende de uma infraestrutura como computador, sistema operacional, rede, espaço no HD e muito mais. A **Infraestrutura como Código**
 permite descrever essas características em um **arquivo de texto**
 e executar como se fosse um código da aplicação
 # Terraform 
    - [https://www.terraform.io/](https://www.terraform.io/)
    - Ferramenta multiplataforma
    - Serve para administrar a infraestrutura cloud, tanto para azure, aws, gcp, etc.
    - Irá provisionar o provedor de cloud

**INSTALAÇÃO** 

- LINUX-UBUNTU
    - Rodar os seguintes comandos :
        - `curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -`
        
        - `sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"`
        - `sudo apt-get update && sudo apt-get install terraform`
        - Se necessario instalar "curl"
- WINDOWS
    - Baixar o arquivo em zip
    - Criar um pasta no diretorio C: chamada terraform
    - Crie a variavel de ambiente chamada Path – C:\terraform 
