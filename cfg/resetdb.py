#! /usr/bin/python
import os
from flask import Flask, request
app = Flask(__name__)

@app.route('/resetdb', methods=['GET'])
def resetDB():
    pw = request.args.get('reset-password')
    if pw == '45-glSJG;f22gHSAEP':
        os.system("mysql roombooking --password=roombooking < /tmp/new-installation.sql")
        return "ok", 200
    return "error", 403

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8889)
