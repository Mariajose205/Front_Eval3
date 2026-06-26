# Etapa de build con Maven y Java 17
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean compile exec:java

# Etapa final con Nginx
FROM nginx:alpine
COPY --from=build /app/output/ /usr/share/nginx/html
EXPOSE 80




