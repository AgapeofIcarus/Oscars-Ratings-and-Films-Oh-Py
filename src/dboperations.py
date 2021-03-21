#dependencies
import sqlalchemy
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine, inspect
import psycopg2

import pandas as pd

from config import conn_str    

def connect2db(conn_str):
    try:
        engine = create_engine(f"postgresql://{conn_str}" )
        conn = engine.connect()   
    except(Exception) as error:
        print(error)
        #sys.exit(1)
    print("Connection Succesful")
    
    return conn


def insertvalues(conn, table, values):
    
    try:
        values.to_sql(name = table, con = conn, if_exists = 'append', index = False)
    except Exception as error:
        print("Error While Insert Data: " + error)
    print("Values Succesfully Insert To " + table)