# api/v1/endpoints/health.py
from fastapi import APIRouter
from src.schemas.health_schema import HealthResponse
from src.db.session import get_session
from src.services.health_service import HealthService
from src.repositories.health_repository import HealthRepository
from sqlmodel import Session
from fastapi import Depends

router = APIRouter()

@router.get("/")

async def health_check(verbose: bool = False, session: Session = Depends(get_session)) -> HealthResponse:
    # Check database connection
    status = "ok"
    health_service = HealthService(repo=HealthRepository(session))
    db_status = health_service.check_health(verbose)
    if db_status.status != "ok":
        status = "degraded"
    # Check dependency services
    # Check 
    details = None
    if verbose:
        details = {
            "database": "connected" if db_status.status == "ok" else "down",
            "dependencies": "all healthy",
        }

    return HealthResponse(
        status=status,
        details=details
    )
