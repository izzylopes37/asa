# Projeto Nº 1 da disciplina Administração de Sistemas Abertos

## Orientações
* Configurar os registros corretamente no DNS.
* Executar o servidor de DNS.
* Configurar o servidor o web.
* Executar o servidor web.
* Configurar o cliente para usar o servidor de DNS para resolver nomes (Configuração de IP / DNS).
* Apontar o navegador para o endereço correto.
* Verificar os logs dos serviços.

## Sobre o projeto
Projeto desenvolvido utilizando a plataforma Docker, no qual foram criados dois containers: um para o servidor DNS, configurado com o BIND, e outro para o servidor web, configurado com o Nginx.  
  
Dentro do repositório, estão presentes os arquivos de configuração para ambos os containers, além de um shell script que automatiza algumas tarefas por meio do terminal, como iniciar ou parar os containers.  

## DNS
Dentro da pasta dns, serão encontrados os seguintes arquivos:  
* Dockerfile do Bind.
* Arquivo de zona (db.werllison37.com).
* Arquivo de Configuração do Servidor DNS (named.conf.local).

## WEB
Dentro da pasta web, serão encontrados os seguintes arquivos:  
* Dockerfile do nginx.
* index.html com a configuração da página inicial do site.

## Shell Script  
Como utilizar: ./service.sh <dns|web> <comando>
```
Comandos disponíveis:

• build   - Construir a imagem do serviço.
• start   - Criar ou iniciar o container do serviço.
• stop    - Parar o container do serviço.
• restart - Reiniciar o container do serviço.
• remove  - Remover o container e a imagem do serviço.
• logs    - Verificar os logs do container.
• help    - Lista todos os comandos disponíveis.
```
