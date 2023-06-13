FROM maven:amazoncorretto as build
WORKDIR /javaapp
COPY . .
RUN mvn clean install

FROM openjdk:9
COPY --from=build /javaapp/target/*.war /usr/local/*.war
CMD java -jar 
