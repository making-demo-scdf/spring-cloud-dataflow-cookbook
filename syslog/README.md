# Syslog

![image](https://cloud.githubusercontent.com/assets/106908/20023730/5272baca-a325-11e6-8200-de46344438e8.png)

## Deploy stream

``` shell
../deploy-stream.sh syslog.log
```

## Test stream

``` shell
cf create-route pcfdev-space tcp.local.pcfdev.io --port 61001
cf map-route dataflow-syslog-syslog tcp.local.pcfdev.io --port 61001

echo '<22>1 2014-06-18T09:56:21Z sendername programname - - - the log message' | nc tcp.local.pcfdev.io 61001
```

``` console
$ cf logs dataflow-syslog-log --recent
...
2016-11-05T06:54:39.47+0900 [APP/0]      OUT 2016-11-04 21:54:39.477  INFO 18 --- [syslog.syslog-1] log.sink                                 : {syslog_FACILITY=2, syslog_SEVERITY=6, syslog_SEVERITY_TEXT=INFO, syslog_TIMESTAMP=2014-06-18T09:56:21Z, syslog_HOST=sendername, syslog_APP_NAME=programname, syslog_PROCID=-, syslog_MSGID=-, syslog_VERSION=1, syslog_MESSAGE=the log message, syslog_DECODE_ERRORS=false}```
```

``` console
$ cf logs dataflow-message-only-log --recent
...
2016-11-05T06:54:39.49+0900 [APP/0]      OUT 2016-11-04 21:54:39.489  INFO 19 --- [.message-only-1] log.sink                                 : the log message
```

## Destroy stream

``` shell
../destroy-stream.sh syslog message-only
```
