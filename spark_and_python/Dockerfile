FROM ubuntu:16.04

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends python3 wget python3-pip  default-jre scala python3-setuptools unzip
RUN pip3 install -U pip && \
    pip3 install jupyter py4j findspark pyspark

#wget http://apache.mirror.digionline.de/spark/spark-2.2.1/spark-2.2.1-bin-hadoop2.7.tgz
WORKDIR /
#COPY spark-2.2.1-bin-hadoop2.7.tgz .
#RUN  tar -zxvf spark-2.2.1-bin-hadoop2.7.tgz && \
#            rm spark-2.2.1-bin-hadoop2.7.tgz

ENV SPARK_HOME='/spark-2.2.1-bin-hadoop2.7'
ENV PATH=$SPARK_HOME:$PATH
#ENV PYTHONPATH=$SPARK_HOME/python:$PYTHONPATH
ENV PYTHONPATH=$SPARK_HOME/python
ENV PYSPARK_DRIVER_PYTHON="jupyter"
ENV PYSPARK_DRIVER_PYTHON_OPTS="notebook"
ENV PYSPARK_PYTHON=python3

COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

#ENTRYPOINT ["./entrypoint.sh"]
CMD ["bash"]

