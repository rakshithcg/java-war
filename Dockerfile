FROM maven:amazoncorretto as build
WORKDIR /javaapp
COPY . .
RUN mvn clean install

FROM openjdk:9
COPY --from=build /javaapp/target/works-with-heroku.1.0.war /usr/local/works-with-heroku.1.0.war
CMD ["java", "-jar", "/usr/local/works-with-heroku.1.0.war"]
