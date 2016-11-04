# JSON HTTP Filtering

![image](https://cloud.githubusercontent.com/assets/106908/20023801/b8fa4dd0-a325-11e6-9776-926bf86fce75.png)

## Deploy stream

``` shell
../deploy-stream.sh json-http-filtering.log
```

## Test stream

``` shell
curl http://dataflow-filter-demo-http.local.pcfdev.io -X POST -H 'Content-Type: application/json' -d '{"origin":{"id":1,"country":"US"}}'
curl http://dataflow-filter-demo-http.local.pcfdev.io -X POST -H 'Content-Type: application/json' -d '{"origin":{"id":2,"country":"JP"}}'
curl http://dataflow-filter-demo-http.local.pcfdev.io -X POST -H 'Content-Type: application/json' -d '{"origin":{"id":3,"country":"CA"}}'
curl http://dataflow-filter-demo-http.local.pcfdev.io -X POST -H 'Content-Type: application/json' -d '{"origin":{"id":4,"country":"JP"}}'
```

``` console
$ cf logs dataflow-filter-demo-log --recent

...
2016-11-05T04:33:11.41+0900 [APP/0]      OUT 2016-11-04 19:33:11.416  INFO 21 --- [r.filter-demo-1] log.sink                                 : {"origin":{"id":2,"country":"JP"}}
2016-11-05T04:33:11.42+0900 [APP/0]      OUT 2016-11-04 19:33:11.427  INFO 21 --- [r.filter-demo-1] log.sink                                 : {"origin":{"id":4,"country":"JP"}}
```

## Destroy streams

``` shell
../destroy-stream.sh filter-demo
```
