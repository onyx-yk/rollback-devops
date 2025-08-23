FROM python:3.12.4-slim
WORKDIR /app

ARG VERSION=v1
COPY app/${VERSION}/requirements.txt .
RUN pip install -r requirements.txt

COPY app/${VERSION}/ .
EXPOSE 5000
CMD ["python", "app${VERSION:1}.py"]