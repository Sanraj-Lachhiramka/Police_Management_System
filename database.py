import mysql.connector
import datetime

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="password",
    database="Police_Management_System1"
)
c = mydb.cursor()

def create_tables():
    c.execute('CREATE TABLE IF NOT EXISTS OFFICER(OfficerId VARCHAR(20) NOT NULL, FirstName TEXT, LastName TEXT, Ranking TEXT, Department TEXT, Phone TEXT, Address TEXT, BloodGrp TEXT, PRIMARY KEY(OfficerId));'
              'CREATE TABLE IF NOT EXISTS CASES(CaseId VARCHAR(20) NOT NULL, Name TEXT, DOC DATE, TOC TIME, Location TEXT, CRIME TEXT, OfficerId VARCHAR(20), PRIMARY KEY(CaseId), FOREIGN KEY(OfficerId) REFERENCES OFFICER(OfficerId))'
              'CREATE TABLE IF NOT EXISTS COMPLAINT(ComplaintId VARCHAR(20) NOT NULL, Type TEXT, Complainant TEXT, DOC DATE, Solved TEXT, CaseId VARCHAR(20), OfficerId VARCHAR(20),PRIMARY KEY(ComplaintId), FOREIGN KEY(CaseId) REFERENCES CASES(CaseId), FOREIGN KEY(OfficerId) REFERENCES OFFICER(OfficerId))'
              'CREATE TABLE IF NOT EXISTS COMPLAINANT(ComplainantId VARCHAR(20) NOT NULL, Name TEXT, Phone TEXT, Address TEXT, ComplaintId VARCHAR(20), RelationToVictim TEXT,PRIMARY KEY(ComplainantId), FOREIGN KEY(ComplaintId) REFERENCES COMPLAINT(ComplaintId))'
              'CREATE TABLE IF NOT EXISTS CRIMINAL(CriminalId VARCHAR(20) NOT NULL, Name TEXT, JailTerm TEXT, CaseId VARCHAR(20),PRIMARY KEY(CriminalId), FOREIGN KEY(CaseId) REFERENCES CASES(CaseId))'
              'CREATE TABLE IF NOT EXISTS ARREST(ArrestId VARCHAR(20) NOT NULL, DOC DATE, Location TEXT, CellNo TEXT, OfficerId VARCHAR(20), CriminalId VARCHAR(20), PRIMARY KEY(ArrestId), FOREIGN KEY(OfficerId) REFERENCES OFFICER(OfficerId), FOREIGN KEY(CriminalId) REFERENCES CRIMINAL(CriminalId))')


#add
def add_data_officer(Id, FirstName, LastName, Ranking, Department, Phone, Address, BloodGrp):
    c.execute('INSERT INTO OFFICER(Id, FirstName, LastName, Ranking, Department, Phone, Address, BloodGrp) VALUES (%s,%s,%s,%s,%s,%s,%s,%s)', (Id, FirstName, LastName, Ranking, Department, Phone, Address, BloodGrp))
    mydb.commit()

def add_data_cases(CaseId, Name, DOC, TOC, Location, CRIME, OfficerId):
    c.execute('INSERT INTO CASES(CaseId, Name, DOC, TOC, Location, CRIME, OfficerId) VALUES (%s,%s,%s,%s,%s,%s,%s)', (CaseId, Name, DOC, TOC, Location, CRIME, OfficerId))
    mydb.commit()

def add_data_complaint(ComplaintId, Type, Complainant , DOC, Solved, CaseId, OfficerId):
    c.execute('INSERT INTO COMPLAINT(ComplaintId, Type, Complainant , DOC, Solved, CaseId, OfficerId) VALUES (%s,%s,%s,%s,%s,%s,%s)', (ComplaintId, Type, Complainant, DOC, Solved, CaseId, OfficerId))
    mydb.commit()

def add_data_complainant(ComplainantId, Name, Phone, Address, ComplaintId, RelationToVictim):
    c.execute('INSERT INTO COMPLAINANT(ComplainantId, Name, Phone, Address, ComplaintId, RelationToVictim) VALUES (%s,%s,%s,%s,%s,%s)', (ComplainantId, Name, Phone, Address, ComplaintId, RelationToVictim))
    mydb.commit()

def add_data_arrest(ArrestId, DOC, Location, CellNo, OfficerId, CriminalId):
    c.execute('INSERT INTO ARREST(ArrestId, DOC, Location, CellNo, OfficerId, CriminalId) VALUES (%s,%s,%s,%s,%s,%s)', (ArrestId, DOC, Location, CellNo, OfficerId, CriminalId))
    mydb.commit()

def add_data_criminal(CriminalId, Name, JailTerm, CaseId):
    c.execute('INSERT INTO CRIMINAL(CriminalId, Name, JailTerm, CaseId) VALUES (%s,%s,%s,%s)', (CriminalId, Name, JailTerm, CaseId))
    mydb.commit()


#view
def view_data_officer():
    c.execute('SELECT * FROM OFFICER')
    data = c.fetchall()
    return data

def view_data_case():
    c.execute('SELECT * FROM CASES')
    data = c.fetchall()
    return data

def view_data_complaint():
    c.execute('SELECT * FROM COMPLAINT')
    data = c.fetchall()
    return data

def view_data_complaninant():
    c.execute('SELECT * FROM COMPALINANT')
    data = c.fetchall()
    return data

def view_data_arrest():
    c.execute('SELECT * FROM ARREST')
    data = c.fetchall()
    return data

def view_data_criminal():
    c.execute('SELECT * FROM CRIMINAL')
    data = c.fetchall()
    return data

#update
#delete