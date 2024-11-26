-- 1: Tabela de Pedidos (GuestChecks)
CREATE TABLE GuestChecks (
    guestCheckId BIGINT PRIMARY KEY,                                                    -- ID único do pedido
    checkNumber INT NOT NULL,                                                           -- Número do pedido
    openBusinessDate DATE,                                                              -- Data de abertura
    openUtcTimestamp TIMESTAMP,                                                         -- Horário UTC de abertura
    openLocalTimestamp TIMESTAMP,                                                       -- Horário local de abertura
    closedBusinessDate DATE,                                                            -- Data de fechamento
    closedUtcTimestamp TIMESTAMP,                                                       -- Horário UTC de fechamento
    closedLocalTimestamp TIMESTAMP,                                                     -- Horário local de fechamento
    lastTransactionUtc TIMESTAMP,                                                       -- Última transação UTC
    lastTransactionLocal TIMESTAMP,                                                     -- Última transação local
    lastUpdatedUtc TIMESTAMP,                                                           -- Última atualização UTC
    lastUpdatedLocal TIMESTAMP,                                                         -- Última atualização local
    isClosed BOOLEAN DEFAULT FALSE,                                                     -- Indicação de fechamento do local
    guestCount INT DEFAULT 0 CHECK (guestCount >= 0),                                   -- Contagem de clientes
    subtotal DECIMAL(15,2) DEFAULT 0,                                                   -- Subtotal do pedido
    nonTaxableSalesTotal DECIMAL(15,2) DEFAULT NULL,                                    -- Total de vendas não tributáveis
    checkTotal DECIMAL(15,2) DEFAULT 0,                                                 -- Valor total do pedido
    discountTotal DECIMAL(15,2) DEFAULT 0,                                              -- Valor total do desconto
    paymentTotal DECIMAL(15,2) DEFAULT 0,                                               -- Valor total pago
    balanceDueTotal DECIMAL(15,2) DEFAULT NULL,                                         -- Saldo devedor
    revenueCenterNumber INT,                                                            -- Número do centro da receita
    operationTypeNumber INT,                                                            -- Número do tipo de operação
    tableNumber INT,                                                                    -- Número da mesa
    tableName VARCHAR(50),                                                              -- Nome da mesa
    employeeNumber INT,                                                                 -- Número do funcionário
    serviceRoundsCount INT DEFAULT 0,                                                   -- Contagem de rodadas de serviço
    checksPrintedCount INT DEFAULT 0,                                                   -- Contagem de cheques impressos
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,                                      -- Data/hora de criação
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP           -- Última atualização
);

-- Índices para otimização de consultas em GuestChecks
CREATE INDEX idx_guestChecks_checkNumber ON GuestChecks(checkNumber);
CREATE INDEX idx_guestChecks_closedUtcTimestamp ON GuestChecks(closedUtcTimestamp);

-- 2: Tabela de Impostos (CheckTaxes)
CREATE TABLE CheckTaxes (
    taxId SERIAL PRIMARY KEY,                                                           -- ID único do imposto
    guestCheckId BIGINT NOT NULL,                                                       -- Relaciona o imposto ao pedido
    taxNumber INT NOT NULL,                                                             -- Código do imposto
    taxableSalesTotal DECIMAL(15,2) DEFAULT 0,                                          -- Total de vendas tributáveis
    taxCollectedTotal DECIMAL(15,2) DEFAULT 0,                                          -- Valor arrecadado em impostos
    taxRate DECIMAL(5,3) NOT NULL,                                                      -- Taxa de imposto aplicada
    taxType INT,                                                                        -- Tipo do imposto
    FOREIGN KEY (guestCheckId) REFERENCES GuestChecks(guestCheckId),
    CHECK (taxableSalesTotal >= 0 AND taxCollectedTotal >= 0 AND taxRate >= 0)
);

-- 3: Tabela de Itens do Pedido (CheckDetailLines)
CREATE TABLE CheckDetailLines (
    detailLineId BIGINT PRIMARY KEY,                                                   -- ID único da Detail lines
    guestCheckId BIGINT,                                                               -- ID do pedido associado
    revenueCenterNumber INT,                                                           -- Número do centro de receita
    lineNumber INT,                                                                    -- Número da linha no pedido
    detailId INT,                                                                      -- ID do detail
    detailUtcTimestamp TIMESTAMP,                                                      -- Timestamp UTC do detail
    detailLocalTimestamp TIMESTAMP,                                                    -- Timestamp Local do detail
    businessDate DATE,                                                                 -- Data de operação do detail
    workstationNumber INT,                                                             -- Número do terminal de operação
    displayTotal DECIMAL(10,2),                                                        -- Total exibido
    displayQuantity INT,                                                               -- Quantidade exibida
    aggregatedTotal DECIMAL(10,2),                                                     -- Total agregado
    aggregatedQuantity INT,                                                            -- Quantidade do total agregado
    checkEmployeeId INT,                                                               -- ID do funcionário associado
    checkEmployeeNumber INT,                                                           -- Número do funcionário associado
    serviceRoundNumber INT,                                                            -- Número da rodada de serviço
    seatNumber INT,                                                                    -- Número da cadeira
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,                                     -- Data/hora de criação
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
    FOREIGN KEY (guestCheckId) REFERENCES GuestChecks(guestCheckId)
);

-- Índices para otimização de consultas em CheckDetailLines
CREATE INDEX idx_detailLines_guestCheckId ON CheckDetailLines(guestCheckId);

-- 4: Tabela de Itens de Menu (Menu Items)
CREATE TABLE MenuItems (
    menuItemId INT PRIMARY KEY,                                                        -- ID único do item de menu
    detailLineId BIGINT,                                                               -- Relacionado à linha do pedido
    modifiedFlag BOOLEAN,                                                              -- Indica se houve modificação
    includedTax DECIMAL(10,2),                                                         -- Taxa incluída
    activeTaxes INT,                                                                   -- ID de impostos ativos
    priceLevel INT,                                                                    -- Nível de preço
    FOREIGN KEY (detailLineId) REFERENCES CheckDetailLines(detailLineId)
);

-- 5: Tabela de Descontos (Discounts)
CREATE TABLE Discounts (
    discountId SERIAL PRIMARY KEY,                                                    -- ID único do desconto
    detailLineId BIGINT,                                                              -- Relação com a linha do pedido
    discountAmount DECIMAL(10,2),                                                     -- Valor do desconto
    FOREIGN KEY (detailLineId) REFERENCES CheckDetailLines(detailLineId),
    CHECK (discountAmount <= 0)                                                       -- Garante que o valor seja negativo
);

-- 6: Tabela de Taxas de Serviço (Service Charges)
CREATE TABLE ServiceCharges (
    serviceChargeId SERIAL PRIMARY KEY,                                              -- ID único da taxa de serviço
    detailLineId BIGINT,                                                             -- Relação com a line do pedido
    chargeAmount DECIMAL(10,2),                                                      -- Valor da taxa de serviço
    FOREIGN KEY (detailLineId) REFERENCES CheckDetailLines(detailLineId)
);

-- 7: Tabela de Pagamentos (Tender Media)
CREATE TABLE TenderMedia (
    tenderMediaId SERIAL PRIMARY KEY,                                                -- ID único de pagamento
    guestCheckId BIGINT,                                                             -- Relação com o pedido
    mediaTypeId INT,                                                                 -- Tipo de pagamento (relacionado à tabela MediaTypes)
    amount DECIMAL(10,2),                                                            -- Valor pago
    FOREIGN KEY (guestCheckId) REFERENCES GuestChecks(guestCheckId),
    FOREIGN KEY (mediaTypeId) REFERENCES MediaTypes(mediaTypeId)
);

-- 8: Tabela de Tipos de Pagamento (MediaTypes)
CREATE TABLE MediaTypes (
    mediaTypeId SERIAL PRIMARY KEY,                                                 -- ID único do tipo de pagamento
    mediaTypeName VARCHAR(50)                                                       -- Nome do tipo de pagamento
);

-- 9: Tabela de Erros (ErrorCodes)
CREATE TABLE ErrorCodes (
    errorCodeId SERIAL PRIMARY KEY,                                                -- ID único do registro do código de erro
    detailLineId BIGINT,                                                           -- Relacionado à linha do pedido
    errorCode INT,                                                                 -- Código do erro
    errorDescription VARCHAR(255),                                                 -- Descrição do erro (se necessário)
    errorTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,                            -- Data/hora do erro
    FOREIGN KEY (detailLineId) REFERENCES CheckDetailLines(detailLineId)
);
