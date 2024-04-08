FROM python:3.11.9-alpine3.19

WORKDIR /app

ENV PORT=5000

COPY ["app.py", "requirements.txt", "./"]

RUN pip install -r requirements.txt

COPY . .

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]doc