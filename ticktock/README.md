# TickTock

## Deploy stream

``` shell
../deploy-stream.sh ticktock.log
```

## Test stream

```
$ cf logs dataflow-ticktock-log

2016-11-05T04:51:37.97+0900 [APP/0]      OUT 2016-11-04 19:51:37.974  INFO 20 --- [time.ticktock-1] log.sink                                 : 11/04/16 19:51:37
2016-11-05T04:51:38.95+0900 [APP/0]      OUT 2016-11-04 19:51:38.958  INFO 20 --- [time.ticktock-1] log.sink                                 : 11/04/16 19:51:38
2016-11-05T04:51:39.96+0900 [APP/0]      OUT 2016-11-04 19:51:39.968  INFO 20 --- [time.ticktock-1] log.sink                                 : 11/04/16 19:51:39
2016-11-05T04:51:40.96+0900 [APP/0]      OUT 2016-11-04 19:51:40.964  INFO 20 --- [time.ticktock-1] log.sink                                 : 11/04/16 19:51:40
2016-11-05T04:51:41.96+0900 [APP/0]      OUT 2016-11-04 19:51:41.965  INFO 20 --- [time.ticktock-1] log.sink                                 : 11/04/16 19:51:41
```

## Destroy stream

``` shell
../destroy-stream.sh ticktock
```
