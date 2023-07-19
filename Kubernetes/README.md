# Kubernetes

[****Kubernetes Labs - 1**** ](https://github.com/Luck1080p/DevOps-Studies/blob/main/Kubernetes/alura-kubernetes/Kubernetes-labs-1.pdf)
[****Kubernetes Labs - 2**** ](https://github.com/Luck1080p/DevOps-Studies/blob/main/Kubernetes/alura-kubernetes/kubernetes-labs-2.pdf)
---

Kubernetes é uma plataforma de código aberto para automatizar a implantação, o dimensionamento e o gerenciamento de aplicativos em contêineres. Ele fornece um ambiente para orquestrar e coordenar a execução de contêineres em um cluster de máquinas.

**Aqui estão algumas pautas importantes para aprender Kubernetes:**

1. Contêinerização: Entenda os conceitos básicos de contêineres, como Docker, e como eles ajudam na criação e no isolamento de aplicativos em ambientes consistentes.
2. Arquitetura do Kubernetes: Familiarize-se com os principais componentes do Kubernetes, como os mestres (master) e os nós (nodes), e como eles trabalham juntos para gerenciar os contêineres.
3. Pods: Aprenda sobre os pods, que são a menor unidade de implantação no Kubernetes. Entenda como os pods encapsulam um ou mais contêineres e como eles são escalonados e gerenciados pelo Kubernetes.
4. Replication Controllers e Replica Sets: Compreenda os conceitos de Replication Controllers e Replica Sets, que permitem a escalabilidade horizontal dos pods, garantindo que o número desejado de réplicas esteja em execução.
5. Services: Saiba como os Services no Kubernetes fornecem uma maneira de expor os pods para o mundo exterior, permitindo a comunicação entre os diferentes componentes do aplicativo.
6. Deployments: Explore os Deployments, que são usados para gerenciar a implantação e a atualização de aplicativos no Kubernetes. Eles facilitam a criação de novas versões de aplicativos, o rollback em caso de problemas e a realização de atualizações sem interrupção.
7. ConfigMaps e Secrets: Entenda como os ConfigMaps e Secrets são usados para gerenciar as configurações do aplicativo, como variáveis de ambiente e segredos sensíveis, de forma separada do código.
8. Persistent Volumes e Persistent Volume Claims: Descubra como os Persistent Volumes e Persistent Volume Claims permitem que os dados persistam além do ciclo de vida dos pods, fornecendo armazenamento persistente para aplicativos.
9. Monitoramento e Logging: Saiba como monitorar e registrar eventos, métricas e logs do Kubernetes para entender melhor o desempenho e o comportamento do seu cluster e aplicativos.
10. Kubernetes API e linha de comando (kubectl): Familiarize-se com a API do Kubernetes e aprenda a usar a linha de comando (kubectl) para interagir com o cluster e executar tarefas administrativas.

Essas são apenas algumas pautas importantes para começar a aprender Kubernetes. À medida que você avança, também pode explorar tópicos avançados, como autoscaling, configuração declarativa, segurança e redes no Kubernetes.

---

## Pratique Kubernetes

[Play with Kubernetes](https://labs.play-with-k8s.com/)

---

## Conteúdos de referência

[Kubernetes // Dicionário do Programador](https://www.youtube.com/watch?v=mVL0nOM3AGo)

[O que é Kubernetes? Tudo que você precisa saber sobre!](https://blog.geekhunter.com.br/kubernetes-a-arquitetura-de-um-cluster/#:~:text=Como%20funciona%20o%20Kubernetes%3A%20Containers,-N%C3%A3o%20tem%20muito&text=Containers%20seguem%20basicamente%20a%20mesma,ser%20executado%20em%20diversos%20locais)

[O que é o projeto Kubernetes e para que ele serve? | Alura](https://www.alura.com.br/artigos/o-que-e-kubernetes)

---

[Kubectl-Commands](https://github.com/Luck1080p/DevOps-Studies/blob/main/Kubernetes/Kubectl-Commands.md)

- **Procedimentos**
    - DLL no pod
        - Embutido no container
            
            Para subir um pod de Windows Server no Kubernetes com um arquivo DLL embutido no container, você precisará seguir os seguintes passos:
            
            1. Crie o seu arquivo Dockerfile para construir a imagem do seu container. Inclua o arquivo DLL no diretório do container e adicione as etapas necessárias para instalá-lo. Por exemplo:
            
            ```
            FROM mcr.microsoft.com/windows/servercore:ltsc2019
            
            WORKDIR /app
            
            COPY mydll.dll .
            
            RUN regsvr32 mydll.dll
            
            ```
            
            Observe que, neste exemplo, estamos usando a imagem `mcr.microsoft.com/windows/servercore:ltsc2019` como base para nossa imagem. Você pode usar outra imagem, dependendo das suas necessidades.
            
            1. Construa a imagem do seu container a partir do Dockerfile:
            
            ```
            docker build -t myimage:latest .
            
            ```
            
            1. Faça o push da imagem do seu container para um registro de contêineres compatível com o Kubernetes, como o Docker Hub ou o Azure Container Registry:
            
            ```
            docker push myimage:latest
            
            ```
            
            1. Crie um arquivo YAML para o seu pod do Kubernetes. Inclua as informações necessárias para configurar seu pod e montar o arquivo DLL no diretório do container. Por exemplo:
            
            ```
            apiVersion: v1
            kind: Pod
            metadata:
              name: mypod
            spec:
              containers:
              - name: mycontainer
                image: myimage:latest
                volumeMounts:
                - name: mydll
                  mountPath: C:\app\mydll.dll
              volumes:
              - name: mydll
                configMap:
                  name: mydll-config
            
            ```
            
            Observe que, neste exemplo, estamos montando o arquivo DLL no diretório `C:\app` do container. Você pode alterar o caminho de montagem, dependendo de onde seu aplicativo espera encontrar o arquivo DLL.
            
            1. Crie um ConfigMap para o seu arquivo DLL. Inclua o arquivo DLL como um valor de dados no ConfigMap. Por exemplo:
            
            ```
            apiVersion: v1
            kind: ConfigMap
            metadata:
              name: mydll-config
            data:
              mydll.dll: |
                <conteúdo do arquivo DLL aqui>
            
            ```
            
            Observe que, neste exemplo, estamos usando a sintaxe YAML para incluir o conteúdo do arquivo DLL como um valor de dados no ConfigMap. Você pode usar outras opções para incluir o arquivo DLL, dependendo do seu ambiente.
            
            1. Aplique o arquivo YAML do seu pod e o ConfigMap:
            
            ```
            kubectl apply -f mypod.yaml
            kubectl apply -f mydll-config.yaml
            
            ```
            
            1. Verifique se o seu pod está em execução e se o arquivo DLL está no diretório correto:
            
            ```
            kubectl get pods
            kubectl exec -it mypod -- powershell
            dir C:\app
            
            ```
            
            Com esses passos, você deve ser capaz de subir um pod de Windows Server no Kubernetes com um arquivo DLL embutido no container. Lembre-se de que você precisará adaptar esses passos às suas necessidades específicas.
            
        - Direto no YAML
            
            Para subir um pod de Windows Server no Kubernetes com um arquivo DLL, você pode seguir os seguintes passos:
            
            1. Crie um arquivo YAML para o seu pod, definindo o nome do pod, a imagem do contêiner e o caminho para o arquivo DLL:
            
            ```
            apiVersion: v1
            kind: Pod
            metadata:
              name: mypod
            spec:
              containers:
                - name: mycontainer
                  image: microsoft/windowsservercore
                  command: ["powershell"]
                  args: ["-Command", "Copy-Item -Path C:\app\mydll.dll -Destination C:\windows\system32"]
                  volumeMounts:
                    - name: dll
                      mountPath: C:\app
              volumes:
                - name: dll
                  configMap:
                    name: mydll-config
            
            ```
            
            Observe que o comando e os argumentos copiam o arquivo DLL do diretório `C:\app` para o diretório `C:\windows\system32`.
            
            1. Crie um arquivo YAML para o seu ConfigMap, que contém o arquivo DLL:
            
            ```
            apiVersion: v1
            kind: ConfigMap
            metadata:
              name: mydll-config
            data:
              mydll.dll: |-
                <conteúdo do arquivo DLL>
            
            ```
            
            Substitua `<conteúdo do arquivo DLL>` pelo conteúdo do seu arquivo DLL, em formato de texto.
            
            1. Aplique o arquivo YAML do seu ConfigMap:
            
            ```
            kubectl apply -f mydll-config.yaml
            
            ```
            
            1. Verifique se o seu ConfigMap foi criado corretamente:
            
            ```
            kubectl get configmaps
            kubectl describe configmap mydll-config
            
            ```
            
            1. Crie um diretório local para armazenar o arquivo YAML do seu pod:
            
            ```
            mkdir mypod
            cd mypod
            
            ```
            
            Salve o arquivo YAML do seu pod em `mypod.yaml` e o arquivo YAML do ConfigMap em `mydll-config.yaml`.
            
    - Qual comando do kubectl posso utilizar para validar os arquivos dentro de um node do GKE?
        
        Você pode usar o comando **`kubectl exec`** para executar comandos em um container em execução em um nó do Google Kubernetes Engine (GKE). Isso permite que você verifique os arquivos e o estado do sistema dentro do container.
        
        Para verificar os arquivos dentro de um container em execução em um nó do GKE, você pode executar o seguinte comando:
        
        ```
        bashCopy code
        kubectl exec <nome-do-pod> -- ls <diretório>
        
        ```
        
        Substitua **`<nome-do-pod>`** pelo nome do pod que está sendo executado no nó que você deseja verificar e **`<diretório>`** pelo diretório que deseja verificar. Esse comando executa o comando **`ls`** dentro do container especificado e lista os arquivos no diretório especificado.
        
        Por exemplo, para listar os arquivos no diretório **`/app`** dentro do pod **`my-app`** em um cluster do GKE, você pode executar o seguinte comando:
        
        ```
        bashCopy code
        kubectl exec my-app -- ls /app
        
        ```
        
        Este comando irá listar todos os arquivos e diretórios presentes em **`/app`** dentro do container em execução no pod **`my-app`**.
        
    - Como rodar este comando kubectl exec my-app -- ls /app em um container de windows server
        
        Para executar um comando dentro de um container do Windows Server usando o **`kubectl`**, você precisa especificar o shell do Windows para o comando **`kubectl exec`**.
        
        O shell do Windows é **`cmd`** ou **`powershell`**. Você pode especificar o shell usando a opção **`-it`** com o valor **`cmd`** ou **`powershell`**.
        
        Por exemplo, para executar o comando **`ls`** dentro do diretório **`/app`** em um container do Windows Server usando o shell do **`cmd`**, você pode usar o seguinte comando:
        
        ```
        bashCopy code
        kubectl exec -it my-app cmd /c dir C:\app
        
        ```
        
        Substitua **`my-app`** pelo nome do seu pod que está sendo executado no nó do GKE. Este comando executa o comando **`dir`** dentro do container do Windows Server especificado e lista os arquivos no diretório **`/app`**.
        
        Se você preferir usar o shell do PowerShell, substitua **`cmd`** por **`powershell`**:
        
        ```
        bashCopy code
        kubectl exec -it my-app powershell -command "Get-ChildItem C:\app"
        
        ```
        
        Este comando executa o comando **`Get-ChildItem`** dentro do container do Windows Server especificado e lista os arquivos no diretório **`/app`**.
        
    - Como rastrear o trafego de rede um pod
        
        Para rastrear o tráfego de rede de um pod em um cluster Kubernetes, você pode usar várias ferramentas disponíveis no mercado, como o tcpdump, o Wireshark ou o tshark. Aqui está um exemplo de como usar o tcpdump para rastrear o tráfego de rede em um pod específico:
        
        1. Execute o comando **`kubectl get pods`** para listar todos os pods em execução no cluster. Encontre o nome do pod que você deseja rastrear.
        2. Conecte-se ao pod usando o comando **`kubectl exec -it <nome do pod> -- /bin/bash`**.
        3. Instale o tcpdump usando o gerenciador de pacotes do sistema operacional do pod. Por exemplo, se o pod estiver usando o Ubuntu, execute **`apt-get update && apt-get install -y tcpdump`**.
        4. Execute o tcpdump com o seguinte comando: **`tcpdump -i <nome da interface de rede>`**. A interface de rede padrão no Kubernetes é a "eth0".
        5. Analise os resultados do tcpdump para ver o tráfego de rede que está sendo enviado e recebido pelo pod.
        
        Lembre-se de que, para usar o tcpdump, você precisará ter privilégios elevados no cluster Kubernetes. Além disso, é importante ter cuidado ao rastrear o tráfego de rede, pois isso pode violar a privacidade dos usuários e também pode ser uma violação de segurança. Certifique-se de ter as permissões adequadas e de seguir as políticas de segurança do seu ambiente Kubernetes.
        
        - Como instalar o tcpdump em um pod
            
            Para instalar o tcpdump em um pod do Kubernetes, você pode executar os seguintes comandos dentro do pod:
            
            1. Atualize o gerenciador de pacotes do sistema operacional do pod:
                - Para sistemas baseados em Debian/Ubuntu: **`apt-get update`**
                - Para sistemas baseados em Red Hat/CentOS: **`yum update`**
            2. Instale o tcpdump usando o gerenciador de pacotes apropriado:
                - Para sistemas baseados em Debian/Ubuntu: **`apt-get install tcpdump`**
                - Para sistemas baseados em Red Hat/CentOS: **`yum install tcpdump`**
            
            Depois de concluir esses passos, o tcpdump estará instalado e pronto para ser usado em seu pod do Kubernetes. Para executar o tcpdump e capturar o tráfego de rede, você pode usar o comando **`tcpdump`** seguido de opções e filtros adequados, dependendo de sua necessidade. Por exemplo, para capturar todo o tráfego de rede que passa pela interface de rede padrão do pod (normalmente chamada de eth0), você pode executar o comando **`tcpdump -i eth0`**.
            
        - Como instalar o tcpdump em um pod alpine
            
            Para instalar o tcpdump em um pod Alpine, você pode seguir os seguintes passos:
            
            1. Abra um terminal e conecte-se ao pod Alpine executando o comando:
                
                ```
                bashCopy code
                kubectl exec -it nome_do_pod_alpine -- /bin/sh
                
                ```
                
                Substitua **`nome_do_pod_alpine`** pelo nome do seu pod Alpine.
                
            2. Atualize o gerenciador de pacotes do sistema operacional dentro do pod usando o comando:
                
                ```
                sqlCopy code
                apk update
                
                ```
                
            3. Instale o tcpdump usando o gerenciador de pacotes apk, executando o seguinte comando:
                
                ```
                csharpCopy code
                apk add tcpdump
                
                ```
                
            
            Depois de concluir esses passos, o tcpdump estará instalado e pronto para ser usado em seu pod Alpine. Para executar o tcpdump e capturar o tráfego de rede, você pode usar o comando **`tcpdump`** seguido de opções e filtros adequados, dependendo de sua necessidade. Por exemplo, para capturar todo o tráfego de rede que passa pela interface de rede padrão do pod (normalmente chamada de eth0), você pode executar o comando **`tcpdump -i eth0`**.
            
            Lembre-se de que você precisa ter privilégios elevados para instalar o tcpdump e executá-lo em um pod, por isso certifique-se de ter as permissões apropriadas antes de prosseguir.
            
    - Como alterar a url e a Key do datadog em um cluster do AKS
        
        Para alterar a URL e a chave do Datadog em um cluster do AKS, siga estes passos:
        
        1. Acesse a página de integração do Datadog no Azure Marketplace e crie uma nova chave de API. Você pode seguir as instruções detalhadas na página.
        2. Acesse o painel de controle do Datadog e copie a nova chave de API.
        3. Abra o console do Kubernetes e execute o seguinte comando para obter as credenciais do Datadog:
            
            ```
            luaCopy code
            kubectl create secret generic datadog-secret --from-literal api-key=<YOUR_API_KEY>
            
            ```
            
            Certifique-se de substituir **`<YOUR_API_KEY>`** pela chave de API do Datadog que você copiou anteriormente.
            
        4. Edite o arquivo **`datadog.yaml`** para incluir a URL e a chave do Datadog:
            
            ```
            yamlCopy code
            env:
              - name: DD_API_KEY
                valueFrom:
                  secretKeyRef:
                    name: datadog-secret
                    key: api-key
              - name: DD_SITE
                value: datadoghq.com
            
            ```
            
            Certifique-se de substituir **`datadoghq.com`** pela URL apropriada do Datadog para sua conta.
            
        5. Execute o seguinte comando para aplicar as alterações:
            
            ```
            Copy code
            kubectl apply -f datadog.yaml
            
            ```
            
        
        Isso deve atualizar a URL e a chave do Datadog em seu cluster do AKS. Certifique-se de testar sua integração do Datadog para garantir que tudo esteja funcionando corretamente.
        

---
