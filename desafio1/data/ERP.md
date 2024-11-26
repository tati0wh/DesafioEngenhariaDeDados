## Nível Raiz
- curUTC: String - Data e hora atual em formato UTC (ISO 8601).
- locRef: String - Referência do local (identificador textual).
- guestChecks: Lista de objetos - Contém os registros de contas de convidados.

## Objeto guestChecks
Uma lista onde cada item representa um registro de uma conta de convidado com os seguintes campos:
- guestCheckId: Inteiro - Identificador único da conta.
chkNum: Inteiro - Número da conta.
opnBusDt: String - Data de abertura da conta (formato "AAAA-MM-DD").
opnUTC: String - Data e hora de abertura da conta em UTC (ISO 8601).
opnLcl: String - Data e hora de abertura no fuso horário local (ISO 8601).
clsdBusDt: String - Data de fechamento da conta.
clsdUTC: String - Data e hora de fechamento da conta em UTC.
clsdLcl: String - Data e hora de fechamento no horário local.
lastTransUTC: String - Data e hora da última transação da conta em UTC.
lastTransLcl: String - Data e hora da última transação no horário local.
lastUpdatedUTC: String - Data e hora da última atualização da conta em UTC.
lastUpdatedLcl: String - Data e hora da última atualização no horário local.
clsdFlag: Booleano - Indica se a conta foi fechada (true/false).
gstCnt: Inteiro - Número de convidados associados à conta.
subTtl: Decimal - Subtotal da conta (antes de impostos e descontos).
nonTxblSlsTtl: Decimal ou null - Total de vendas não tributáveis.
chkTtl: Decimal - Total da conta.
dscTtl: Decimal - Total de descontos aplicados (valores negativos).
payTtl: Decimal - Total pago.
balDueTtl: Decimal ou null - Saldo devido.
rvcNum: Inteiro - Número do local de atendimento (ponto de venda).
otNum: Inteiro - Número do terminal de origem.
ocNum: Inteiro ou null - Número da origem do cliente.
tblNum: Inteiro - Número da mesa associada à conta.
tblName: String - Nome ou identificação textual da mesa.
empNum: Inteiro - Identificador do funcionário responsável.
numSrvcRd: Inteiro - Número de rodadas de serviço realizadas.
numChkPrntd: Inteiro - Número de vezes que a conta foi impressa.
Subobjeto taxes
Lista de objetos que representam os detalhes de impostos aplicados à conta:

taxNum: Inteiro - Identificador do imposto.
txblSlsTtl: Decimal - Total de vendas tributáveis.
taxCollTtl: Decimal - Total de impostos coletados.
taxRate: Decimal - Taxa de imposto aplicada.
type: Inteiro - Tipo de imposto.
Subobjeto detailLines
Lista de objetos representando os itens detalhados na conta:

guestCheckLineItemId: Inteiro - Identificador único do item da linha.
rvcNum: Inteiro - Número do local de atendimento.
dtlOtNum: Inteiro - Número do terminal associado ao item.
dtlOcNum: Inteiro ou null - Origem do cliente para o item.
lineNum: Inteiro - Número da linha do item na conta.
dtlId: Inteiro - Identificador do detalhe do item.
detailUTC: String - Data e hora do detalhe em UTC.
detailLcl: String - Data e hora no horário local.
lastUpdateUTC: String - Última atualização em UTC.
lastUpdateLcl: String - Última atualização no horário local.
busDt: String - Data comercial associada ao detalhe.
wsNum: Inteiro - Número da estação de trabalho.
dspTtl: Decimal - Total exibido para o item.
dspQty: Decimal - Quantidade exibida.
aggTtl: Decimal - Total agregado para o item.
aggQty: Decimal - Quantidade agregada.
chkEmpId: Inteiro - Identificador do funcionário associado.
chkEmpNum: Inteiro - Número do funcionário associado.
svcRndNum: Inteiro - Número da rodada de serviço.
seatNum: Inteiro - Número do assento associado ao item.
Subobjeto menuItem
Representa o item do menu associado ao detalhe da linha:

miNum: Inteiro - Número do item do menu.
modFlag: Booleano - Indica se houve modificação no item.
inclTax: Decimal - Imposto incluído no item.
activeTaxes: String - Identificadores dos impostos ativos para o item.
prcLvl: Inteiro - Nível de preço aplicado ao item.
