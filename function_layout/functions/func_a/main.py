from fastapi import FastAPI, HTTPException, Request
from fastapi.responses import JSONResponse
import uvicorn

app = FastAPI()

@app.post("/")
async def process_json(request: Request):
    try:
        return JSONResponse(content={"hello": "world"}, status_code=200)
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))