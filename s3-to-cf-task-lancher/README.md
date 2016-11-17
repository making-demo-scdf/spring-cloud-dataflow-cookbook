# S3 to CF Task Lancher

![image](https://cloud.githubusercontent.com/assets/106908/20393840/b4f53326-ad20-11e6-84c6-c45e1a5a3763.png)


![image](https://cloud.githubusercontent.com/assets/106908/20393922/0b4081d6-ad21-11e6-904b-53e1adf32fa3.png)

[Pivotal Web Services](https://run.pivotal.io) might not work well.

## Deploy stream


``` shell
../login-dataflow.sh register.log
```


``` shell
../deploy-stream.sh s3-to-cf-task-lancher.log
```

## Test stream

Upload PDF Files into S3.

```
cf v3-logs index-import-task-1.0.0-dev2.jar
```

## Destroy stream

``` shell
../destroy-stream.sh s3-to-cf-task-lancher
```
