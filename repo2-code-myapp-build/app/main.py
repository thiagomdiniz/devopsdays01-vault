import os
from typing import Optional
from fastapi import FastAPI
from pydantic_settings import BaseSettings, SettingsConfigDict

class Settings(BaseSettings):
    admin_email: Optional[str] = None
    db_host: Optional[str] = None
    db_user: Optional[str] = None
    db_pass: Optional[str] = None

    model_config = SettingsConfigDict(env_file="/mnt/efs/.env", extra="ignore")


app = FastAPI()
settings = Settings()

role_id = os.getenv("ROLE_ID", "Undefined")
version = os.getenv("VERSION", "Undefined")


@app.get("/")
async def read_root():
    return {"Hello": "MyApp"}


@app.get("/env")
async def read_env():
    return {
        "version": version,
        "role_id": role_id,
        "admin_email": settings.admin_email,
        "db_host": settings.db_host,
        "db_user": settings.db_user,
        "db_pass": settings.db_pass,
    }


@app.get("/health", status_code=200)
async def health():
    return {"status": "ok"}