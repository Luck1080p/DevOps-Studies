# Docker

[Comandos básicos Docker](https://programadriano.medium.com/principais-comandos-docker-f9b02e6944cd)

---

[**Docker: criando e gerenciando containers**](https://github.com/Luck1080p/DevOps-Studies/blob/main/Docker/Alura-Docker/Alura_Docker_criando_e_gerenciando_containers.pdf)

[Docker-commands](https://github.com/Luck1080p/DevOps-Studies/blob/main/Docker/Alura-Docker/Docker-commands.md)

---

- **As seguintes habilidades são essenciais para se dominar Docker**
    1. Conceitos básicos de contêineres: Compreender o que são contêineres, suas diferenças em relação a máquinas virtuais, como eles são construídos e como eles funcionam.
    2. Instalação e configuração do Docker: Aprender a instalar e configurar o Docker em diferentes sistemas operacionais e ambientes.
    3. Dockerfile: Aprender a criar imagens do Docker usando o Dockerfile, que é uma linguagem de script para definir a configuração de um contêiner.
    4. Comandos do Docker: Saber como usar os principais comandos do Docker para gerenciar contêineres, imagens e redes, tais como "docker run", "docker build", "docker ps", "docker images", "docker network", entre outros.
    5. Gerenciamento de contêineres: Compreender como gerenciar contêineres, incluindo como iniciar, parar, pausar, remover e interagir com eles.
    6. Redes do Docker: Saber como criar e gerenciar redes do Docker para conectar contêineres.
    7. Orquestração de contêineres: Conhecer as principais ferramentas de orquestração do Docker, como o Docker Compose e o Kubernetes, que permitem gerenciar e escalar aplicações distribuídas em contêineres.
- **Plano de aprendizado para se dominar o Docker**
    1. Comece com o básico: Estude os conceitos fundamentais de contêineres e como o Docker funciona. Uma boa forma de começar é ler a documentação oficial do Docker e realizar tutoriais simples.
    2. Instale e configure o Docker: Instale o Docker em seu sistema operacional preferido e execute alguns comandos básicos para verificar se a instalação está funcionando corretamente.
    3. Aprenda a criar imagens do Docker: Estude como criar imagens do Docker usando o Dockerfile. Faça alguns exercícios práticos para compreender melhor essa linguagem de script.
    4. Gerencie contêineres e redes: Pratique o gerenciamento de contêineres e redes, executando diferentes comandos e verificando os resultados.
    5. Experimente ferramentas de orquestração: Estude as principais ferramentas de orquestração do Docker, como o Docker Compose e o Kubernetes. Realize tutoriais práticos e crie alguns exemplos simples para compreender como essas ferramentas funcionam.
    6. Aprofunde seus conhecimentos: Aprenda sobre recursos avançados do Docker, como volumes, Docker Swarm, gerenciamento de segurança e monitoramento de contêineres.
    7. Aplique o conhecimento em projetos reais: Aplique o que aprendeu em projetos reais, criando e gerenciando contêineres para suas aplicações.
- **Especializando em Docker**
    1. Introdução ao Docker
        1. Conceitos básicos de contêineres
        2. Diferenças entre contêineres e máquinas virtuais
        3. Vantagens do uso de contêineres
        4. Visão geral do Docker
    2. Instalação e configuração do Docker
        1. Instalação do Docker em diferentes sistemas operacionais
        2. Configuração do ambiente de desenvolvimento
        3. Verificação da instalação do Docker
    3. Dockerfile
        1. Introdução ao Dockerfile
        2. Criação de imagens usando o Dockerfile
        3. Comandos e diretivas do Dockerfile
        4. Melhores práticas para criar imagens do Docker
    4. Comandos do Docker
        1. Principais comandos do Docker
        2. Gerenciamento de contêineres e imagens
        3. Gerenciamento de redes do Docker
        4. Comunicação entre contêineres
    5. Orquestração de contêineres
        1. Introdução à orquestração de contêineres
        2. Introdução ao Docker Compose
        3. Introdução ao Kubernetes
        4. Implantação de aplicativos distribuídos usando o Docker Compose e o Kubernetes
    6. Gerenciamento de dados e volumes
        1. Gerenciamento de volumes de dados do Docker
        2. Gerenciamento de dados persistentes em contêineres
        3. Backup e restauração de dados em contêineres
    7. Gerenciamento de segurança e monitoramento
        1. Gerenciamento de segurança em contêineres
        2. Configuração de contêineres seguros
        3. Monitoramento de contêineres usando o Docker Stats e o Docker Events
        4. Criação de logs de contêineres
    8. Desenvolvimento de aplicativos com Docker
        1. Desenvolvimento de aplicativos locais com Docker
        2. Implantação de aplicativos em ambientes de produção
        3. Implementação de soluções de CI/CD com Docker
    9. Projetos práticos com Docker
        1. Criação de projetos práticos para aplicar os conhecimentos adquiridos
        2. Implementação de projetos de infraestrutura como código (IaC) com Docker
        3. Criação de um pipeline de CI/CD com Docker
    
    Lembre-se de que este é apenas um exemplo de plano de estudos e você pode ajustá-lo de acordo com seus objetivos de aprendizado e interesses pessoais. O importante é dedicar tempo para estudar e praticar regularmente para dominar os diferentes tópicos e habilidades relacionados a Docker.
    

---

- **Procedimentos**
    - Caso a distro instalada for a wsl -v 1 siga os passos deste procedimento
        1. Abra o PowerShell como administrador.
        2. Liste todas as distribuições WSL instaladas em seu sistema executando o seguinte comando:
        
        ```powershell
        wsl --list --verbose
        
        ```
        
        O resultado exibirá todas as distribuições WSL instaladas em seu sistema, incluindo a versão atual e o local do arquivo VHD.
        
        1. Selecione a distribuição WSL que você deseja converter para WSL2 e execute o seguinte comando:
        
        ```powershell
        wsl --set-version <Distro> 2
        
        ```
        
        Substitua **`<Distro>`** pelo nome da distribuição WSL que deseja converter. Por exemplo, se você deseja converter a distribuição Ubuntu, execute o seguinte comando:
        
        ```powershell
        wsl --set-version Ubuntu 2
        
        ```
        
        1. Aguarde até que a conversão esteja concluída. O tempo necessário para a conversão pode variar dependendo do tamanho da distribuição e da velocidade do seu computador.
        
        Depois que a conversão estiver concluída, você pode verificar se a distribuição foi convertida com sucesso executando o seguinte comando:
        
        ```powershell
        wsl --list --verbose
        
        ```
        
        O resultado mostrará a versão atual da distribuição WSL, que deve ser 2.
        
        Observe que a conversão de uma distribuição WSL de WSL1 para WSL2 é irreversível e não pode ser desfeita. Certifique-se de fazer backup de seus dados importantes antes de prosseguir com a conversão.
