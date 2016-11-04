#!/bin/sh
if [ "$TARGET" = "" ];then
  TARGET=http://dataflow-server.local.pcfdev.io
fi
java -jar spring-cloud-dataflow-shell-1.1.0.M2.jar --dataflow.uri=$TARGET
