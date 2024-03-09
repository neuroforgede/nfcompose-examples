FROM python:3.11-slim
WORKDIR /app
COPY requirements.txt /app
RUN pip install -r requirements.txt
COPY . /app
ENV PYTHONUNBUFFERED=1
CMD ["uvicorn", "main:app", "--reload", "--host", "0.0.0.0", "--port", "8000", "--log-level", "info"]