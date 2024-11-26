DESAFIO 1

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

# Desafio 1: ERP → SQL

## Visão Geral
Este projeto transforma o JSON de um ERP de restaurante em um banco de dados SQL estruturado. O fluxo inclui:
- Validação do JSON.
- Conversão para tabelas SQL.
- Implementação de triggers e índices.
- Testes automatizados para garantir a integridade dos dados e operações.

## Estrutura do Diretório
- `docs/`: Documentação e esquemas.
- `src/`: Código principal, incluindo transformação JSON → SQL e cliente API.
- `tests/`: Testes automatizados.
- `data/`: Arquivos de dados fornecidos.
- `README.md`: Este arquivo.
- `kanban.md`: Kanban textual para organização do projeto.

## Kanban
![Kanban](docs/kanban_board.png)

Para mais detalhes, veja [kanban.md](kanban.md).

## Como Executar
1. Instale as dependências:
   ```bash
   pip install -r requirements.txt

