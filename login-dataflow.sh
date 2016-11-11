#!/bin/sh
if [ "$TARGET" = "" ];then
  TARGET=http://dataflow-server.local.pcfdev.io
fi

if [ "$1" != "" ];then
  ARGS="--spring.shell.commandFile=$1"
fi
java -jar `dirname $0`/spring-cloud-dataflow-shell-1.1.0.RC1.jar --dataflow.uri=$TARGET $ARGS
