# Este código realiza o processamento de um arquivo JSON (nesse caso, ERP.JSON) contendo informações de um sistema de ponto de venda e o 
# transforma em tabelas SQL, gerando um script SQL automaticamente (create_tables.sql).

# Importações de bibliotecas
import json
import pandas as pd

# Carregando o JSON
# Observação: Caso o código seja executado em um ambiente diferente, ajuste o caminho do arquivo conforme necessário.
# Exemplo do caminho atual: "desafio1/data/ERP.json"
with open("desafio1/data/ERP.json", "r") as file:
    data = json.load(file)

# Processando os dados JSON e criando tabelas
# Tabela principal: GuestChecks
guest_checks = []
detail_lines = []
taxes = []
menu_items = []

for check in data["guestChecks"]:
    guest_checks.append({
        "guestCheckId": check["guestCheckId"],
        "chkNum": check["chkNum"],
        "opnBusDt": check["opnBusDt"],
        "clsdBusDt": check["clsdBusDt"],
        "subTtl": check["subTtl"],
        "chkTtl": check["chkTtl"],
        "dscTtl": check["dscTtl"],
        "empNum": check["empNum"]
    })

    # Tabela de linhas detalhadas: detailLines
    for line in check["detailLines"]:
        detail_lines.append({
            "guestCheckLineItemId": line["guestCheckLineItemId"],
            "guestCheckId": check["guestCheckId"],  # Foreign key
            "lineNum": line["lineNum"],
            "dspTtl": line["dspTtl"],
            "chkEmpId": line["chkEmpId"],
            "svcRndNum": line["svcRndNum"],
        })

        # Tabela de itens do menu: menuItems
        if "menuItem" in line:
            menu_items.append({
                "guestCheckLineItemId": line["guestCheckLineItemId"],  
                "miNum": line["menuItem"]["miNum"],
                "modFlag": line["menuItem"]["modFlag"],
                "inclTax": line["menuItem"]["inclTax"],
                "prcLvl": line["menuItem"]["prcLvl"],
            })

    # Tabela de impostos: taxes
    for tax in check["taxes"]:
        taxes.append({
            "guestCheckId": check["guestCheckId"],  # Foreign key
            "taxNum": tax["taxNum"],
            "txblSlsTtl": tax["txblSlsTtl"],
            "taxCollTtl": tax["taxCollTtl"],
            "taxRate": tax["taxRate"]
        })

# Conversão para o formato DataFrames
guest_checks_df = pd.DataFrame(guest_checks)
detail_lines_df = pd.DataFrame(detail_lines)
menu_items_df = pd.DataFrame(menu_items)
taxes_df = pd.DataFrame(taxes)

# Geração do SQL automaticamente
def dataframe_to_sql(df, table_name):
    create_table = pd.io.sql.get_schema(df, table_name)
    return create_table

# Geração dos scripts SQL
guest_checks_sql = dataframe_to_sql(guest_checks_df, "GuestChecks")
detail_lines_sql = dataframe_to_sql(detail_lines_df, "DetailLines")
menu_items_sql = dataframe_to_sql(menu_items_df, "MenuItems")
taxes_sql = dataframe_to_sql(taxes_df, "Taxes")

# Salvando no arquivo create_tables.sql
output_file = "src/json_to_sql/2-create_tables.sql"

with open(output_file, "w") as f:
    f.write("-- SQL Script para tabela GuestChecks\n")
    f.write(guest_checks_sql + ";\n\n")

    f.write("-- SQL Script para tabela DetailLines\n")
    f.write(detail_lines_sql + ";\n\n")

    f.write("-- SQL Script para tabela MenuItems\n")
    f.write(menu_items_sql + ";\n\n")

    f.write("-- SQL Script para tabela Taxes\n")
    f.write(taxes_sql + ";\n\n")

print(f"SQL script salvo em: {output_file}")
