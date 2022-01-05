FROM registry.ci.openshift.org/stolostron/builder:go1.17-linux AS builder

WORKDIR /go/src/github.com/stolostron/helloprow-go
COPY . .
RUN CGO_ENABLED=0 go build -trimpath -o main cmd/hello/main.go


FROM scratch

WORKDIR /opt/app/
COPY --from=builder /go/src/github.com/stolostron/helloprow-go/main ./main

EXPOSE 4321
ENTRYPOINT ["/opt/app/main"]
CMD ""
