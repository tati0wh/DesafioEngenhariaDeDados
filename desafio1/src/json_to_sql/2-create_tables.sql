-- SQL Script para tabela GuestChecks
CREATE TABLE "GuestChecks" (
"guestCheckId" INTEGER,
  "chkNum" INTEGER,
  "opnBusDt" TEXT,
  "clsdBusDt" TEXT,
  "subTtl" REAL,
  "chkTtl" REAL,
  "dscTtl" INTEGER,
  "empNum" INTEGER
);

-- SQL Script para tabela DetailLines
CREATE TABLE "DetailLines" (
"guestCheckLineItemId" INTEGER,
  "guestCheckId" INTEGER,
  "lineNum" INTEGER,
  "dspTtl" REAL,
  "chkEmpId" INTEGER,
  "svcRndNum" INTEGER
);

-- SQL Script para tabela MenuItems
CREATE TABLE "MenuItems" (
"guestCheckLineItemId" INTEGER,
  "miNum" INTEGER,
  "modFlag" INTEGER,
  "inclTax" REAL,
  "prcLvl" INTEGER
);

-- SQL Script para tabela Taxes
CREATE TABLE "Taxes" (
"guestCheckId" INTEGER,
  "taxNum" INTEGER,
  "txblSlsTtl" REAL,
  "taxCollTtl" REAL,
  "taxRate" INTEGER
);

