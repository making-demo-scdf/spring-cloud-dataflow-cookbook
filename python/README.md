# Python

![image](https://cloud.githubusercontent.com/assets/106908/20394436/d99ad1de-ad22-11e6-9901-9221f46e3897.png)

## Deploy stream

``` shell
../login-dataflow.sh register.log
```

``` shell
../deploy-stream.sh python.log
```

## Test stream

```
$ cf logs dataflow-python-python --recent
...
2016-11-18T00:06:53.41+0900 [APP/0]      OUT (" [x] Received '11/17/16 15:06:53'", <BasicProperties(['content_type=text/plain', 'delivery_mode=2', "headers={'contentType': u'text/plain'}", 'priority=0'])>)
2016-11-18T00:06:54.41+0900 [APP/0]      OUT (" [x] Received '11/17/16 15:06:54'", <BasicProperties(['content_type=text/plain', 'delivery_mode=2', "headers={'contentType': u'text/plain'}", 'priority=0'])>)
2016-11-18T00:06:55.41+0900 [APP/0]      OUT (" [x] Received '11/17/16 15:06:55'", <BasicProperties(['content_type=text/plain', 'delivery_mode=2', "headers={'contentType': u'text/plain'}", 'priority=0'])>)
2016-11-18T00:06:56.41+0900 [APP/0]      OUT (" [x] Received '11/17/16 15:06:56'", <BasicProperties(['content_type=text/plain', 'delivery_mode=2', "headers={'contentType': u'text/plain'}", 'priority=0'])>)
2016-11-18T00:06:57.42+0900 [APP/0]      OUT (" [x] Received '11/17/16 15:06:57'", <BasicProperties(['content_type=text/plain', 'delivery_mode=2', "headers={'contentType': u'text/plain'}", 'priority=0'])>)
2016-11-18T00:06:58.42+0900 [APP/0]      OUT (" [x] Received '11/17/16 15:06:58'", <BasicProperties(['content_type=text/plain', 'delivery_mode=2', "headers={'contentType': u'text/plain'}", 'priority=0'])>)
2016-11-18T00:06:59.42+0900 [APP/0]      OUT (" [x] Received '11/17/16 15:06:59'", <BasicProperties(['content_type=text/plain', 'delivery_mode=2', "headers={'contentType': u'text/plain'}", 'priority=0'])>)
2016-11-18T00:07:00.42+0900 [APP/0]      OUT (" [x] Received '11/17/16 15:07:00'", <BasicProperties(['content_type=text/plain', 'delivery_mode=2', "headers={'contentType': u'text/plain'}", 'priority=0'])>)
2016-11-18T00:07:01.42+0900 [APP/0]      OUT (" [x] Received '11/17/16 15:07:01'", <BasicProperties(['content_type=text/plain', 'delivery_mode=2', "headers={'contentType': u'text/plain'}", 'priority=0'])>)
```

## Destroy stream

``` shell
../destroy-stream.sh python
```
