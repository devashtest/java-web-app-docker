FROM maven:3.9.9-amazoncorretto-11 AS build
WORKDIR /app
COPY . .
RUN mvn clean package
FROM tomcat:9.0-jdk11
COPY --from=build /app/target/java-web-app*.war /usr/local/tomcat/webapps/java-web-app.war
