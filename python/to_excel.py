import pandas as pd
import openpyxl
import awswrangler as awr
import os

path = r"C:\Users\raphael.almeida\Documents\Projetos\Listas Comercial\sql\clientes_ativos.sql"

with open(path, 'r') as r:
    file=r.read()

df = awr.athena.read_sql_query(file, database='silver')

file_directory = r"C:\Users\raphael.almeida\Documents\Projetos\Listas Comercial\sql"
file_name = "clientes_ativos.xlsx"
file_path = os.path.join(file_directory,file_name)

df.to_excel(file_path, engine='openpyxl', index=False, sheet_name='clientes_ativos')