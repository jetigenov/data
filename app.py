from datetime import datetime

from flask import request, render_template, jsonify
from flask_migrate import Migrate

from db_home.models import db, Data
from lib import AppFactory
import os

from lib.utils import orm_to_json

app = AppFactory.create_app(__name__)
app.config.from_object('config.settings')

SECRET_KEY = os.urandom(32)
app.config['SECRET_KEY'] = SECRET_KEY

db.init_app(app)
migrate = Migrate(app, db)


@app.route('/', methods=['GET', 'POST'])
def home():
    if request.method == 'POST':

        title = request.form.get('title')
        text_area = request.form.getlist('text_area[]')
        bool_data = request.form.get('bool_data')

        form_data = Data()
        form_data.title = title
        form_data.text_area = text_area
        form_data.bool_data = True if bool_data else False
        form_data.created_on = datetime.now()

        db.session.add(form_data)
        db.session.commit()

    return render_template('home.html')


@app.route('/data', methods=['GET'])
def get_data():
    data = db.session.query(Data).all()
    data = orm_to_json(data)

    return jsonify({'list': data})


if __name__ == '__main__':
    app.run(debug=True, port=5000)

