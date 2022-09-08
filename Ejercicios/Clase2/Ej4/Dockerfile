FROM amazoncorretto:11-alpine

RUN addgroup -g 1001 -S appuser && adduser -u 1001 -S appuser -G appuser
COPY --chown=appuser:1001 passwordapi.jar /usr/src/myapp/passwordapi.jar
WORKDIR /usr/src/myapp

EXPOSE 8080

USER appuser

CMD ["java", "-jar", "passwordapi.jar"]