from flask import Flask, render_template
import random

app = Flask(__name__)

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/generate')
def generate():
    number = random.randint(1, 100)
    return {'number': number, 'version': 'v1'}

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)  