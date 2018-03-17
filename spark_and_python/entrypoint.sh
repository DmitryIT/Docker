#!/bin/bash
set -e

if [ "$1" == "master" ]; then
    #exec "${SPARK_HOME}/sbin/start-master.sh"
    #exec "${SPARK_HOME}/bin/spark-class" "org.apache.spark.deploy.master.Master"
    #exec "jupyter" "notebook" "--ip='*'" "--allow-root" "--NotebookApp.password=sha1:966032cae12c:f109b896f13058b2f110a89d345114fb5a1080f6"
    $SPARK_HOME/sbin/start-master.sh
    jupyter notebook --ip='*' --allow-root --NotebookApp.password=sha1:966032cae12c:f109b896f13058b2f110a89d345114fb5a1080f6
elif [ "$1" == "slave" ]; then
    exec "${SPARK_HOME}/bin/spark-class" "org.apache.spark.deploy.worker.Worker" "${2}"
elif [ "$1" == "bash" ]; then
    exec "bash"
else
    echo "Syntax: master or slave MASTER_URL"
    exit 1
fi
