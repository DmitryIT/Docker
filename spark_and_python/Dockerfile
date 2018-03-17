FROM ubuntu:16.04

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends python3 wget python3-pip  default-jre scala python3-setuptools unzip
RUN pip3 install -U pip && \
    pip3 install jupyter py4j findspark

#wget http://apache.mirror.digionline.de/spark/spark-2.2.1/spark-2.2.1-bin-hadoop2.7.tgz
WORKDIR /
COPY spark-2.3.0-bin-hadoop2.7.tar .
RUN  tar -xvf spark-2.3.0-bin-hadoop2.7.tar && \
            rm spark-2.3.0-bin-hadoop2.7.tar

RUN mkdir data

ENV SPARK_HOME='/spark-2.3.0-bin-hadoop2.7'
ENV PATH=$SPARK_HOME:$PATH
ENV PYTHONPATH=$SPARK_HOME/python
ENV PYSPARK_DRIVER_PYTHON="jupyter"
ENV PYSPARK_DRIVER_PYTHON_OPTS="notebook"
ENV PYSPARK_PYTHON=python3

#EXPOSE 8888

COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
#CMD ["bash"]

