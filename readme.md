# Spring PetClinic Sample Application

## Understanding the Spring Petclinic application with a few diagrams
<a href="https://speakerdeck.com/michaelisvy/spring-petclinic-sample-application">See the presentation here</a>

## Pre-requisite
You need following sofrware on your machine.
- JDK 17
- [Docker](https://www.docker.com/)
- Git client

## Running Jaeger

Start Jaeger using all-in-one docker image.

```
docker run -d --name jaeger \
  -e COLLECTOR_ZIPKIN_HOST_PORT=:9411 \
  -e COLLECTOR_OTLP_ENABLED=true \
  -p 6831:6831/udp \
  -p 6832:6832/udp \
  -p 5778:5778 \
  -p 16686:16686 \
  -p 4317:4317 \
  -p 4318:4318 \
  -p 14250:14250 \
  -p 14268:14268 \
  -p 14269:14269 \
  -p 9411:9411 \
  jaegertracing/all-in-one:latest
```

## Run Petclinic locally
Spring Petclinic is a [Spring Boot](https://spring.io/guides/gs/spring-boot) application built using [Maven](https://spring.io/guides/gs/maven/) or [Gradle](https://spring.io/guides/gs/gradle/). You can build a jar file and run it from the command line (it should work just as well with Java 17 or newer):


```bash
git clone https://github.com/tinnapat/spring-petclinic-opentelemetry.git
cd spring-petclinic-opentelemetry
./mvnw package

java -javaagent:opentelemetry-javaagent.jar \
  -Dotel.service.name=spring-petclinic \
  -Dotel.metrics.exporter=none; \
  -jar target/*.jar
```
**Note**: You need to start Jaeger before starting spring-petclinic.

You can then access petclinic at http://localhost:8080/

<img width="1042" alt="petclinic-screenshot" src="https://cloud.githubusercontent.com/assets/838318/19727082/2aee6d6c-9b8e-11e6-81fe-e889a5ddfded.png">

You can browser through each menu and add more data.
Or you can run it from Maven directly using the Spring Boot Maven plugin. If you do this, it will pick up changes that you make in the project immediately (changes to Java source files require a compile as well - most people use an IDE for this):

Tracing can be viewed via Jaeger UI which can be access via http://localhost:16686. 

The service name is `spring-petclinic`.

> NOTE: If you prefer to use Gradle, you can build the app using `./gradlew build` and look for the jar file in `build/libs`.

