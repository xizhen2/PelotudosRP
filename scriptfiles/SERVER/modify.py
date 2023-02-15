import sqlite3

db = 'InfinityZone.db'

cnx = sqlite3.connect(db)
cursor = cnx.cursor()

print('Borrando la tabla CUENTAS')
cursor.execute('DELETE FROM CUENTA')
cnx.commit()
cnx.close()