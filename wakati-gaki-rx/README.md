# Wakati Gaki (Reactor version)

![image](https://cloud.githubusercontent.com/assets/106908/20036261/4a7148fa-a447-11e6-879e-59fdc956598a.png)

## Deploy stream

Register [`wakati` processor (Reactor version)](https://github.com/making-demo-scdf/wakati-kuromoji-processor)

``` shell
../login-dataflow.sh register.log
```

``` shell
../deploy-stream.sh wakati-gaki.log
```

## Test stream

``` shell
curl http://dataflow-wakati-gaki-http.local.pcfdev.io -X POST -H 'Content-Type: text/pain' -d 'お寿司が食べたい。'
```

``` console
$ cf logs dataflow-wakati-gaki-log --recent

...

2016-11-06T17:26:29.83+0900 [APP/0]      OUT 2016-11-06 08:26:29.834  INFO 15 --- [i.wakati-gaki-1] log.sink                                 : {"surface":"お","position":0,"partOfSpeechLevel1":"接頭詞","partOfSpeechLevel2":"名詞接続","partOfSpeechLevel3":"*","partOfSpeechLevel4":"*","conjugationType":"*","conjugationForm":"*","baseForm":"お","reading":"オ","pronunciation":"オ"}
2016-11-06T17:26:29.84+0900 [APP/0]      OUT 2016-11-06 08:26:29.838  INFO 15 --- [i.wakati-gaki-1] log.sink                                 : {"surface":"寿司","position":1,"partOfSpeechLevel1":"名詞","partOfSpeechLevel2":"一般","partOfSpeechLevel3":"*","partOfSpeechLevel4":"*","conjugationType":"*","conjugationForm":"*","baseForm":"寿司","reading":"スシ","pronunciation":"スシ"}
2016-11-06T17:26:29.84+0900 [APP/0]      OUT 2016-11-06 08:26:29.846  INFO 15 --- [i.wakati-gaki-1] log.sink                                 : {"surface":"が","position":3,"partOfSpeechLevel1":"助詞","partOfSpeechLevel2":"格助詞","partOfSpeechLevel3":"一般","partOfSpeechLevel4":"*","conjugationType":"*","conjugationForm":"*","baseForm":"が","reading":"ガ","pronunciation":"ガ"}
2016-11-06T17:26:29.86+0900 [APP/0]      OUT 2016-11-06 08:26:29.863  INFO 15 --- [i.wakati-gaki-1] log.sink                                 : {"surface":"食べ","position":4,"partOfSpeechLevel1":"動詞","partOfSpeechLevel2":"自立","partOfSpeechLevel3":"*","partOfSpeechLevel4":"*","conjugationType":"一段","conjugationForm":"連用形","baseForm":"食べる","reading":"タベ","pronunciation":"タベ"}
2016-11-06T17:26:29.87+0900 [APP/0]      OUT 2016-11-06 08:26:29.869  INFO 15 --- [i.wakati-gaki-1] log.sink                                 : {"surface":"たい","position":6,"partOfSpeechLevel1":"助動詞","partOfSpeechLevel2":"*","partOfSpeechLevel3":"*","partOfSpeechLevel4":"*","conjugationType":"特殊・タイ","conjugationForm":"基本形","baseForm":"たい","reading":"タイ","pronunciation":"タイ"}
2016-11-06T17:26:29.88+0900 [APP/0]      OUT 2016-11-06 08:26:29.874  INFO 15 --- [i.wakati-gaki-1] log.sink                                 : {"surface":"。","position":8,"partOfSpeechLevel1":"記号","partOfSpeechLevel2":"句点","partOfSpeechLevel3":"*","partOfSpeechLevel4":"*","conjugationType":"*","conjugationForm":"*","baseForm":"。","reading":"。","pronunciation":"。"}
```

``` console
$ cf logs dataflow-noun-only-log --recent
...

2016-11-06T17:26:29.97+0900 [APP/0]      OUT 2016-11-06 08:26:29.978  INFO 23 --- [ter.noun-only-1] log.sink                                 : {"surface":"寿司","position":1,"partOfSpeechLevel1":"名詞","partOfSpeechLevel2":"一般","partOfSpeechLevel3":"*","partOfSpeechLevel4":"*","conjugationType":"*","conjugationForm":"*","baseForm":"寿司","reading":"スシ","pronunciation":"スシ"}
```

## Destroy stream

``` shell
../destroy-stream.sh wakati-gaki noun-only
```
