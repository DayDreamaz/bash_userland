from flask import Flask

app = Flask(__name__)

team = "Timis and ??? project"


@app.route('/logs/')
def index():
    return "Hello, DevOps team- "


if __name__ == "__main__":
    app.run(debug=True)
