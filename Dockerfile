FROM java:8

ENV KAFKA_MANAGER_VERSION 1.2.9.10

RUN wget -qO- -O tmp.zip https://github.com/sagentio/kafka-manager/releases/download/v$KAFKA_MANAGER_VERSION-mesos/kafka-manager-$KAFKA_MANAGER_VERSION.zip \
	&& unzip tmp.zip -d /opt && rm tmp.zip
RUN ln -s /opt/kafka-manager-$KAFKA_MANAGER_VERSION /opt/kafka-manager

# Add customizable application.conf
ADD conf/application.conf /opt/kafka-manager/conf/application.conf
# Fix logging to stdout using docker conventions
ADD conf/logger.xml /opt/kafka-manager/conf/logger.xml

EXPOSE 9000
ENTRYPOINT [ "/opt/kafka-manager/bin/kafka-manager", "-Dconfig.file=/opt/kafka-manager/conf/application.conf", "-Dlogger.resource=/opt/kafka-manager/conf/logger.xml" ]

