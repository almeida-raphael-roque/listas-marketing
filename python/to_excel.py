import pandas as pd
import openpyxl
import awswrangler as awr
import os
import win32com.client as win32
import locale

class Loader:

    # def __init__(self, sql, name):
    #     self.sql = sql
    #     self.name = name --não usar init pois mudará os vários nomes e querys de sql

    def load_file(self, sql, name):
                
        path = fr"C:\Users\raphael.almeida\Documents\Projetos\Listas Marketing\sql\{sql}.sql"

        with open(path, 'r') as r:
            file=r.read()

        df = awr.athena.read_sql_query(file, database='silver')

        file_directory = r"C:\Users\raphael.almeida\Documents\Projetos\Listas Marketing"
        file_name = f"{name}.xlsx"
        file_path = os.path.join(file_directory, file_name)

        df.to_excel(file_path, engine='openpyxl', index=False, sheet_name=name)
    
    def send_outlook(self):
        #definindo o mês atual    
        locale.setlocale(locale.LC_ALL, 'pt_BR.UTF-8')
        today = pd.Timestamp.today()
        actual_month = today.strftime('%B').upper()

        outlook = win32.Dispatch("Outlook.Application")
        email = outlook.CreateItem(0)

        files_to_attach = [
            "clientes_ativos.xlsx",
            "clientes_ativos_pessoa.xlsx",
            "clientes_frota.xlsx",
            "clientes_produtos.xlsx"
        ]

        # Anexando os arquivos
        for file in files_to_attach:
            file_path = os.path.join(r"C:\Users\raphael.almeida\Documents\Projetos\Listas Marketing", file)
            if os.path.exists(file_path):
                email.Attachments.Add(file_path)

        email.To = "dados13@grupounus.com.br; marketing06@transdesk.com.br; dados03@grupounus.com.br"
        email.Subject = f"[INFORMAÇÕES MENSAIS DE CLIENTES ATIVOS] - {actual_month}" 
        email.HTMLBody = f"""
                    <html>
                    <body>
                        <p>Prezado(a),</p>
                        <p>Seguem anexas as tabelas informativas de clientes ativos das 3 empresas (Segtruck, Stcoop e Viavante).</p>
                        <p>Elas se dividem em:</p>
                        <p>- (1) clientes ativos;</p>
                        <p>- (2) clientes ativos com informação de pessoa (física ou jurídica);</p>
                        <p>- (3) clientes ativos que possuem mais de 3 placas associadas à correspondente matrícula;</p>
                        <p>- (4) clientes ativos que adquiriram mais de um produto (benefício) diferente.</p>

                        <p>Atenciosamente,</p>
                        <p>Equipe Análise de Dados - Grupo Unus</p>
                        <p><i>Este é um e-mail automático, por favor não responda</i></p>
                    </body>
                    </html>
                """
        email.Send()
        print("Email enviado com sucesso!")


if __name__ == '__main__':
    class_instance = Loader()
    load_clients = class_instance.load_file("clientes_ativos", "clientes_ativos")
    load_clients = class_instance.load_file("clientes_ativos_pessoa", "clientes_ativos_pessoa") 
    load_clients = class_instance.load_file("clientes_frota", "clientes_frota")
    load_clients = class_instance.load_file("clientes_produtos", "clientes_produtos")  
    send_email = class_instance.send_outlook()