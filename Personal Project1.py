import sqlite3
from sqlite3 import OperationalError

conn = sqlite3.connect(":memory:")
c = conn.cursor()

fd = open('sqldb.sql', 'r')
sqlFile = fd.read()
fd.close()

cv = sqlFile.split(';')
for cmd in cv:
    try:
        c.execute(cmd)
    except (OperationalError, msg):
        print("Command skipped: ", msg)


result = c.execute('''SELECT athlete_name, times FROM results, athletes
                      WHERE athletes.athlete_id = results.athlete_id
                        AND heat = 1
                        AND event_id = 3
                        AND round_id = 4
                        AND times !=
                        (SELECT max(times) FROM results, athletes
                        WHERE athletes.athlete_id = results.athlete_id AND heat = 1 AND event_id = 3 AND round_id = 4)
                        ORDER BY times ASC''')
countries = result.fetchall() 
print(countries)

c.close()
conn.close()
