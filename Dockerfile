FROM golang:1.20

WORKDIR /app

COPY . .
RUN go mod tidy
RUN go get

COPY *.go ./

RUN go build -o /sample-web-app

RUN chmod +x /sample-web-app

EXPOSE 3000

CMD [ "/sample-web-app" ]
