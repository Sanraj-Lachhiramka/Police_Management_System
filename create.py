import streamlit as st
from database import add_data_officer, add_data_cases, add_data_complaint, add_data_complainant, \
    add_data_arrest, add_data_criminal
import datetime


def create():
    st.subheader("Add")
    Train_No = st.text_input("Train_No", key="train_no_create")
    Name = st.text_input("Name", key="train_name_create")
    Train_type = st.text_input("Train_type", key="train_type_create")
    Source = st.text_input("Source", key="source_create")
    Destination = st.text_input("Destination", key="destination_create")
    Availability = st.text_input("Availability", key="availability_create")

    if st.button("Add Train"):
        add_data(Train_No, Name, Train_type, Source, Destination, Availability)
        st.success("Train added successfully")