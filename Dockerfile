#编译阶段
FROM golang:1.15.7-alpine3.13 AS buildStage
WORKDIR /go/src
ADD . /go/src
RUN cd /go/src  && go build -o main
CMD ["/go/src/main"]

#打包阶段
FROM alpine:latest
WORKDIR /app
COPY --from=buildStage /go/src/main /app/
ENTRYPOINT ./main

