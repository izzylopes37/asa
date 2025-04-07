# PROJETO FINAL DA DISCIPLINA ADMINISTRAÇÃO DE SISTEMAS ABERTOS | ASA-CLOUD

---

## 📌 **Objetivo do Projeto**
O projeto tem como objetivo criar um ambiente virtual que simula a operação de um provedor de internet e seus clientes. Os serviços são configurados utilizando **containers Docker**, permitindo o gerenciamento e escalabilidade dos sistemas.

A infraestrutura é composta por:
- **Provedor (barreta.com.br)**: Responsável por fornecer serviços como DNS e Proxy Reverso.
- **Cliente 1 (pirangi.com.br) e Cliente 2 (buzios.com.br)**: Possuem um servidor web WordPress com balanceamento de carga, um banco de dados e um servidor ssh.

---

## ⚙️ **Serviços Configurados**

### **E-mail - Postfix + Dovecot**

(Implementação parcial - Não está 100%)

- Servidor de e-mail configurado com Postfix (SMTP) para envio de e-mails.
- Dovecot (IMAP/POP3) configurado para o recebimento de e-mails.
- Integração com autenticação segura via SSL/TLS.

### **Webmail - Roundcube**

(Implementação parcial - Não está 100%)

- Interface web para acesso aos e-mails do provedor.
- Hospedado no container webmail, acessível via https://mail.barreta.com.br.
- Requer autenticação dos usuários cadastrados no serviço de e-mail.

### **DNS - Bind9**
- Gerencia a resolução de nomes para os domínios do provedor e dos clientes.

### **Proxy Reverso - Nginx**
- Funciona no container `proxy`, localizado no provedor (`barreta.com.br`).
- Redireciona requisições HTTPS e faz o balanceamento de carga para os clientes.

### **Servidor Web - WordPress**
- Os clientes `pirangi.com.br` e `buzios.com.br` possuem dois servidores WordPress (`web_NOME` e `web_NOME2`).
- A **Configuração do Proxy** distribui as requisições entre os dois servidores.
- A pasta do WordPress será criada dentro da pasta do respectivo cliente conforme o compose for executado.

### **Banco de Dados - MariaDB**
- Cada cliente tem seu próprio banco de dados MariaDB.
- Os bancos armazenam os dados dos sites WordPress.
- O banco de dados será criado na pasta do respectivo cliente conforme o mesmo for executado no compose.

### **SSH - Acesso Remoto Seguro**
- Implementado no `Provedor`, `cliente 1` e `cliente 2` para acesso administrativo.
- **Root login desativado** para maior segurança.

---

## 🏗️ **Estrutura do Projeto**
```bash
📂 Projeto-Final/
│── 📂 Provedor/
│   ├── 📂 dns/ # Servidor DNS
│   │   ├── Dockerfile
│   │   ├── named.conf.local
│   │   ├── zonas/
│   ├── 📂 email/   # Servidor de e-mail (Postfix + Dovecot)
│   │   ├── dovecot/
│   │   ├── Dockerfile
│   │   ├── mail.cf
│   ├── 📂 proxy/ # Configuração do Proxy Reverso
│   │   ├── Certificados SSL (barreta.crt, pirangi.crt, buzios.crt, etc.)
│   │   ├── Dockerfile
│   │   ├── nginx.conf
│   ├── 📂 ssh/     # Servidor SSH do Cliente
│   │   ├── Dockerfile
│   ├── 📂 webmail/ # Interface Webmail (Roundcube) (Implementação futura)
│   │   ├── config.inc.php
│   │   ├── Dockerfile
│   ├── docker-compose.yaml
│
│── 📂 Cliente1/   # Cliente pirangi.com.br
│   ├── 📂 mysql/   # Dados do Banco de Dados
│   ├── 📂 ssh/     # Servidor SSH do Cliente
│   ├── 📂 wordpress/  # Arquivos do WordPress
│   ├── docker-compose.yaml
│
│── 📂 Cliente2/   # Cliente buzios.com.br
│   ├── 📂 mysql/   # Dados do Banco de Dados
│   ├── 📂 ssh/     # Servidor SSH do Cliente
│   ├── 📂 wordpress/  # Arquivos do WordPress
│   ├── docker-compose.yml
│
└── README.md
```
---
## 📧 Contato:
E-mail: werllison.galvao@escolar.ifrn.edu.br
