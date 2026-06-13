from sqlmodel import Session, select

class HealthRepository:
    def __init__(self, session: Session):
        self.session = session

    def check_database_connection(self) -> bool:
        try:
            # Attempt to execute a simple query to check the connection
            self.session.exec(select(1))
            return True
        except Exception as e:
            print(f"Database connection error: {e}")
            return False
