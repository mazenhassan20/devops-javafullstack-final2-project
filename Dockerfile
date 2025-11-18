# syntax=docker/dockerfile:1.5
# Build Stage
FROM maven:3.9.11-eclipse-temurin-17-alpine AS build
WORKDIR /app

COPY pom.xml .
RUN --mount=type=cache,target=/root/.m2 mvn -B dependency:go-offline

COPY src ./src
RUN --mount=type=cache,target=/root/.m2 mvn -Pdocker -B -DskipTests clean package

# Runtime Stage
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

# Add non-root user
RUN adduser -D -u 1000 appuser

COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080
USER appuser

ENTRYPOINT ["java", "-jar", "/app/app.jar"]
