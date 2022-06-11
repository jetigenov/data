from datetime import datetime

from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import Column, Integer, String, DateTime, Boolean

db = SQLAlchemy()
Base = db.Model


class Data(Base):
    __tablename__ = 't_data'

    id = Column(Integer, primary_key=True)
    title = Column(String(64))
    text_area = Column(String())
    bool_data = Column(Boolean, default=False)
    created_on = Column(DateTime)
