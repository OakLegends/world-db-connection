import mysql.connector

#2.1 start import tkinter
import tkinter

#2.1 end

#1 start connect
DB_CONFIG = {
    'host': "Localhost",
    'user': "root",
    'password': "IkBenZeerKazig02062009!",
    'database': "world"
}
def get_connection():
    conn = mysql.connector.connect(**DB_CONFIG)
    cursor = conn.cursor()
    return conn, cursor
#1 end start connect

#2.2 start tkinter venster
window = tkinter.Tk()
#2.2 end

listb_landen = tkinter.Listbox(window)
listb_landen.pack(padx=100, pady=100)

#2.3 listbox add alle landen
def voeg_landen_toe():
    conn, cursor = get_connection()
    query = 'select * from Country;'
    cursor.execute(query)
    results = cursor.fetchall()
    for i in results:
        listb_landen.insert(tkinter.END, str(i))

voeg_landen_toe()
window.mainloop()