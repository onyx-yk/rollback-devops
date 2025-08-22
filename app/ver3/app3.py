from flask import Flask, render_template
import random

app = Flask(__name__)

@app.route('/')
def home():
    # This will cause an error - intentional bug
    undefined_variable = some_variable_that_doesnt_exist
    return render_template('index.html', version='v3')

@app.route('/generate')
def generate():
    number = random.randint(1, 100)
    return {'number': number, 'version': 'v3'}

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=False)