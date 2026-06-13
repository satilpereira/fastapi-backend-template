from sqlmodel import Session
from src.db.engine import engine

def get_session():
    with Session(engine) as session:
        yield session
