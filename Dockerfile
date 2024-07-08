FROM golang:1.22-alpine

WORKDIR /usr/src/app

COPY go.mod go.sum main.go parcel.go tracker.db ./

RUN go mod tidy 

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /db_test_app

CMD ["/db_test_app"] 


