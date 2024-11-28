# DESAFIO 2

Nossa equipe de inteligência de negócios precisa analisar a receita de todas as lojas de uma rede de restaurantes. Essas informações podem ser obtidas por meio de 5 endpoints de API.

![image](https://github.com/user-attachments/assets/ad745081-0110-4f8a-a6e0-da67ac5bcb75)

storeId corresponde ao identificador da loja.
busDt corresponde à data de operação.

Tarefa: Esta é uma continuação do primeiro desafio. Você deve armazenar os dados das respostas das APIs (JSON) no nosso data lake.

1. Por que armazenar as respostas das APIs?
2. Como você armazenaria os dados? Crie uma estrutura de pastas capaz de armazenar as respostas da API. Ela deve permitir manipulações, verificações,
buscas e pesquisas rápidas.
3. Considere que a resposta do endpoint getGuestChecks foi alterada, por exemplo, guestChecks.taxes foi renomeado para guestChecks.taxation. O que isso
implicaria?

---
## Visão Geral
Este projeto visa armazenar e organizar as respostas de APIs relacionadas à análise de receita de uma rede de restaurantes em um **data lake** estruturado. O fluxo inclui:
- Armazenamento das respostas das APIs em formato JSON.
- Organização das respostas em uma estrutura de pastas lógica e eficiente.
- Preparação para manipulação e análise posterior, incluindo versionamento e transformação de dados em caso de mudanças nos endpoints.

## Estrutura do Diretório
- `data_lake_CB/`: Diretório principal do data lake com as subpastas organizadas por tipo de dados e endpoints.
  - **bi/**: Dados de inteligência de negócios.
    - **getFiscalInvoice/**: Respostas relacionadas a notas fiscais.
    - **getGuestChecks/**: Respostas relacionadas a registros de vendas.
    - **getChargeBack/**: Respostas relacionadas a chargebacks.
  - **res/**: Dados relacionados a transações.
    - **getTransactions/**: Respostas com detalhes de transações.
  - **inv/**: Dados financeiros.
    - **getCashManagementDetails/**: Respostas com detalhes de gestão de caixa.
      
- `documentation/`: Arquivos com as respostas específicas para cada questão.
- `README.md`: Este arquivo, com visão geral do projeto.

## Kanban
[Acesse o Kanban no GitHub](https://github.com/users/tati0wh/projects/2/views/1)

Para mais detalhes sobre o fluxo e tarefas, veja [kanban.md](https://github.com/tati0wh/DesafioEngenhariaDeDados/blob/main/desafio2/kanban.md).
