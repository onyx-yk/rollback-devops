from flask import Flask, render_template, request, jsonify
import random

app = Flask(__name__)

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/generate')
def generate():
    gen_type = request.args.get('type', 'number')
    if gen_type == 'number':
        result = random.randint(1, 100)
    elif gen_type == 'dice':
        result = random.randint(1, 6)
    elif gen_type == 'coin':
        result = random.choice(['heads', 'tails'])
    return {'result': result, 'version': 'v2'}

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)  