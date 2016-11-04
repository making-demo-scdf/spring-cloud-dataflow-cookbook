# spring-cloud-dataflow-playground

``` shell
wget https://repo.spring.io/libs-milestone/org/springframework/cloud/spring-cloud-dataflow-shell/1.1.0.M2/spring-cloud-dataflow-shell-1.1.0.M2.jar
# export TARGET=http://your-dataflow-server
./deploy-stream.sh xyz/abc.log
./destroy-stream.sh foo bar baz
```

## Appendix. Deploy Spring Cloud Data Flow Server for Cloud Foundry with PCF Dev

### Start PCF Dev

First of all, we need to downloa PCF Dev from [Pivotal Network](https://network.pivotal.io/products/pcfdev) and install it. It's pretty easy. Please refer the following doc.

* [OSX](https://docs.pivotal.io/pcf-dev/install-osx.html#install-pcf-dev)
* [Linux](https://docs.pivotal.io/pcf-dev/install-linux.html#install-pcf-dev)
* [Windows](https://docs.pivotal.io/pcf-dev/install-windows.html#install-pcf-dev)

After installing, let's start PCF Dev.

```
cf dev start
```

After deploying a few streams, you'll find resources are not enough. I would recommend to use 8GB memory for PCFDev.

```
cf dev start -m 8192
```

After around 10~15 minutes, PCF Dev will be ready and you can login with:

```
cf login -a https://api.local.pcfdev.io --skip-ssl-validation -u admin -p admin -o pcfdev-org
```


### Deploy Spring Cloud Data Flow Server

Next, we'll deploy Spring Cloud Data Flow Server to PCF Dev, which is responsible for deploying and managing streams and tasks.

Spring Cloud Dataflow uses:

* RabbitMQ (or Kafka) as a message broker between streaming apps
* MySQL to persist some states such as stream definitions, task execution histories.
* Redis for analytic services

All three backend services are ready in PCF Dev and you can provision as follows:

```
cf create-service p-mysql 512mb df-mysql
cf create-service p-rabbitmq standard df-rebbitmq
cf create-service p-redis shared-vm df-redis
```

Spring Cloud Data Flow Server and Shell for CLI can be downloaded as a standalone executable Spring Boot App.

```
wget http://repo.spring.io/release/org/springframework/cloud/spring-cloud-dataflow-server-cloudfoundry/1.0.1.RELEASE/spring-cloud-dataflow-server-cloudfoundry-1.0.1.RELEASE.jar
```

Create `manifest.yml` to deploy the server and bind services to it.

``` yaml
---
applications:
- name: dataflow-server
  memory: 1g
  disk_quota: 2g
  path: spring-cloud-dataflow-server-cloudfoundry-1.0.1.RELEASE.jar
  buildpack: java_buildpack
  services:
    - df-mysql
    - df-redis
  env:
    SPRING_CLOUD_DEPLOYER_CLOUDFOUNDRY_URL: https://api.local.pcfdev.io
    SPRING_CLOUD_DEPLOYER_CLOUDFOUNDRY_ORG: pcfdev-org
    SPRING_CLOUD_DEPLOYER_CLOUDFOUNDRY_SPACE: pcfdev-space
    SPRING_CLOUD_DEPLOYER_CLOUDFOUNDRY_DOMAIN: local.pcfdev.io
    SPRING_CLOUD_DEPLOYER_CLOUDFOUNDRY_STREAM_SERVICES: df-rebbitmq
    SPRING_CLOUD_DEPLOYER_CLOUDFOUNDRY_USERNAME: admin
    SPRING_CLOUD_DEPLOYER_CLOUDFOUNDRY_PASSWORD: admin
    SPRING_CLOUD_DEPLOYER_CLOUDFOUNDRY_SKIP_SSL_VALIDATION: true
    MAVEN_REMOTE_REPOSITORIES_REPO1_URL: https://repo.spring.io/libs-snapshot
    SPRING_CLOUD_DEPLOYER_CLOUDFOUNDRY_STREAM_MEMORY: 512
    SPRING_CLOUD_DEPLOYER_CLOUDFOUNDRY_STREAM_DISK: 512
    SPRING_CLOUD_DEPLOYER_CLOUDFOUNDRY_STREAM_INSTANCES: 1
    SPRING_CLOUD_DEPLOYER_CLOUDFOUNDRY_STREAM_BUILDPACK: java_buildpack
    SPRING_CLOUD_DEPLOYER_CLOUDFOUNDRY_STREAM_ENABLE_RANDOM_APP_NAME_PREFIX: false
    SPRING_CLOUD_DEPLOYER_CLOUDFOUNDRY_TASK_SERVICES: df-mysql
    SPRING_CLOUD_DEPLOYER_CLOUDFOUNDRY_TASK_MEMORY: 512
    SPRING_CLOUD_DEPLOYER_CLOUDFOUNDRY_TASK_DISK: 512
    SPRING_CLOUD_DEPLOYER_CLOUDFOUNDRY_TASK_INSTANCES: 1
    SPRING_CLOUD_DEPLOYER_CLOUDFOUNDRY_TASK_BUILDPACK: java_buildpack
    SPRING_CLOUD_DEPLOYER_CLOUDFOUNDRY_TASK_ENABLE_RANDOM_APP_NAME_PREFIX: false
    SPRING_CLOUD_DATAFLOW_FEATURES_EXPERIMENTAL_TASKSENABLED: true
```

Finally, you can deploy with:

```
cf push
```

You can go to Dashboard 😉

http://dataflow-server.local.pcfdev.io/dashboard
