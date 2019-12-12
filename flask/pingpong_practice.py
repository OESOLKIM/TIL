from flask import Flask
from flask import request
from flask import render_template
import random
app = Flask(__name__)

@app.route('/ping1')
def ping1():
    return render_template('ping1.html')

@app.route('/pong1')
def pong1():
    name = request.args.get('name')
    feature = ['외모','실력','인기','재력']
    y_feature = random.sample(feature, 2)
    return render_template('pong1.html', name=name, message=y_feature)

if __name__ == '__main__':
    app.run(debug=True)