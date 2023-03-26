import pandas as pd
from sqlalchemy import create_engine

    #Funções para criar as conexões do bd local
def conexao_transactional():
    engine_tr = create_engine("postgresql+psycopg2://postgres:password@transactional:5432/dvdrental")
    return engine_tr

def conexao_analytics():
    engine_an = create_engine("postgresql+psycopg2://postgres:password@analytics:5432/analytics")
    return engine_an

    #Query para listar as tabelas do bd Transactional

tabelas = pd.read_sql("SELECT table_name FROM information_schema.tables WHERE table_schema='public'", con=conexao_transactional())

for tabela in tabelas['table_name']:
    #Executa a query SQL com os nomes das tabelas do bd Transactional
    dados = pd.read_sql_table(tabela, con = conexao_transactional())
    #Copia para o bd Analytics as tabelas do bd Transactional
    dados.to_sql(tabela, con = conexao_analytics(), if_exists='replace', index=False)
