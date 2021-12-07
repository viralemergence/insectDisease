import sqlite3
from flask import Flask, request, render_template, g, make_response

import sys
sys.path.append('./bin')

import form_values
import query

app = Flask(__name__, root_path='./')

def enquote(x):
    if type(x) == str:
        if ',' in x:
            return f'"{x}"'
        else:
            return x
    else:
        return str(x)

def make_dicts(cursor, row):
    return dict((cursor.description[idx][0], value)
                for idx, value in enumerate(row))

def get_db(factory=None):
    db = getattr(g, '_database', None)
    if db is None:
        db = g._database = sqlite3.connect('data/db.sqlite')
        if factory:
            db.row_factory = factory
    return db

@app.errorhandler(404)
def page_not_found(e):
    return render_template('404.html'), 404

@app.errorhandler(500)
def internal_error(e):
    return render_template('500.html'), 500

@app.route("/", methods=['GET'])
def formPage():
    return render_template('welcome.html', active='welcome'), 200
    return '', 200

@app.route("/download", methods=['GET', 'POST'])
def queryPage():
    if request.method == 'GET':
        return render_template('form.html', dropdowns=form_values.dropdowns(get_db()), boxes=form_values.boxes(), active='download'), 200
    if request.method == 'POST':
        data = request.form.to_dict(flat=False)
        for field in data:
            if '_fields_' in field:
                data[field] = [form_values.columnMap.get(data[field][0])]
        #return(data)
        results = query.query(data, get_db())
        colnames = ','.join([data[field][0] for field in data if '_fields_' in field])
        resp=make_response(colnames + '\n' + '\n'.join([','.join([enquote(x) for x in result]) for result in results]))
        resp.headers.set('Content-Type', 'text/csv')
        resp.headers.set("Content-Disposition", "attachment;filename=EDWIP_data.csv")
        return(resp)
    return render_template('500.html'), 500

if __name__ == '__main__':
    app.run(host='0.0.0.0',threaded=True,port=7778)
