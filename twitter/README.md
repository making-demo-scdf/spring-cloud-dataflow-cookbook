# Twitter

![image](https://cloud.githubusercontent.com/assets/106908/20023929/72f49376-a326-11e6-9bb9-93f6e7a280f3.png)

## Deploy stream

Change `<CONSUMER_KEY>`, `<CONSUMER_SECRET>`, `<CONSUMER_SECRET>`, and `<ACCESS_TOKEN_SECRET>` in `twitter-stream.log`.
You can create an app at the [Twitter Developers](https://apps.twitter.com/) site to get these credentials.

``` shell
../deploy-stream.sh twitter-stream.log
```

## Test stream

See [Twitter Analytics](https://github.com/spring-cloud/spring-cloud-dataflow-samples/tree/master/analytics/twitter-analytics).

## Destroy stream

``` shell
../destroy-stream.sh tweets tweetlang tagcount
```
