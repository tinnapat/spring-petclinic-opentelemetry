export OTEL_TRACES_EXPORTER=jaeger
export OTEL_EXPORTER_JAEGER_ENDPOINT=http://localhost:14250
export OTEL_PROPAGATORS=b3multi,jaeger
export OTEL_METRICS_EXPORTER=none
export OTEL_SERVICE_NAME=spring-petclinic

java -javaagent:opentelemetry-javaagent.jar -jar target/*.jar
