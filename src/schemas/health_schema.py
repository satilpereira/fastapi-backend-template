from typing import Optional

from pydantic import BaseModel

class HealthResponse(BaseModel):
  status: str
  details: Optional[dict[str, str]] = None
  
class HealthServiceResponse(BaseModel):
  status: str
  details: dict[str, str] | None = None