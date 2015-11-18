# Kafka Manager Docker image

Docker image for running Kafka Manager. This version includes fixes from https://github.com/stealthly that add Mesos kafka support.

## Usage
By default it exposes the webinterface on port 9000. Logging is all sent to console / stdout.

```
docker run -d -p 9000:9000 -e ZK_HOSTS="<yourhost>:2181" sagent/kafka-manager
```

## Environment variables

You can configure the following environment variables to configure Kafka Manager

Variable Name       | Configuration Option
------------------------------------
APPLICATION_SECRET  | The secret key is used to secure cryptographics functions
ZK_HOSTS            | Location of your zookeeper quorem (default localhost:2181)