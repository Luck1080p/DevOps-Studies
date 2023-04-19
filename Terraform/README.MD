# TERRAFORM

- [O que é o terraform e quais suas aplicações?](https://www.gocache.com.br/dicas/o-que-e-terraform-e-quais-suas-aplicacoes/)

- Terraform é uma ferramenta para criar, alterar e criar versões de infraestrutura com segurança e eficiência. O Terraform pode ajudar com várias nuvens, tendo um único fluxo de trabalho para todas as nuvens. A infraestrutura gerenciada pelo Terraform pode ser hospedada em nuvens públicas, como Amazon Web Services, Microsoft Azure e Google Cloud Platform, ou no local, em nuvens privadas, como VMWare vSphere, OpenStack ou CloudStack. O Terraform trata a infraestrutura como código (infrastructure as code – IaC) para que você nunca precise se preocupar com a sua infraestrutura se distanciando da configuração desejada.

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
