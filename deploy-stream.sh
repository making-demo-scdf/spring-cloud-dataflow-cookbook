#!/bin/sh

LOGFILE=$1

if [ "$TARGET" = "" ];then
  TARGET=$2
fi

if [ "$LOGFILE" = "" ];then
  echo "LOGFILE is not specified!"
  exit 1
fi

if [ "$TARGET" = "" ];then
  TARGET=http://dataflow-server.local.pcfdev.io
fi

if [ "$TARGET" = "" ];then
  echo "TARGET is not specified!"
  exit 1
fi

echo "Deploying ... $LOGFILE to $TARGET"
java -jar spring-cloud-dataflow-shell-1.1.0.M2.jar --dataflow.uri=$TARGET --spring.shell.commandFile=$LOGFILE

if [ "$?" != "0" ];then
  echo "Failed"
  exit 1
fi

echo "Ctrl+C to stop monitoring"

while true;do
  cf apps
  sleep 1
done
