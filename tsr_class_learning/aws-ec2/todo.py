from flask import Flask, request, render_template_string
import mysql.connector

app = Flask(__name__)

@app.route('/')
def index():
    conn = mysql.connector.connect(user='admin', password='0TlOXS1F3pBWbdunnURi', host='database-1.cf9taso7hpyg.us-east-1.rds.amazonaws.com', database='todoapp')
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM tasks')
    tasks = cursor.fetchall()
    conn.close()
    return render_template_string(template, tasks=tasks)

@app.route('/add', methods=['POST'])
def add():
    task = request.form['task']
    conn = mysql.connector.connect(user='admin', password='0TlOXS1F3pBWbdunnURi', host='database-1.cf9taso7hpyg.us-east-1.rds.amazonaws.com', database='todoapp')
    cursor = conn.cursor()
    cursor.execute('INSERT INTO tasks (task) VALUES (%s)', (task,))
    conn.commit()
    conn.close()
    return '', 204

@app.route('/complete/<int:id>')
def complete(id):
    conn = mysql.connector.connect(user='admin', password='0TlOXS1F3pBWbdunnURi', host='database-1.cf9taso7hpyg.us-east-1.rds.amazonaws.com', database='todoapp')
    cursor = conn.cursor()
    cursor.execute('UPDATE tasks SET status = 1 WHERE id = %s', (id,))
    conn.commit()
    conn.close()
    return '', 204

template = '''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ToDo App</title>
</head>
<body>
    <form action="/add" method="post">
        <input type="text" name="task" required>
        <button type="submit">Add Task</button>
    </form>
    <ul>
        {% for task in tasks %}
            <li>
                {{ task[1] }}
                {% if not task[2] %}
                    <a href="/complete/{{ task[0] }}">Complete</a>
                {% endif %}
            </li>
        {% endfor %}
    </ul>
</body>
</html>
'''

if __name__ == '__main__':
    app.run(debug=True)
