FROM golang:alpine as build
WORKDIR /opt/app
ADD . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=arm64 go build

FROM scratch
WORKDIR /opt/app
COPY --from=build opt/app/docker-demo-2 ./
EXPOSE 9000
ENTRYPOINT ./docker-demo-2
