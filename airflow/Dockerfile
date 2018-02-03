FROM python:3.6.4-jessie

RUN pip install airflow && \
    airflow initdb 

EXPOSE 8080

ENTRYPOINT ["airflow", "webserver", "-p 8080"]
