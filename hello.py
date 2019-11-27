from flask import Flask, escape, request

app = Flask(__name__)

@app.route('/')
def hello():
    name = request.args.get("name", "Udacity... This is Rajat")
    return f'Hello, {escape(name)}!'

app.run(host='0.0.0.0', port=80)