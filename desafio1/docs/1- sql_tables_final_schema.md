# Esquema Final do Banco de Dados 
Este documento descreve o esquema final do banco de dados criado para o ERP de restaurante. São apresentadas as justificativas para as escolhas de design, realizadas com o objetivo de garantir eficiência, integridade e clareza dos dados.

1. Tabela de Pedidos (GuestChecks)
- guestCheckId (BIGINT PRIMARY KEY): Utilizou-se BIGINT como chave primária para suportar um alto volume de pedidos ao longo do tempo, garantindo unicidade.
- Campos de datas e horários (openBusinessDate, openUtcTimestamp, etc.): A inclusão de horários locais e em UTC foi necessária para lidar com operações em diferentes fusos horários e permitir relatórios globais.
- Campos financeiros (subtotal, checkTotal, etc.): Valores monetários foram definidos como DECIMAL(15,2) para assegurar precisão nos cálculos financeiros.
- guestCount (INT com CHECK): A restrição garante que a contagem de clientes seja sempre maior ou igual a 0, preservando a integridade lógica.
- Índices: Índices foram adicionados nos campos checkNumber e closedUtcTimestamp, que são frequentemente utilizados em relatórios e buscas, para otimizar a performance das consultas.

2. Tabela de Impostos (CheckTaxes)
- taxId (SERIAL PRIMARY KEY): Uma chave primária serial foi escolhida para simplificar a geração de IDs únicos.
- Chave estrangeira (guestCheckId): Garante o vínculo entre pedidos e impostos associados.
- Restrições CHECK: Valida que valores de vendas tributáveis e impostos arrecadados sejam não negativos e que a taxa aplicada seja válida.
- Taxa decimal (DECIMAL(5,3)): Utilizou-se essa precisão para representar taxas como 7.125%, comuns em cálculos tributários.

3. Tabela de Itens do Pedido (CheckDetailLines)
- detailLineId (BIGINT PRIMARY KEY): O identificador único foi definido como BIGINT, permitindo rastrear linhas de detalhe individualmente.
- Campos de agregação (aggregatedTotal, aggregatedQuantity): Facilitam análises detalhadas de vendas agregadas.
- Referência ao pedido (guestCheckId): Relaciona os itens do pedido diretamente à tabela de pedidos, mantendo a integridade referencial.
- Índices: Um índice foi criado no campo guestCheckId para melhorar a eficiência das consultas relacionadas a detalhes de pedidos.

4. Tabela de Itens de Menu (MenuItems)
- detailLineId como FK: Relaciona os itens de menu às linhas de detalhe do pedido, garantindo rastreabilidade.
- Campos adicionais (modifiedFlag, activeTaxes): Foram incluídos para rastrear modificações em itens de menu e associar impostos aplicáveis, respectivamente.

5. Tabela de Descontos (Discounts)
- discountAmount com CHECK: Foi estabelecida uma restrição para garantir que os valores de desconto sejam sempre negativos, preservando a semântica da tabela.
- Chave estrangeira (detailLineId): Cada desconto está relacionado diretamente a uma linha de pedido específica.

6. Tabela de Taxas de Serviço (ServiceCharges)
- Semântica separada: Optou-se por uma tabela distinta para diferenciar taxas de serviço de descontos, reforçando a clareza funcional do banco.
- Chave estrangeira (detailLineId): Relaciona cada taxa de serviço a um detalhe de pedido específico.

7. Tabela de Pagamentos (TenderMedia)
- Relacionamento com tipos de pagamento (MediaTypes): Foi criada uma relação com a tabela MediaTypes para centralizar os métodos de pagamento.
- Campos financeiros (amount): Valores pagos foram definidos como DECIMAL(10,2) para garantir precisão e compatibilidade com diferentes moedas.

8. Tabela de Tipos de Pagamento (MediaTypes)
A tabela MediaTypes foi adicionada ao esquema como uma melhoria em relação ao design original para padronizar os métodos de pagamento utilizados no sistema. Essa centralização permite:
- Consistência nos dados: Métodos de pagamento como "Cartão de Crédito" ou "Dinheiro" são padronizados, reduzindo redundâncias e erros.
- Facilidade de manutenção: Alterações ou adições de novos tipos de pagamento podem ser feitas diretamente na tabela, sem impactar outras partes do sistema.
- Flexibilidade para integração: A estrutura facilita futuras integrações com sistemas de pagamento ou relatórios detalhados sobre os métodos utilizados.
Essa escolha foi essencial para melhorar a escalabilidade do banco e garantir que os métodos de pagamento fossem tratados de forma uniforme.

9. Tabela de Erros (ErrorCodes)
- Rastreabilidade de erros: A inclusão desta tabela permite rastrear problemas específicos associados às linhas de detalhe do pedido.
- Descrição opcional (errorDescription): Adicionou-se esse campo para fornecer informações detalhadas sobre os erros, caso necessário.
- Timestamp (errorTimestamp): Incluído para documentar quando os erros ocorreram, facilitando auditorias e diagnósticos.

## Considerações Gerais
Principais decisões:
- Normalização: A criação de tabelas separadas, como MenuItems e MediaTypes, reduz redundâncias e organiza melhor os dados.
- Integridade referencial: O uso de chaves estrangeiras e restrições CHECK assegura a consistência dos dados.
- Otimização de consultas: Índices foram cuidadosamente adicionados em colunas-chave para melhorar a performance das operações de leitura.
- Precisão financeira: Valores monetários foram armazenados com alta precisão (DECIMAL), essencial em sistemas de ERP.
O esquema foi projetado com foco em escalabilidade, consistência e eficiência, estando pronto para implementação no ambiente de produção.


