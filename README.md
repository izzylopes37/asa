# Projeto Nº 2 da disciplina Administração de Sistemas Abertos

## Orientações
* Implementar uma estrutura web com 01 proxy reverso e 02 servidores de aplicação.
* Implementar a estrutura com 01 servidor de DNS primário com zona de resolução direta.
* Script de automatização de criação, exclusão, início e parada dos serviços.
* Domínios de DNS composto pelo primeiro nome do aluno + .asa.br (Ex.: edmar.asa.br).

## Sobre o projeto
Projeto desenvolvido utilizando a plataforma Docker, no qual foram criados 4 containers: Um para o servidor DNS, Um para o Proxy Reverso e outros dois para os servidores web. 
  
Dentro do repositório, estão presentes os arquivos de configuração para todos os containers, além de um shell script que automatiza algumas tarefas por meio do terminal, como iniciar ou parar os containers.  

## DNS
Dentro da pasta dns, serão encontrados os seguintes arquivos:  
* Dockerfile.
* Arquivo de zona (db.asa.br).
* Arquivo de Configuração do Servidor DNS (named.conf.local).

## Proxy
Dentro da pasta proxy, serão encontrados os seguintes arquivos:  
* Dockerfile.
* index.html com a configuração da página inicial.
* default.conf
* 404.html para telas do erro de mesmo nome.

## Server1
Dentro da pasta server1, serão encontrados os seguintes arquivos:  
* Dockerfile.
* index.html com a configuração da página inicial.
* sobre.html com a configuração de uma outra página do site.

## Server2
Dentro da pasta server2, serão encontrados os seguintes arquivos:  
* Dockerfile.
* index.html com a configuração da página inicial.

## Compose
* Arquivo configurado para a orquestração dos containers.

## Shell Script  
Como utilizar: ./service.sh <dns|web> <comando>
```
Comandos disponíveis:

Como utilizar: ./service.sh <comando>
Comandos disponíveis:"
• help         - Exibe esta mensagem de ajuda.
• start        - Executa o Docker Compose para criar e inicializar os containers.
• play         - Inicia todos os containers parados.
• stop         - Pausa todos os containers.
• remove       - Apaga todos os containers e imagens.
• <dns|proxy|server1|server2> restart - Reinicia o container específico.
```
