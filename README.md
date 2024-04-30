# Desafio backend - Just Travel

#### Requisitos:
  * Elixir 1.14 ou superior
  * Erlang 23.0 ou superior
  * Phoenix Ultima versão
  * PostgreSQL 16

## Descrição do projeto
 `Projeto de um carrinho de Ecommerce feito com Mix, Phoenix Framework e Elixir.`

### Avisos:
  * Utilize o arquivo `config/dev.exs` para configurar o banco de dados. Altere o username e password para o seu usuário e senha do PostgreSQL.

### Para inciar o servidor do Phoenix e testar a API:
  * Navegue ate a pasta do projeto.
  * Instale as depêndencias executando o comando `mix deps.get` no terminal.
  * Utilize `mix ecto.setup` para criar o banco de dados e rodar as migrations.
  * Execute o comando `mix setup` para instalar e configurar as dependências adicionais.
  * Inicie o servidor Phoenix com `mix phx.server` ou dentro do IEx com `iex -S mix phx.server`
  
## TESTES:
  * Para rodar os testes unitários, certifique-se que já possui todas as dependências instaladas e execute o comando `mix test` no terminal dentro da pasta do projeto.

### Como usar:
  * Para testar a API manualmente, abra [`localhost:4000/items`](http://localhost:4000/items) no seu navegador.

### Referências e documentação:
  * [Phoenix Framework](https://www.phoenixframework.org/)
  * [Elixir](https://elixir-lang.org/)
  * [Erlang](https://www.erlang.org/)
  * [PostgreSQL](https://www.postgresql.org/)
  * [Ecto](https://hexdocs.pm/ecto/Ecto.html)


