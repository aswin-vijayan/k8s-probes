docker run -d --name postgres \
  -p 5432:5432 \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_PASSWORD=postgres123 \
  -e POSTGRES_DB=hellodb \
  postgres:15-alpine

docker run -d \
  -p 9090:8080 \
  -e DB_URL=jdbc:postgresql://host.docker.internal:8080/hellodb \
  -e DB_USERNAME=postgres \
  -e DB_PASSWORD=postgres123 \
  java-app:1

docker run -d --name hello-app-no-db \
  -p 8080:8080 \
  java-app:1