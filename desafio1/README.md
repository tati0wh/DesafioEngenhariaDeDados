# DESAFIO 1

A resposta de um determinado endpoint de API de ERP para uma loja de um restaurante está no arquivo ERP.json. Este exemplo corresponde a um determinado pedido (guestCheckId) com um único item (guestCheckLineItemId), referente a um único item de menu (menuItem).

1. Descreva o esquema JSON correspondente ao exemplo acima.
2. Contexto

No exemplo fornecido, o objeto detailLines contém um menuItem. Ele também pode conter instâncias de:
- discount
- serviceCharge
- tenderMedia
- errorCode

Transcreva o JSON para tabelas SQL. A implementação deve fazer sentido para operações de restaurante.

  3. Descreva a abordagem escolhida em detalhes. Justifique a escolha.

---------

## Visão Geral
Este projeto transforma o JSON de um ERP de restaurante em um banco de dados SQL estruturado. O fluxo inclui:
- Validação do JSON.
- Conversão para tabelas SQL.
- Implementação de triggers e índices.

## Estrutura do Diretório
- `data/`: Arquivos de dados fornecidos.
- `docs/`: Arquivo ERP.json e sua explicação.
- `src/`: Códigos e esquema final de SQL.
- `README.md`: Este arquivo.

## Kanban
[Acesse o Kanban no GitHub](https://github.com/users/tati0wh/projects/1/views/1)

Para mais detalhes, veja [kanban.md](https://github.com/tati0wh/DesafioEngenhariaDeDados/blob/main/desafio1/docs/kanban.md).

## Como Executar
1. Instale as dependências:
   ```bash
   pip install -r requirements.txt

