# Etapa de build con Maven
FROM maven:3.8.6-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean compile exec:java

# Etapa final con Nginx
FROM nginx:alpine
# Copiamos los archivos estáticos generados en /output
COPY --from=build /app/output/ /usr/share/nginx/html
EXPOSE 80



