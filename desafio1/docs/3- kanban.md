# Kanban - Fluxo de Atividades do Projeto
Este documento descreve as etapas realizadas durante o desenvolvimento do projeto, organizadas de acordo com o fluxo lógico adotado. As atividades foram divididas em Planejamento, Execução e Finalização, refletindo o progresso do trabalho.

## Planejamento
- Análise e esquematização do arquivo ERP.json
  - Foi realizada a análise do exemplo fornecido no arquivo ERP.json para compreender sua estrutura.
  - Os principais elementos identificados foram: guestCheckId, guestCheckLineItemId e detailLines, que podem conter diferentes tipos de objetos (menuItem, discount, etc.).
- Planejamento do pipeline de transformação JSON → SQL
  - Foi estruturado um pipeline dividido em três etapas principais:
    - 1 -Transformação do JSON em um esquema SQL intermediário.
    - 2- Geração de scripts automáticos para criação de tabelas no banco de dados.
    - 3- Refinamento e customização do esquema SQL final.
- Estruturação inicial do repositório no GitHub
  - Foi criada a estrutura inicial do repositório, com os seguintes diretórios:
    - docs/ para documentação do projeto.
    - src/json_to_sql/ para o código e scripts SQL.
    - data/ para o arquivo ERP.json e sua explicação.
    - Arquivo README.md para centralizar as informações iniciais.

## Execução
- Desenvolvimento do código de transformação JSON → SQL (1-transform.py)
  - Foi criado o script responsável por transformar o JSON em um esquema relacional SQL.
  - O código analisa a estrutura do ERP.json e gera automaticamente tabelas SQL baseadas nos dados fornecidos.
- Geração das tabelas SQL automaticamente (2-create_tables.sql)
  - A partir do script 1-transform.py, foram gerados os scripts SQL para a criação de tabelas no banco de dados.
- Criação do esquema final da tabela SQL (3-final_schema.sql)
  - As tabelas SQL geradas automaticamente foram refinadas, com ajustes para otimizar o modelo relacional e adequá-lo às operações de um restaurante.
  - Foram adicionadas chaves primárias, relações entre tabelas e índices.
- Conversão do esquema final SQL para JSON
  - O esquema SQL refinado foi convertido para o formato JSON e documentado no arquivo final_schema.json.

## Finalização
- Revisão dos códigos: 1-transform.py, 2-create_tables.sql, 3-final_schema.sql
  - Os códigos foram revisados para garantir a consistência e funcionalidade do pipeline JSON → SQL.
  - Ajustes finais foram realizados para assegurar a performance e a clareza da implementação.
- Criação da documentação inicial no README.md
  - Foi escrito o documento inicial de apresentação do projeto, contendo descrição, estrutura do repositório e instruções básicas de uso.
- Elaboração da documentação de ERP.json (data/ERP.md)
  - Foi detalhado o formato do arquivo ERP.json, explicando os campos principais e fornecendo exemplos para auxiliar na compreensão.
- Atualização do README.md com informações finais
  - O arquivo foi complementado com instruções detalhadas sobre o pipeline, as tabelas SQL geradas e a finalidade de cada arquivo no repositório.
- Elaboração do kanban.md e sua inclusão no repositório
  - Este documento foi criado para descrever o fluxo de atividades e organizar as etapas realizadas.
- Criação do documento sql_tables_final_schema.md
  - Foi detalhado as explicações do esquema final das tabelas
  - Foi criado utilizando como base o arquivo create_tables.sql com ajustes e adições de instâncias.

# Conclusão
Com a conclusão de todas as tarefas acima, o projeto foi entregue com um pipeline funcional e modular para transformar dados JSON em tabelas SQL. A estrutura do repositório foi organizada de forma clara, possibilitando fácil manutenção e evolução futura.


