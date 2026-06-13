# services/health_service.py

from src.repositories.health_repository import HealthRepository
from src.schemas.health_schema import HealthServiceResponse
class HealthService:
    def __init__(self, repo: HealthRepository):
        self.repo = repo

    def check_health(self, verbose: bool) -> HealthServiceResponse:
        db_ok = self.repo.check_database_connection()

        details = None
        if verbose:
            details = {
                "database": "connected" if db_ok else "down",
                "dependencies": "all healthy",
            }

        return HealthServiceResponse(
            status="ok" if db_ok else "degraded",
            details=details
        )
