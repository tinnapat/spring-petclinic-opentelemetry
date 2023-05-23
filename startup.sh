export OTEL_METRICS_EXPORTER=none
export OTEL_SERVICE_NAME=spring-petclinic
export OTEL_INSTRUMENTATION_METHODS_INCLUDE=org.springframework.samples.petclinic.owner.OwnerController[addPaginationModel]

java -javaagent:opentelemetry-javaagent.jar -jar target/*.jar
