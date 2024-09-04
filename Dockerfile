FROM python:3.9-slim-buster

WORKDIR /app

COPY api/requirements.txt .

RUN pip install -U pip && pip install -r requirements.txt

COPY api/ ./api

COPY model/model.pkl ./model/model.pkl

COPY init.sh .

RUN chmod +x init.sh

EXPOSE 8000

CMD ["./init.sh"]
