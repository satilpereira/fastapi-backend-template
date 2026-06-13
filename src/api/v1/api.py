from fastapi import APIRouter
from src.api.v1.endpoints import health_controller

api_router = APIRouter()
api_router.include_router(health_controller.router, prefix="/health", tags=["health"])
