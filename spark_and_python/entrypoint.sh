#!/usr/bin/env bash
/spark-2.2.1-bin-hadoop2.7/sbin/start-master.sh &
/livy-0.5.0-incubating-bin/bin/livy-server &
bash
