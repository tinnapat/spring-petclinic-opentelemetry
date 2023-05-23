export OTEL_METRICS_EXPORTER=none
export OTEL_SERVICE_NAME=spring-petclinic

java -javaagent:opentelemetry-javaagent.jar -jar target/*.jar
