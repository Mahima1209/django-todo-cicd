FROM python:3

# Install distutils dependency
RUN apt-get update && apt-get install -y python3-distutils

WORKDIR /data
COPY requirements.txt .

# Then install requirements
RUN pip install -r requirements.txt

COPY . .

RUN python manage.py migrate

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]



