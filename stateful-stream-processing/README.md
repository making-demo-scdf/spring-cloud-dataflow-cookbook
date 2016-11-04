# Stateful Stream Processing

![image](https://cloud.githubusercontent.com/assets/106908/20023832/df74b108-a325-11e6-929d-ec227362783d.png)

## Deploy stream

``` shell
../deploy-stream.sh stateful-stream-processing.log
```

## Test stream

``` shell
curl http://dataflow-words-http.local.pcfdev.io -X POST -H 'Content-Type: text/pain' -d 'How much wood would a woodchuck chuck if a woodchuck could chuck wood'
```

``` console
$ cf logs dataflow-words-log --recent
...
2016-11-05T05:27:20.97+0900 [APP/1]      OUT 2016-11-04 20:27:20.977  INFO 15 --- [itter.words-1-1] log.sink                                 : much
2016-11-05T05:27:20.98+0900 [APP/0]      OUT 2016-11-04 20:27:20.977  INFO 14 --- [itter.words-0-1] log.sink                                 : How
2016-11-05T05:27:20.98+0900 [APP/0]      OUT 2016-11-04 20:27:20.983  INFO 14 --- [itter.words-0-1] log.sink                                 : chuck
2016-11-05T05:27:20.98+0900 [APP/1]      OUT 2016-11-04 20:27:20.983  INFO 15 --- [itter.words-1-1] log.sink                                 : wood
2016-11-05T05:27:20.98+0900 [APP/1]      OUT 2016-11-04 20:27:20.987  INFO 15 --- [itter.words-1-1] log.sink                                 : would
2016-11-05T05:27:20.99+0900 [APP/1]      OUT 2016-11-04 20:27:20.991  INFO 15 --- [itter.words-1-1] log.sink                                 : a
2016-11-05T05:27:20.99+0900 [APP/0]      OUT 2016-11-04 20:27:20.991  INFO 14 --- [itter.words-0-1] log.sink                                 : chuck
2016-11-05T05:27:21.00+0900 [APP/1]      OUT 2016-11-04 20:27:21.003  INFO 15 --- [itter.words-1-1] log.sink                                 : woodchuck
2016-11-05T05:27:21.02+0900 [APP/1]      OUT 2016-11-04 20:27:21.018  INFO 15 --- [itter.words-1-1] log.sink                                 : if
2016-11-05T05:27:21.03+0900 [APP/1]      OUT 2016-11-04 20:27:21.030  INFO 15 --- [itter.words-1-1] log.sink                                 : a
2016-11-05T05:27:21.03+0900 [APP/1]      OUT 2016-11-04 20:27:21.033  INFO 15 --- [itter.words-1-1] log.sink                                 : woodchuck
2016-11-05T05:27:21.04+0900 [APP/1]      OUT 2016-11-04 20:27:21.043  INFO 15 --- [itter.words-1-1] log.sink                                 : could
2016-11-05T05:27:21.05+0900 [APP/1]      OUT 2016-11-04 20:27:21.050  INFO 15 --- [itter.words-1-1] log.sink                                 : wood
```

## Destroy stream

``` shell
../destroy-stream.sh words
```
