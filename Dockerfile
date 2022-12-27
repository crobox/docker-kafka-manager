FROM openjdk:8

ENV KAFKA_MANAGER_VERSION 3.0.0.6

RUN git clone https://github.com/yahoo/CMAK.git --branch $KAFKA_MANAGER_VERSION && cd CMAK \
	&& ./sbt clean dist \
	&& unzip /CMAK/target/universal/cmak-$KAFKA_MANAGER_VERSION.zip -d /opt \
	&& rm -r /root/.sbt /root/.ivy2 /CMAK

RUN ln -s /opt/cmak-$KAFKA_MANAGER_VERSION /opt/kafka-manager

# Fix logging to use only stdout
ADD logback.xml /opt/kafka-manager/conf/logback.xml

EXPOSE 9000

WORKDIR "/opt/kafka-manager"

ENTRYPOINT [ "./bin/kafka-manager", "-Dapplication.home=/opt/kafka-manager"]
