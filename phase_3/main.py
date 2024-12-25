import flask
from flask import request, jsonify,render_template


app = flask.Flask(__name__)


@app.route("/")
def home():
    return render_template('index.html')

@app.route("/register")
def register():
    return render_template('register.html')


if __name__ == "__main__":
    app.run(debug=True)