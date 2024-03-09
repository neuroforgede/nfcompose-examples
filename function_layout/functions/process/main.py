from fastapi import FastAPI, HTTPException, Request
from fastapi.responses import JSONResponse
import os
from compose_client.library.connection.client import RequestsRestClient, Credentials
from compose_client.library.service.pusher import DataPointPusher
from compose_client.library.models.definition.datapoint import DataPoint
import uuid

client = RequestsRestClient(Credentials(
    base_url=os.environ.get("NF_COMPOSE_URL"),
    user=os.environ.get("NF_COMPOSE_USER"),
    password=os.environ.get("NF_COMPOSE_PASSWORD"),
))

app = FastAPI()

@app.post("/")
async def process_json(request: Request):
    try:
        return JSONResponse(content={"result": "ok"}, status_code=200)
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))