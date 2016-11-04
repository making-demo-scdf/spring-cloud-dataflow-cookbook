# HTTP to MySQL

![image](https://cloud.githubusercontent.com/assets/106908/20025231/c4f5b7a0-a32f-11e6-9f47-288dd387b432.png)

## Deploy stream

``` shell
cf create-service p-mysql 512mb name-db
```

``` shell
../deploy-stream.sh http-to-mysql.log
```

## Test stream

``` shell
curl http://dataflow-http-to-mysql-http.local.pcfdev.io -X POST -H 'Content-Type: application/json' -d '{"name":"Foo"}'
curl http://dataflow-http-to-mysql-http.local.pcfdev.io -X POST -H 'Content-Type: application/json' -d '{"name":"Bar"}'
curl http://dataflow-http-to-mysql-http.local.pcfdev.io -X POST -H 'Content-Type: application/json' -d '{"name":"Baz"}'
```


``` console
$ cf env dataflow-http-to-mysql-jdbc
...

System-Provided:
{
 "VCAP_SERVICES": {
  "p-mysql": [
   {
    "credentials": {
     "hostname": "mysql-broker.local.pcfdev.io",
     "jdbcUrl": "jdbc:mysql://mysql-broker.local.pcfdev.io:3306/cf_7a3eac85_7984_4763_acda_0086e7d9cf10?user=mnfvHTceYZKSvgaz\u0026password=rqsbpsj0ge7cQ8dD",
     "name": "cf_7a3eac85_7984_4763_acda_0086e7d9cf10",
     "password": "rqsbpsj0ge7cQ8dD",
     "port": 3306,
     "uri": "mysql://mnfvHTceYZKSvgaz:rqsbpsj0ge7cQ8dD@mysql-broker.local.pcfdev.io:3306/cf_7a3eac85_7984_4763_acda_0086e7d9cf10?reconnect=true",
     "username": "mnfvHTceYZKSvgaz"
    },
    "label": "p-mysql",
    "name": "name-db",
    "plan": "512mb",
    "provider": null,
    "syslog_drain_url": null,
    "tags": [
     "mysql"
    ],
    "volume_mounts": []
   }
  ],
  "p-rabbitmq": [
    ...
  ]
 }
}

...
$ mysql -h mysql-broker.local.pcfdev.io -u mnfvHTceYZKSvgaz -p cf_7a3eac85_7984_4763_acda_0086e7d9cf10
Enter password: rqsbpsj0ge7cQ8dD
...

mysql> select * from names;
+------+
| name |
+------+
| Foo  |
| Bar  |
| Baz  |
+------+
3 rows in set (0.00 sec)
```

## Destroy stream

``` shell
../destroy-stream.sh http-to-mysql
```
