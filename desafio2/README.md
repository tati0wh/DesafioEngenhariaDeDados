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
## Visão geral
Este repositório contém o desenvolvimento do Desafio 2 relacionado à integração e análise de dados provenientes de múltiplos endpoints de API. O objetivo principal é coletar, armazenar e organizar as respostas das APIs em um Data Lake, garantindo que os dados estejam disponíveis para futuras análises de inteligência de negócios (BI).

Estrutura do Repositório
1. documentation/
Contém arquivos detalhando o desafio e a estrutura dos dados:

- desafio2-1.md: Justifica a importância de armazenar respostas das APIs e fornece exemplos detalhados.
- desafio2-2.txt: Descreve a estrutura de pastas proposta para o Data Lake.
- desafio2-3.md: Analisa os impactos de alterações nos formatos de resposta das APIs.
- endpoints-API.json: Arquivo JSON contendo informações detalhadas sobre os endpoints usados no desafio, criado a partir da tabela fornecida.

  Os endpoints são compostos por:
  - `data_lake_CB/`: Diretório principal do data lake com as subpastas organizadas por tipo de dados e endpoints.
    - **bi/**: Dados de inteligência de negócios.
    - **getFiscalInvoice/**: Respostas relacionadas a notas fiscais.
    - **getGuestChecks/**: Respostas relacionadas a registros de vendas.
    - **getChargeBack/**: Respostas relacionadas a chargebacks.
  - **res/**: Dados relacionados a transações.
    - **getTransactions/**: Respostas com detalhes de transações.
  - **inv/**: Dados financeiros.
    - **getCashManagementDetails/**: Respostas com detalhes de gestão de caixa. 

2. kanban.md
Arquivo que detalha a gestão do projeto por meio de um Kanban, incluindo tarefas concluídas, em andamento e futuras.

3. README.md
O documento que você está lendo agora! Contém uma visão geral do projeto e informações para ajudar colaboradores e usuários a entenderem o contexto e propósito do repositório.

Objetivos do Projeto
Integração de Dados: Consome múltiplos endpoints de API relacionados a operações financeiras e comerciais de uma rede de restaurantes.
Armazenamento Estruturado: Organiza as respostas das APIs em um Data Lake com uma estrutura que facilita manipulações e buscas.
Flexibilidade e Manutenção: Prepara o sistema para mudanças futuras nos formatos de resposta das APIs, garantindo resiliência.


## Kanban
[Acesse o Kanban no GitHub](https://github.com/users/tati0wh/projects/2/views/1)

Para mais detalhes sobre o fluxo e tarefas, veja [kanban.md](https://github.com/tati0wh/DesafioEngenhariaDeDados/blob/main/desafio2/kanban.md).
