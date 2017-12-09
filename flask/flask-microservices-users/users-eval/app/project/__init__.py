# project/__init__.py


import os

from flask import Flask, jsonify
from flask_cors import CORS
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate


# instantiate the extensions
db = SQLAlchemy()
migrate = Migrate()


def create_app():

    # instantiate the app
    app = Flask(__name__)

    # enable CORS
    CORS(app)

    # set config
    app_settings = os.getenv('APP_SETTINGS')
    app.config.from_object(app_settings)

    # set up extensions
    db.init_app(app)
    migrate.init_app(app, db)

    # register blueprints
    from project.api.eval import eval_blueprint
    app.register_blueprint(eval_blueprint)
    from project.api.scores.scores import scores_blueprint
    app.register_blueprint(scores_blueprint)
    from project.api.exercises.exercises import exercises_blueprint
    app.register_blueprint(exercises_blueprint)

    return app
