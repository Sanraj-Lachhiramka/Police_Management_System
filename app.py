# Importing pakages
#pip3 install mysql-connector-python
import streamlit as st
import mysql.connector
import pandas as pd
import datetime

from create import create
from database import create_tables
from delete import delete
from read import read
from update import update

# mydb = mysql.connector.connect(
#     host="localhost",
#     user="root",
#     password="password",
# )
# c = mydb.cursor()
# c.execute("CREATE DATABASE Police_Management_System1")

st.title("Police Management System Dashboard")
menu = ["Add", "View", "Edit", "Remove"]
choice = st.sidebar.selectbox("Menu", menu)


create_tables()
if choice == "Add":
    st.subheader("Add data")
    create()

elif choice == "View":
    st.subheader("View data")
    read()

elif choice == "Edit":
    st.subheader("Update")
    update()

elif choice == "Remove":
    st.subheader("Delete")
    delete()

else:
    st.subheader("About tasks")
