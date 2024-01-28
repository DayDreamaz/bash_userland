from flask import Flask

app = Flask(__name__)


@app.route('/me/')
def index():
    return "Hello, DevOps team- "


if __name__ == "__main__":
    app.run(debug=True)

