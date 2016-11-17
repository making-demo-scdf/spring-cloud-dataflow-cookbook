# Twitter to Wakati


![image](https://cloud.githubusercontent.com/assets/106908/20398746/ed3dc868-ad31-11e6-89dd-c3a01058933e.png)


## Deploy stream

Register [`wakati` processor (Reactor version)](https://github.com/making-demo-scdf/wakati-kuromoji-processor)

``` shell
../login-dataflow.sh register.log
```

``` shell
../deploy-stream.sh twitter-to-wakati.log
```

## Test stream

![image](https://cloud.githubusercontent.com/assets/106908/20399637/17d30798-ad35-11e6-9b9d-48198b27904a.png)


![image](https://cloud.githubusercontent.com/assets/106908/20399646/22969c94-ad35-11e6-8d5b-effa484dbe77.png)


## Destroy stream

``` shell
../destroy-stream.sh ja-tweets tagcount words wordcount
```
