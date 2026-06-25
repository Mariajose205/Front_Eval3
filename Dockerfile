# Etapa de build con Maven y Java
FROM maven:3.8.5-openjdk-17 AS build

WORKDIR /app
COPY . .

# Compilar y generar archivos estáticos
RUN mvn clean package

# Etapa final con Nginx para servir archivos estáticos
FROM nginx:alpine
COPY output/ /usr/share/nginx/html

EXPOSE 80

