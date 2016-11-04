#!/bin/sh

STREAMS=$*
if [ "$TARGET" = "" ];then
  TARGET=http://dataflow-server.local.pcfdev.io
fi

if [ "$STREAMS" == "" ];then
  echo "STEAMS is empty"
  exit 1
fi

echo "destroy $STREAMS"

LOGFILE=/tmp/destroy-stream`uuidgen`.log

for s in $STREAMS;do
  echo "stream destroy --name $s" >> $LOGFILE
done


cat $LOGFILE

echo "Destroying ... $LOGFILE to $TARGET"
java -jar `dirname $0`/spring-cloud-dataflow-shell-1.1.0.M2.jar --dataflow.uri=$TARGET --spring.shell.commandFile=$LOGFILE

rm -f $LOGFILE

echo "Ctrl+C to stop monitoring"

while true;do
  cf apps
  sleep 1
done
