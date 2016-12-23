# Kafka Manager docker image

Docker image for running Kafka Manager. This version includes the PR from https://github.com/yahoo/kafka-manager/pull/282#issuecomment-247634191 for Kafka 0.10 support

## Usage
By default it exposes the webinterface on port 9000. Logging is all sent to console / stdout.

```
docker run -d -p 9000:9000 -e ZK_HOSTS="<yourhost>:2181" crobox/kafka-manager
```

## Environment variables

You can configure the following environment variables to configure Kafka Manager

Variable Name       | Configuration Option
--------------------|---------------------------------------------------------
ZK_HOSTS            | Location of your zookeeper quorem (default localhost:2181)

## Arguments

It's also possible to pass arguments to the manager. f.e. to use another http port use `-Dhttp.port=9999`