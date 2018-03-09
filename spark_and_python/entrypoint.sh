#!/bin/bash
set -e

if [ "$1" == "master" ]; then
    #exec "${SPARK_HOME}/bin/spark-class" "org.apache.spark.deploy.master.Master"
    exec "${SPARK_HOME}/sbin/start-master.sh"
    exec "jupyter notebook --ip=127.0.0.1 --allow-root --NotebookApp.password=sha1:966032cae12c:f109b896f13058b2f110a89d345114fb5a1080f6"
elif [ "$1" == "slave" ]; then
    exec "${SPARK_HOME}/bin/spark-class" "org.apache.spark.deploy.worker.Worker" "${2}"
else
    echo "Syntax: master or slave MASTER_URL"
    exit 1
fi
