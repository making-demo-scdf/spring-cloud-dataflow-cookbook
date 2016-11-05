# TCP

## Deploy stream

``` shell
../deploy-stream.sh tcp.log
```

## Test stream

``` shell
cf create-route pcfdev-space tcp.local.pcfdev.io --port 61002
cf map-route dataflow-tcp-tcp tcp.local.pcfdev.io --port 61002
```

``` shell
echo 'Hello World!' |  nc -c tcp.local.pcfdev.io 61002
```

``` console
$ cf logs dataflow-tcp-log --recent
...
2016-11-05T09:13:31.78+0900 [APP/0]      OUT 2016-11-05 00:13:31.781  INFO 14 --- [  tcp.tcp.tcp-1] log.sink                                 : Hello World!
```

## Destroy stream

``` shell
../destroy-stream.sh tcp
```
