from flask import (Flask,
                   __version__ as flask_version)
app = Flask(__name__)


@app.route('/')
def index():
  return 'Flask version {} installed.'.format(flask_version)
