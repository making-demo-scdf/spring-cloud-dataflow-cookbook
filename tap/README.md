# Tap

![image](https://cloud.githubusercontent.com/assets/106908/20023848/049b5004-a326-11e6-9060-fb2c95a59dca.png)

## Deploy stream

``` shell
../deploy-stream.sh tap.log
```

## Test stream

``` console
$ cf logs dataflow-tap-logger-log --recent
...
2016-11-05T05:09:30.01+0900 [APP/0]      OUT 2016-11-04 20:09:30.015  INFO 14 --- [er.tap-logger-1] log.sink                                 : 11/04/16 20:09:30
2016-11-05T05:09:40.04+0900 [APP/0]      OUT 2016-11-04 20:09:40.040  INFO 14 --- [er.tap-logger-1] log.sink                                 : 11/04/16 20:09:40
2016-11-05T05:09:50.06+0900 [APP/0]      OUT 2016-11-04 20:09:50.066  INFO 14 --- [er.tap-logger-1] log.sink                                 : 11/04/16 20:09:50
```

``` console
$ cf logs dataflow-time-tap-log --recent
2016-11-05T05:09:30.01+0900 [APP/0]      OUT 2016-11-04 20:09:30.010  INFO 18 --- [time.time-tap-1] log.sink                                 : 11/04/16 20:09:30
2016-11-05T05:09:31.01+0900 [APP/0]      OUT 2016-11-04 20:09:31.013  INFO 18 --- [time.time-tap-1] log.sink                                 : 11/04/16 20:09:31
2016-11-05T05:09:32.01+0900 [APP/0]      OUT 2016-11-04 20:09:32.015  INFO 18 --- [time.time-tap-1] log.sink                                 : 11/04/16 20:09:32
2016-11-05T05:09:33.01+0900 [APP/0]      OUT 2016-11-04 20:09:33.018  INFO 18 --- [time.time-tap-1] log.sink                                 : 11/04/16 20:09:33
2016-11-05T05:09:34.02+0900 [APP/0]      OUT 2016-11-04 20:09:34.021  INFO 18 --- [time.time-tap-1] log.sink                                 : 11/04/16 20:09:34
2016-11-05T05:09:35.02+0900 [APP/0]      OUT 2016-11-04 20:09:35.024  INFO 18 --- [time.time-tap-1] log.sink                                 : 11/04/16 20:09:35
2016-11-05T05:09:36.02+0900 [APP/0]      OUT 2016-11-04 20:09:36.026  INFO 18 --- [time.time-tap-1] log.sink                                 : 11/04/16 20:09:36
2016-11-05T05:09:37.02+0900 [APP/0]      OUT 2016-11-04 20:09:37.028  INFO 18 --- [time.time-tap-1] log.sink                                 : 11/04/16 20:09:37
2016-11-05T05:09:38.03+0900 [APP/0]      OUT 2016-11-04 20:09:38.031  INFO 18 --- [time.time-tap-1] log.sink                                 : 11/04/16 20:09:38
2016-11-05T05:09:39.03+0900 [APP/0]      OUT 2016-11-04 20:09:39.032  INFO 18 --- [time.time-tap-1] log.sink                                 : 11/04/16 20:09:39
2016-11-05T05:09:40.03+0900 [APP/0]      OUT 2016-11-04 20:09:40.033  INFO 18 --- [time.time-tap-1] log.sink                                 : 11/04/16 20:09:40
2016-11-05T05:09:41.04+0900 [APP/0]      OUT 2016-11-04 20:09:41.038  INFO 18 --- [time.time-tap-1] log.sink                                 : 11/04/16 20:09:41
2016-11-05T05:09:42.04+0900 [APP/0]      OUT 2016-11-04 20:09:42.044  INFO 18 --- [time.time-tap-1] log.sink                                 : 11/04/16 20:09:42
2016-11-05T05:09:43.04+0900 [APP/0]      OUT 2016-11-04 20:09:43.041  INFO 18 --- [time.time-tap-1] log.sink                                 : 11/04/16 20:09:43
2016-11-05T05:09:44.04+0900 [APP/0]      OUT 2016-11-04 20:09:44.043  INFO 18 --- [time.time-tap-1] log.sink                                 : 11/04/16 20:09:44
2016-11-05T05:09:45.04+0900 [APP/0]      OUT 2016-11-04 20:09:45.045  INFO 18 --- [time.time-tap-1] log.sink                                 : 11/04/16 20:09:45
2016-11-05T05:09:46.05+0900 [APP/0]      OUT 2016-11-04 20:09:46.050  INFO 18 --- [time.time-tap-1] log.sink                                 : 11/04/16 20:09:46
2016-11-05T05:09:47.05+0900 [APP/0]      OUT 2016-11-04 20:09:47.054  INFO 18 --- [time.time-tap-1] log.sink                                 : 11/04/16 20:09:47
2016-11-05T05:09:48.05+0900 [APP/0]      OUT 2016-11-04 20:09:48.054  INFO 18 --- [time.time-tap-1] log.sink                                 : 11/04/16 20:09:48
2016-11-05T05:09:49.05+0900 [APP/0]      OUT 2016-11-04 20:09:49.057  INFO 18 --- [time.time-tap-1] log.sink                                 : 11/04/16 20:09:49
2016-11-05T05:09:50.06+0900 [APP/0]      OUT 2016-11-04 20:09:50.061  INFO 18 --- [time.time-tap-1] log.sink                                 : 11/04/16 20:09:50
2016-11-05T05:09:51.06+0900 [APP/0]      OUT 2016-11-04 20:09:51.065  INFO 18 --- [time.time-tap-1] log.sink                                 : 11/04/16 20:09:51
2016-11-05T05:09:52.07+0900 [APP/0]      OUT 2016-11-04 20:09:52.073  INFO 18 --- [time.time-tap-1] log.sink                                 : 11/04/16 20:09:52
```

## Destroy stream

``` shell
../destroy-stream.sh tap-logger time-tap
```
