import sqlite3
from sqlite3 import OperationalError

import plotly as py
import plotly.graph_objs as go

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


result = c.execute('''SELECT athlete_weight_kg, athlete_height_cm FROM athletes
                    WHERE athlete_gender = 'F'
''')
query = result.fetchall() 
print(query)

xs = []
ys = []
for points in query:
    xs.append(points[0])
    ys.append(points[1])
print(xs)

trace = go.Scatter(
    x = xs,
    y = ys,
    mode = 'markers'
    )

data = [trace]

py.offline.plot(data, filename='basic-scatter.html')

c.close()
conn.close()
