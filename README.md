# Trabalho de Progração Orientada a Objetos

Este projeto é um trabalho da disciplina de Progração Orientada a Objetos 1 do curso de Sistemas de Informação da Universidade Federal de Uberlândia.

O objetivo do trabalho é construir um sistema computacional que incorpore os conceitos de Orientação a Objetos utilizando a linguagem Java.

O trabalho foi desenvolvido pelos alunos:

Dalmo Scalon Inácio - 12111BSI274
Guilherme Castilho - 12021BSI225
José Luzia da Silva Neto - 12021BSI264
Lucas Gabriel Dutra de Souza - 12121BSI226
Victor Hugo Morais da Silva - 11921BSI231


Mais informações podem ser encontradas no arquivo: [AtividadeAvaliativaFinal_202202](AtividadeAvaliativaFinal_202202.pdf)

# Instruções para executar a aplicação com docker-compose
Este projeto contém um backend escrito em Java com Spring Boot, um frontend escrito em GatsbyJS, um banco de dados PostgreSQL, um mock de API escrito em Express e um servidor de arquivos estaticos e reverse Proxy HaProxy. Todos esses componentes são gerenciados pelo Docker Compose, permitindo que você inicie a aplicação de maneira rápida e fácil.

## Pré-requisitos

Antes de começar, certifique-se de ter instalado em sua máquina o Docker e o Docker Compose. Você pode encontrar instruções para instalação na documentação oficial do Docker: https://docs.docker.com/get-docker/ e https://docs.docker.com/compose/install/.

## Configuração

Clone este repositório para a sua máquina:

```bash
git clone https://github.com/lucasgdutra/ufu_GSI015_trabalho_quiz.git
```
### Variáveis de ambiente
Na pasta raiz do projeto, crie um arquivo chamado *`.env`* com as seguintes variáveis de ambiente:

```env
DB_USER=usuario
DB_PASSWORD=senha
DB_NAME=nome_do_banco
```

Substitua os valores de *`usuario`*, *`senha`* e *`nome_do_banco`* pelos valores desejados.

### Backend
Dentro da pasta *`backend`*, crie um arquivo *`application.properties`* com as seguintes informações:

```properties
spring.datasource.url=jdbc:postgresql://db:5432/nome_do_banco
spring.datasource.username=usuario_do_banco
spring.datasource.password=senha_do_banco
```
Substitua *`nome_do_banco`*, *`usuario_do_banco`* e *`senha_do_banco`* pelas informações de acesso ao seu banco de dados Postgres.

### Execução
Para executar a aplicação, utilize o comando:

```bash
docker-compose up
```
Este comando irá construir as imagens necessárias e iniciar os containers do banco de dados, backend, frontend, mock API e Haproxy.

Acesse a aplicação no endereço *`http://localhost:8081`*.

### Finalização
Para parar a execução da aplicação, utilize o comando:

```bash
docker-compose down
Este comando irá parar e remover os containers criados pela aplicação.
```

# Modelagem, Diagramas e Documentação

## Diagrama de Classes

![Diagrama de Classes](docs/diagrama_de_classes.png)

## Diagrama de Casos de Uso

![Diagrama de Casos de Uso](docs/diagrama_de_casos_de_uso.png)

## Diagrama de Sequência

![Diagrama de Sequência](docs/diagrama_de_sequencia.png)

## Diagrama de Atividades

![Diagrama de Atividades](docs/diagrama_de_atividades.png)

## Diagrama de Componentes

![Diagrama de Componentes](docs/diagrama_de_componentes.png)



