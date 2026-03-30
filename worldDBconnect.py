import mysql.connector
#1 start connect
DB_CONFIG = {
    'host': "Localhost",
    'user': "root",
    'password': "IkBenZeerKazig02062009!",
    'database': "world"
}

conn = mysql.connector.connect(**DB_CONFIG)
if conn.is_connected():
    print('good boy')
else:
    print('bad boy')
#1 end start connect

#2 start Landenweergeven in Tkinter
