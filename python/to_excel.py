import pandas as pd
import openpyxl
import awswrangler as awr
import os


class Loader:

    # def __init__(self, sql, name):
    #     self.sql = sql
    #     self.name = name --não usar init pois mudará os vários nomes e querys de sql

    def load_file(self, sql, name):
                
        path = fr"C:\Users\raphael.almeida\Documents\Projetos\Listas Comercial\sql\{sql}.sql"

        with open(path, 'r') as r:
            file=r.read()

        df = awr.athena.read_sql_query(file, database='silver')

        file_directory = r"C:\Users\raphael.almeida\Documents\Projetos\Listas Comercial"
        file_name = f"{name}.xlsx"
        file_path = os.path.join(file_directory, file_name)

        df.to_excel(file_path, engine='openpyxl', index=False, sheet_name=name)

if __name__ == '__main__':
    class_instance = Loader()
    load_clients = class_instance.load_file("clientes_ativos", "clientes_ativos")
    load_clients = class_instance.load_file("clientes_ativos_pessoa", "clientes_ativos_pessoa") 