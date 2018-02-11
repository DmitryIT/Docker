FROM ubuntu:16.04

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends python3 wget python3-pip  default-jre scala python3-setuptools unzip
RUN pip3 install -U pip && \
    pip3 install jupyter py4j findspark

#wget http://apache.mirror.digionline.de/spark/spark-2.2.1/spark-2.2.1-bin-hadoop2.7.tgz
WORKDIR /
COPY spark-2.2.1-bin-hadoop2.7.tgz .
RUN  tar -zxvf spark-2.2.1-bin-hadoop2.7.tgz && \
            rm spark-2.2.1-bin-hadoop2.7.tgz

EXPOSE 7077 8080 8998
#7077 Spark Workers to Master
#8080 Spark Master Web UI
#8998 Livy

ENV SPARK_HOME='/spark-2.2.1-bin-hadoop2.7'
ENV PATH=$SPARK_HOME:$PATH
#ENV PYTHONPATH=$SPARK_HOME/python:$PYTHONPATH
ENV PYTHONPATH=$SPARK_HOME/python
ENV PYSPARK_DRIVER_PYTHON="jupyter"
ENV PYSPARK_DRIVER_PYTHON_OPTS="notebook"
ENV PYSPARK_PYTHON=python3

#wget http://archive.apache.org/dist/incubator/livy/0.5.0-incubating/livy-0.5.0-incubating-bin.zip
COPY livy-0.5.0-incubating-bin.zip .
RUN unzip livy-0.5.0-incubating-bin.zip && \
    mkdir /livy-0.5.0-incubating-bin/logs && \
    rm livy-0.5.0-incubating-bin.zip
#./livy-server

COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
#CMD ["bash"]

