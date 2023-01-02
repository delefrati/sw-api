# README

Esta é a documentação da API. Para facilitar a execução, a API foi _dockerizada_, ou seja, foi colocada de um Docker. 

## Rodando via Docker Compose

### Executando via docker

Instale o [Docker Compose](https://docs.docker.com/compose/) e execute o comando:
```docker compose up```

Aguarde baixar e instalar todas as dependências, o serviço estará disponível na porta 3000 do localhost.

### Resetando o banco de dados

```docker exec -t sw-api-web-1 rake db:drop db:create db:migrate && rake db:seed```

## Rodando os testes

```docker exec -t sw-api-web-1 rspec spec```

A cobertura dos testes será gerada na pasta `/coverage`

## Rotas da API

* GET para http://localhost:3000/planets - retorna um JSON com todos os planetas

* GET para http://localhost:3000/planets/1 - retorna o planeta com id 1

* GET para http://localhost:3000/planets/?search=texto - retorna planetas que tenham _texto_ no nome

* DELETE para http://localhost:3000/planets/1 - remove o planeta com id 1



