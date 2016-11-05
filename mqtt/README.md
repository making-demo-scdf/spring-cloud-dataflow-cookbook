# MQTT

![image](https://cloud.githubusercontent.com/assets/106908/20032251/8d9d2906-a3c9-11e6-8ed0-1f18bebb1f7b.png)

## Deploy stream

Register [`mqtt` source](https://github.com/making/spring-cloud-starter-stream-source-mqtt)

``` shell
../login-dataflow.sh register.log
```

``` shell
../deploy-stream.sh mqtt.log
```

## Test stream

``` shell
mosquitto_pub -h iot.eclipse.org -p 1883 -d -t demo -m 'Hello World!'
```

``` console
$ cf logs dataflow-mqtt-log
...

2016-11-06T03:07:56.22+0900 [APP/0]      OUT 2016-11-05 18:07:56.220  INFO 15 --- [qtt.mqtt.mqtt-1] log.sink                                 : Hello World!
```

## Destroy stream

``` shell
../destroy-stream.sh mqtt
```
