import sqlite3
from sqlite3 import OperationalError

import plotly as py
import plotly.graph_objs as go

from scipy import stats

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

xs = []
ys = []
for points in query:
    xs.append(points[0])
    ys.append(points[1])

slope, intercept, r_value, p_value, std_err = stats.linregress(xs,ys)
line = []
for xvalue in xs:
    line.append(slope*xvalue+intercept)

trace = go.Scatter(
    x = xs,
    y = ys,
    mode = 'markers'
    )

trace2 = go.Scatter(
                  x=xs,
                  y=line,
                  mode='lines',
                  marker=go.Marker(color='red'),
                  name='Fit'
                  )
print("Standard Error:")
print (std_err)
data = [trace, trace2]

py.offline.plot(data, filename='basic-scatter.html')

c.close()
conn.close()
