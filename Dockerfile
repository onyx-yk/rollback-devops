FROM python:3.9-slim
WORKDIR /app

ARG VERSION=v1
COPY apps/${VERSION}/requirements.txt .
RUN pip install -r requirements.txt

COPY apps/${VERSION}/ .
EXPOSE 5000
CMD ["python", "app.py"]